source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'sqlite3'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml', '~> 4.0.3'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'bcrypt-ruby', '~> 3.0.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
  gem 'thin'
end

group :development do
	gem 'thin'
	gem 'capistrano'
	gem 'debugger'
end

group :production do
	gem 'unicorn'
	gem 'rails_12factor'
	gem 'therubyracer', platforms: :ruby
end
