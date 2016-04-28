---
layout: post
title: "Blogs - That Thing You Want to Do but Don't"
date: 2014-07-01 00:00:00
tags: jekyll, procrastination, ponies, github pages, ruby, golang, hugo, nodejs, ghost, azure, blogging
---
Like many other people on the internet, I have the strange desire to write a blog. Also like many other people on the internet, I never manage to _actually do_ one.

<!-- break -->

__tl;dr - Ghost is a fantastic blogging platform!__

In my case, my problem has been with my blogging platform. Until now, I was using [Jekyll](http://jekyllrb.com/) and [Github Pages](https://pages.github.com/) to host my blog. This was cool because it was a nice static site generator, a good CDN-backed host, and the blog was version controlled. Cool stuff! However, it proved the wrong tool for a variety of reasons two of which chiefly stood out.

1) Jekyll wasn't friendly to hacking. There was a lot of indirection and lots of work to do basic customisations.

2) Jekyll + Github Pages doesn't have a cohesive workflow. Just to write and preview posts, you need to have Ruby installed, have a server running in watch mode (and that's apart from Sublime Text not having spell check or grammar awareness)

Knowing this, I tried to move to [Hugo](http://spf13.com/project/hugo), a static site generator written in [Go](http://golang.org), a language I'm finding myself deeply in love with. The problem there is that the framework is too young, and it was a pain to try to setup.

Ultimately, I've settled on [Ghost](http://ghost.org), an up-and-coming blog platform built in [Node JS](http://nodejs.org). It's got a fantastic web editor and preview tool (and benefits from your browser's editor tools!), built-in file managing for things like images, and easy customisation. Everything I wanted to begin with!

Just one problem, Github pages doesn't make anything outside of Jekyll easy to work with. Enter [Microsoft Azure](http://azure.microsoft.com) (née Windows Azure), which even has a Ghost template!

In just a few minutes, I had my content ported over and a new post written. Algebraic!

Now that I have a decent platform, I'm hoping to start enforcing a more decent cadence for blog posts, hopefully with some discussion of more Node JS and [Android L](https://developer.android.com/preview/index.html), [TV](http://www.android.com/tv) and [Wear](http://www.android.com/wear) in the near future!

Until next time, have a cute miniature horse:

![](/images/ponies/astrowoona_by_fongsaunder_d4dhcz1.png)