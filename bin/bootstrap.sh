#!/usr/bin/env bash

# Essentials
apt-get update && apt-get upgrade
apt-get install -y build-essentials bison openssl libreadline6 \
libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev \
libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf \
libc6-dev ncurses-dev nginx

# RVM
curl -L https://get.rvm.io | bash -s stable --ruby=2.0.0
rvm use 2.0.0 --default

# Setup user groups
useradd -s /sbin/nologin -r nginx
usermod -a -G web nginx

# Configure nginx
mkdir /var/www
chgrp -R web /var/www
chmod -R 775 /var/www
usermod -a -G web "$(id -u -n)"

CONF=$( cat <<EOF
# This is example contains the bare mininum to get nginx going with
# Unicorn or Rainbows! servers.  Generally these configuration settings
# are applicable to other HTTP application servers (and not just Ruby
# ones), so if you have one working well for proxying another app
# server, feel free to continue using it.
#
# The only setting we feel strongly about is the fail_timeout=0
# directive in the "upstream" block.  max_fails=0 also has the same
# effect as fail_timeout=0 for current versions of nginx and may be
# used in its place.
#
# Users are strongly encouraged to refer to nginx documentation for more
# details and search for other example configs.

# you generally only need one nginx worker unless you're serving
# large amounts of static files which require blocking disk reads
worker_processes 1;

# # drop privileges, root is needed on most systems for binding to port 80
# # (or anything < 1024).  Capability-based security may be available for
# # your system and worth checking out so you won't need to be root to
# # start nginx to bind on 80
user nginx web; # for systems with a "nogroup"
# user nobody nobody; # for systems with "nobody" as a group instead

# Feel free to change all paths to suite your needs here, of course
pid /var/run/nginx.pid;
error_log /var/log/nginx.error.log;

events {
  worker_connections 1024; # increase if you have lots of clients
  accept_mutex off; # "on" if nginx worker_processes > 1
  use epoll; # enable for Linux 2.6+
  # use kqueue; # enable for FreeBSD, OSX
}

http {
  # nginx will find this file in the config directory set at nginx build time
  include mime.types;

  # fallback in case we can't determine a type
  default_type application/octet-stream;

  # click tracking!
  access_log /path/to/nginx.access.log combined;

  # you generally want to serve static files with nginx since neither
  # Unicorn nor Rainbows! is optimized for it at the moment
  sendfile on;

  tcp_nopush on; # off may be better for *some* Comet/long-poll stuff
  tcp_nodelay off; # on may be better for some Comet/long-poll stuff

  # we haven't checked to see if Rack::Deflate on the app server is
  # faster or not than doing compression via nginx.  It's easier
  # to configure it all in one place here for static files and also
  # to disable gzip for clients who don't get gzip/deflate right.
  # There are other gzip settings that may be needed used to deal with
  # bad clients out there, see http://wiki.nginx.org/NginxHttpGzipModule
  gzip on;
  gzip_http_version 1.0;
  gzip_proxied any;
  gzip_min_length 500;
  gzip_disable "MSIE [1-6]\.";
  gzip_types text/plain text/html text/xml text/css
             text/comma-separated-values
             text/javascript application/x-javascript
             application/atom+xml;

  # this can be any application server, not just Unicorn/Rainbows!
  upstream app_server {
    # fail_timeout=0 means we always retry an upstream even if it failed
    # to return a good HTTP response (in case the Unicorn master nukes a
    # single worker for timing out).

    # for UNIX domain socket setups:
    server unix:/path/to/.unicorn.sock fail_timeout=0;

    # for TCP setups, point these to your backend servers
    # server 192.168.0.7:8080 fail_timeout=0;
    # server 192.168.0.8:8080 fail_timeout=0;
    # server 192.168.0.9:8080 fail_timeout=0;
  }

  server {
    # enable one of the following if you're on Linux or FreeBSD
    listen 80 default deferred; # for Linux
    # listen 80 default accept_filter=httpready; # for FreeBSD

    # If you have IPv6, you'll likely want to have two separate listeners.
    # One on IPv4 only (the default), and another on IPv6 only instead
    # of a single dual-stack listener.  A dual-stack listener will make
    # for ugly IPv4 addresses in $remote_addr (e.g ":ffff:10.0.0.1"
    # instead of just "10.0.0.1") and potentially trigger bugs in
    # some software.
    # listen [::]:80 ipv6only=on; # deferred or accept_filter recommended

    client_max_body_size 4G;
    server_name _;

    # ~2 seconds is often enough for most folks to parse HTML/CSS and
    # retrieve needed images/icons/frames, connections are cheap in
    # nginx so increasing this is generally safe...
    keepalive_timeout 5;

    # path for static files
    root /var/www;

    # Prefer to serve static files directly from nginx to avoid unnecessary
    # data copies from the application server.
    #
    # try_files directive appeared in in nginx 0.7.27 and has stabilized
    # over time.  Older versions of nginx (e.g. 0.6.x) requires
    # "if (!-f $request_filename)" which was less efficient:
    # http://bogomips.org/unicorn.git/tree/examples/nginx.conf?id=v3.3.1#n127
    try_files $uri/index.html $uri.html $uri @app;

    location @app {
      # an HTTP header important enough to have its own Wikipedia entry:
      #   http://en.wikipedia.org/wiki/X-Forwarded-For
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

      # enable this if you forward HTTPS traffic to unicorn,
      # this helps Rack set the proper URL scheme for doing redirects:
      proxy_set_header X-Forwarded-Proto $scheme;

      # pass the Host: header from the client right along so redirects
      # can be set properly within the Rack application
      proxy_set_header Host $http_host;

      # we don't want nginx trying to do something clever with
      # redirects, we set the Host: header above already.
      proxy_redirect off;

      # set "proxy_buffering off" *only* for Rainbows! when doing
      # Comet/long-poll/streaming.  It's also safe to set if you're using
      # only serving fast clients with Unicorn + nginx, but not slow
      # clients.  You normally want nginx to buffer responses to slow
      # clients, even with Rails 3.1 streaming because otherwise a slow
      # client can become a bottleneck of Unicorn.
      #
      # The Rack application may also set "X-Accel-Buffering (yes|no)"
      # in the response headers do disable/enable buffering on a
      # per-response basis.
      # proxy_buffering off;

      proxy_pass http://app_server;
    }

    # Rails error pages
    error_page 500 502 503 504 /500.html;
    location = /500.html {
      root /vagrant/public;
    }
  }
}
EOF
)
if [ -e "/etc/nginx/nginx.conf" ]
then
  rm -f /etc/nginx/nginx.conf
