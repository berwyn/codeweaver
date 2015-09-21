---
layout: post
title: "The Windows Incident - Day 2"
date: 2014-11-03 20:27:00
tags: windows, tablet, technology, windows 8, the windows incident, development
---
	"When a train goes through a tunnel and it gets dark, you don't throw away the ticket and jump off. You sit still and trust the engineer."
	-- Corrie Ten Boom
	
<!-- break -->

### The demons are banished

Last I wrote, Asus was a foul demon making me want to ditch their tablet. As of today, I've changed my mind.

After taking some time to update the tablet and drivers, it's a pretty decent little machine. Much like the experience I received in the Microsoft Store, the tablet is pretty snappy, the touchscreen responsive, and everything works like a champ.

Well, _almost._

### All aboard

Now that the tablet seemed to be working, I started loading up a few basic apps so I could get a feel for the user experience on touch devices. Coming from a Windows 8 PC, I knew what to expect from the apps, but coming from the perspective of an Android user I wasn't quite show what to expect interacting with the tablet.

I suddenly take for granted all the UX improvements Microsoft made for mouse and keyboard users in Windows 8.1.

Closing apps, as well as accessing the "right-click" menu (if you can call it that) are _not_ very discoverable gestures. They _work_, and splendidly at that, but they are certainly far from what I'd try. Now, I already knew about these gestures, but I didn't realise how frustrating they are to actually _use_. There's more than one app where I would attempt to close it from dragging from the top bezel towards the bottom of the screen, only to receive the right-click menu (I'm looking at you, Windows Store).

This makes for a pretty frustrating experience, but it's surmountable. After awhile, you figure out that you can just complete the gesture anyway and most of the time Windows will figure out what you're trying to do.

_Whatever._

Switching between apps is also incredibly fluid, though I really wish there was an easy single gesture to open the app switcher, rather than having to flick out and then towards the edge. No major complaints whatsoever.

What was a real eye-opener, though, was the ability to multi-task and have apps side-by-side. It's an absolutely stellar experience to have, for example, a Reddit app open and then have it open links in a half-screen IE. Now, there's been apps that emulate this behaviour on Android and iOS (my favourite on Android is [Reddit News](https://play.google.com/store/apps/details?id=free.reddit.news)!), but I truly enjoyed having a full browser right there. It was especially helpful for browsing to other pages, something apps handle with varying levels of grace. Being able to snap things like Twitter and Skype next to my browser was also nice, letting me chat while surfing the web.

But let's circle back to Skype.

_Oh Skype._

{<1>}![](/content/images/2014/Nov/605-y-u-no-guy.jpg)

### Microsoft, why have you forsaken me?

You would expect that, as a first-party platform, Skype for Windows 8 would be a pretty good experience.

You would be pretty wrong about that.

Now, I use Skype for Windows 8 on my Windows 10 desktop. It's lacking in features compared to its desktop counterpart, but it works just as effectively as any mobile client. So, why doesn't it work just as well on _all devices_? For whatever reason, Skype absolutely barfs when running on my tablet. It has issues syncing group conversations, messages show up long after my Nexus 5 or Nexus 7 have alerted me, the overview screen won't update (sometimes leaving conversations marked as read/unread for several hours after their status has changed), and more.

None of this happens on my Android clients.

None of this happens on my _Windows PC_.

Why is my tablet an issue?

And the thing is, this isn't the only Microsoft app giving me grief. I own an Xbox One, and have found SmartGlass to be pretty fantastic for using to input text in addition to acting as a remote when my Kinect is being a spaz. I was hoping that the app would be more stable on Windows 8, and it certainly was. But it was a _lot slower_ than its Android counterpart. The app is slow to launch, slow to navigate between sections, overall slow. Compare this to the Android app that has a few hiccups, and I find myself using my phone over my shiny new Windows tablet.

Silly Microsoft, your apps are supposed to be _better_ on their native platform!

{<2>}![](/content/images/2014/Nov/mlfw2168_large.jpg)

Oh, and can we talk navigation?

### Baby go back!

	"You can love someone so much... But you can never love people as much as you can miss them."
	-- John Green

I never realised until today just how awesome Android's back button is. We'll set aside the fact that I keep reaching for software keys that aren't there, and instead focus on how difficult it can be to navigate your average Windows Store app.

Or rather, why the "up" paradigm is somewhat flawed, since Android has much of the same issue.

You see, in most Windows Store apps (and a good chunk of Android apps these days), you have this nifty back arrow in the top-right of your app. On Android, this is supposed to mean "Take me up a level", sort of like a folder structure. In contrast, the back button means "take me back to wherever the crap I was before".

In Windows, I'm not even quite sure where that back button is supposed to take me. Sometimes, it takes me up a level to a logical parent. Sometimes it takes me back to the last screen. When I press that back button, I'm never quite sure _what's_ going to pop on my screen.

In Skype, it acts as a back button.

In SmartGlass, it acts as an up button.

I'm still not quite sure what the Twitter app does, seemingly a bit of both...

All the UI confusion aside, what I really miss is a true "take me back" button. Something to let me go back to Twitter after I've clicked a link and viewed the page (because you can't snap apps while in portrait mode on this tablet). There are any number of situations where I just wanted to go back to the last app I was in. Granted, you have the quick task switching afforded by the left bezel gestures, but it would still be great to just have a system-wide back button.

### On the subject of debugging

I started sinking my teeth into Windows Store development today. I have to say, I did miss Visual Studio. After installing ReSharper and setting the keybindings to the IntelliJ ones I'm used to, Visual Studio is quite the enjoyable IDE. Installing VS 2013 and the needed SDKs was simple and straigh forward, and Microsoft's templates are pretty comprehensive when it comes to kickstarting on the platform (assuming you're already familiar with C# and XAML). The thing that was least intuitive, though, was setting up remote debugging.

You see, I got this tablet so I could properly test my Windows Store apps on touch devices, as well as small form factor. I had hoped it might be like Android where I plunk a USB cable between my device and my computer, toggle a setting on and have at it.

Turns out, that's not even close to the truth. In fact, you can't even use USB (Which was a silly hope, I admit).

What wasn't readily apparent, though, was that I had to install a small client on my tablet and inform VS of my IP address. It took a bit of Google-fu, but was insanely simple to setup once I found the executable I needed.

So far, I've been pretty impressed with the setup, even if it could use some better setup documentation. I don't know if Microsoft just expected everyone to develop on all the target devices they wanted, or to just not debug on a remote device frequently, but the steps to set up remote debugging should be easily found at bare minimum.

Anyway, I'm significantly happier with this purchase than I was initially, but I'm still concerned with how hostile that initial setup was to your average consumer. I'm also incredibly concerned about my original plan to throw Windows 10, which is already pretty unstable, onto a tablet of questionable stability.

For now, I think I'll stick to 8.1 and explore the SDK.

Until next time, I bid you all adieu, and leave you with this example of how I feel about hopping back into C# after a couple years away.

{<3>}![](/content/images/2014/Nov/b7e.jpg)