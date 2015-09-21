---
layout: post
title: "[Horse Noises]"
date: 2014-10-07 13:33:00
tags: update, pvl, eqbeats, bronytunes, android, app, beta, code
---

So, I have a lot of side projects. The three big ones right now are Android apps for [Ponyville Live!](http://ponyvillelive.com), [BronyTunes](http://bronytunes.com), and [EqBeats](http://eqbeats.org). A lot of people are wondering how those are progressing, so I figured I'd give a writeup about the roadmap.

<!-- break -->

[TL;DR - Work is happening](#tldr)

First of all, they all depend on a project I started called [Neigh](https://www.github.com/berwyn/neigh), which houses all the code to actually play music, since it's basically the same in all of them. Given that info, let's recap where these projects are all sitting.

---

#### Neigh
Neigh has three roles:

- to play music 
- to queue tracks as a playlist
- to keep the app using it up-to-date about what's currently playing. 
    
Right now, The first two parts are ready to go, and the last one is in progress. When that's done, I can really dig in and make some real progress on the actual music apps.

The big blocker right now is that I've chosen to release this into the wild as something others can use. Part of this is creating a little demo app that has two purposes.

1. It gives an example of how to use the project to others
2. It helps me to solidify what the integration points look like to developers.

It's nothing special and is mostly done, but it's already been an enormous help in architecting the project.

---

{<1>}![PVL logo](/content/images/2014/Oct/Azura-Abbreviated-Modern-with-Outline.png)
#### Ponyville Live!
PVL has the most work done on it. It can query the server for any info it needs, and has the structure in place to play any audio station. It's just waiting on Neigh in that regard.

So what needs done?

Currently, the "now playing" portion of the app is rough at best, and it could use some love. There's also nothing in place yet to display the show currently playing on a station, or to look at the show list. These need to be done before the app is released.

The release version of the app will ___not___ support video stations, convention listings, or any news feed. These will be added as updates after the app launches.

There will also be integration with a secret project I'm cooking up that'll come post-launch, but that's hush-hush for now :p

---

{<2>}![BronyTunes logo](/content/images/2014/Oct/bronytunes.png)
#### BronyTunes
BronyTunes has quite a bit of skeleton in place, and is able to get any data it needs from the server. The problem is right now that there's no way to display it.

Currently, I'm working with mockups to figure out how I want the app to look.

"But wait," you might say, "didn't you already mock up parts of the app?".

Why yes, yes I did!

<blockquote 
	class="twitter-tweet" 
    lang="en"
    align="center"
    data-dnt="true">	
<p>Nope! Definitely no <a href="https://twitter.com/BronyTunesApp">@BronyTunesApp</a> mockups and plans going on here! Not at all! <a href="http://t.co/ytZ4iwsQvR">pic.twitter.com/ytZ4iwsQvR</a></p>&mdash; berewolf (@_berwyn_) <a href="https://twitter.com/_berwyn_/status/456251915890728960">April 16, 2014</a></blockquote>

<blockquote 
	class="twitter-tweet" 
    lang="en"
    align="center"
    data-dnt="true">
<p>Man, this is quick when you get back in the flow :D. Tack grid done! /cc <a href="https://twitter.com/BronyTunesApp">@BronyTunesApp</a> <a href="http://t.co/mTrHRVMUDJ">pic.twitter.com/mTrHRVMUDJ</a></p>&mdash; berewolf (@_berwyn_) <a href="https://twitter.com/_berwyn_/status/456263134475341824">April 16, 2014</a></blockquote>

But I'm not happy with the result, and there's much more to the app than what's mocked up there. I'm revisiting that stuff and working on other parts of the app, though none of that should take overly long.

As for functional parts of the app, Neigh will take care of media playback, to a degree. I want to look into supporting music caching and offline playback, and I need to work on supporting BronyTunes Radio, both of which will require some work on the BronyTunes side of things. I also want to work on caching a lot of the data the server provides so that I don't have to load a buttload of data every time the app starts up.

Search is also something that needs to be looked at. Having access to the BronyTunes library is great, but it means nothing if you can't find the stuff you're looking for. I'm working on an approach to this that hopefully doesn't suck, and it's going to be a major target for beta testers when the time comes (more on that later).

---

{<3>}![EqBeats logo](/content/images/2014/Oct/eqbeats.png)
#### EqBeats
EqBeats has had a fair bit of time, both in code and in design, heavily invested in it. Some of the basics are already working, and it had media playback that eventually turned into Neigh.

So, even though it's close to ready to go (as far as the basics are concerned), it needs to be revisited. The media stuff needs to be pulled out and migrated to Neigh. One of the core components of EqBeats is also the search feature, and that needs to be added before I'm willing to release the app. This could be quick, it might not be. Web-based search is one thing I haven't handled before.

---

{<4>}![top secret](/content/images/2014/Oct/topsecret.jpg)
#### Betas
Now, the part that will most interest people, getting their hands on these apps. When I feel like each app is ready to be tested, I'll be making a Google+ group for that app and using the Play Store's official beta programme.

"How does that work," you ask? Easy!

1. You'll need to join the Google+ group I make. This _does_ mean you'll need a Google+ account.
2. There will be a link in the group you'll need to open. This will opt you in to the beta test.
3. Now you can find the app on the Play Store, install it, and test it!

Pretty simple!

When the beta for an app is ready to launch, I'll have the app's Twitter announce it, so make sure to follow [@PonyvilleLive](https://twitter.com/ponyvillelive), and [@BronyTunesApp](https://twitter.com/bronytunesapp). EqBeats folk, you can listen on my [personal Twitter](https://twitter.com/_berwyn_).

---
<a name="tldr"></a>

{<5>}![tl;dr](/content/images/2014/Oct/mlfw1012_46183_-_animated_did_not_read_lol_gif_image_macro_lol_didnt_read_meme_rainbow_dash_tldr.gif)

#### Neigh:
- [✓] Music player
- [✓] Music queue
- [ ] Application bindings

#### Ponyville Live!:
- [✓] Station list
- [ ] Stream selection
- [ ] Neigh integration
- [/] "Now playing"
- [/] Show information

#### Bronytunes:
- [✓] Library data
- [ ] Neigh integration
- [ ] BronyTunes Radio
- [ ] Library cache
- [?] Offline playback

#### EqBeats:
- [✓] Library data
- [ ] Upgrade to Neigh
- [ ] Search

#### Beta(s) Soon™