fi
touch /etc/nginx/nginx.conf
echo "${CONF}" > /etc/nginx/nginx.conf

service nginx start

# Unicorn
gem install unicorn
ln -s /vagrant /var/www
cd /vagrant
UNICORN=$( cat <<EOF
# Sample verbose configuration file for Unicorn (not Rack)
#
# This configuration file documents many features of Unicorn
# that may not be needed for some applications. See
# http://unicorn.bogomips.org/examples/unicorn.conf.minimal.rb
# for a much simpler configuration file.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

# Use at least one worker per core if you're on a dedicated server,
# more will usually help for _short_ waits on databases/caches.
worker_processes 4

# Since Unicorn is never exposed to outside clients, it does not need to
# run on the standard HTTP port (80), there is no reason to start Unicorn
# as root unless it's from system init scripts.
# If running the master process as root and the workers as an unprivileged
# user, do this to switch euid/egid in the workers (also chowns logs):
# user "unprivileged_user", "unprivileged_group"

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
working_directory "/vagrant" # available in 0.94.0+

# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen "/path/to/.unicorn.sock", :backlog => 64
listen 8080, :tcp_nopush => true

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# feel free to point this anywhere accessible on the filesystem
pid "vagrant/tmp/pid/unicorn.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path "/vagrant/log/unicorn.stderr.log"
stdout_path "/vagrant/log/unicorn.stdout.log"

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  # The following is only recommended for memory/DB-constrained
  # installations.  It is not needed if your system can house
  # twice as many worker_processes as you have configured.
  #
  # # This allows a new master process to incrementally
  # # phase out the old master process with SIGTTOU to avoid a
  # # thundering herd (especially in the "preload_app false" case)
  # # when doing a transparent upgrade.  The last worker spawned
  # # will then kill off the old master process with a SIGQUIT.
  # old_pid = "#{server.config[:pid]}.oldbin"
  # if old_pid != server.pid
  #   begin
  #     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
  #     Process.kill(sig, File.read(old_pid).to_i)
  #   rescue Errno::ENOENT, Errno::ESRCH
  #   end
  # end
  #
  # Throttle the master from forking too quickly by sleeping.  Due
  # to the implementation of standard Unix signal handlers, this
  # helps (but does not completely) prevent identical, repeated signals
  # from being lost when the receiving process is busy.
  # sleep 1
end

after_fork do |server, worker|
  # per-process listener ports for debugging/admin/migrations
  # addr = "127.0.0.1:#{9293 + worker.nr}"
  # server.listen(addr, :tries => -1, :delay => 5, :tcp_nopush => true)

  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis.  TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)
end
EOF
)
if [ -e "config/unicorn.rb" ]
then
  rm -f config/unicorn.rb
fi
touch config/unicorn.rb
echo "${UNICORN}" >> config/unicorn.rb

unicorn_rails -c /vagrant/config/unicorn.rb -D -E development