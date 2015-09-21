---
layout: post
title: "The Windows Incident - Day 0"
date: 2014-11-01 22:31:00
tags: windows, tablet, technology, windows 8, asus, high-brow literary references, the windows incident, development 
---
##### The demon Asus has deceived me

###### Edit: Hello, Hacker News! Don't hurt my poor box too much!

Today I was at a Microsoft store, looking for a low-cost tablet to use for development work. Having used the tablets in store, and hearing of a five week wait for HP's [Stream 7](http://store.hp.com/webapp/wcs/stores/servlet/ContentView?eSpotName=Stream7&storeId=10151&langId=-1&catalogId=10051), I decided to pick up Asus' mouthful of a tablet, the [VivoTab Note 8](http://www.asus.com/us/Tablets_Mobile/ASUS_VivoTab_Note_8_M80TA/).

<!-- break -->

## What you see vs what you get

In-store, the tablet was fast, responsive, everything I'd expect. I purchased the device, pleased with the low price point relative to the amount of hardware I was receiving.

It was then that I learned how different a device can be out-of-the-box.

The tablet comes with a stylus built by Wacom, known as the king of pen tablet input. It features a no-battery-needed design, 256 levels of pressure sensitivity, and Wacom pen tablets are usually insanely accurate.

The device I was using was none of this. I first turned it on, and was greeted by the usual Windows 8 setup process. All's well, right? Well, turns out I couldn't use the touchscreen. The tablet was _only_ responding to the pen, and not finger input. Not only this, but the pen would miss clicks, and the cursor would drift a fair ways from were the tip of the pen was actually at.

Suddenly, flashbacks to the 90's and one of these babies ensued.

{<1>}![Palm Treo](/content/images/2014/Nov/palm-treo750_00.jpg)

## Demon in the machine

After tapping and swiping my way through the initial setup, a real pain with only the stylus, the system rebooted to finish setting up my account. When it finished booting, the strangest thing occurred. Suddenly, I could use the bloody touchscreen! Zonkers! I figured that the tablet I purchased may have had older, buggier drivers than the one in the store, so the first thing I did was open Windows Update.

Windows Update then informed me that I had no internet connection.

Now, not two minutes before I had successfully connected to my WiFi and setup my tablet. Why was it not connecting now? I pulled open the WiFi settings and found that Windows was having issues connecting to my 5GHz network (with the world's most generic error, might I add). Alright, fine, I keep my usual 2.4GHz around for cases just like these. I go to connect the device to that network, and a century later it finally decided to connect.

Alright, back in business.

I have the tablet check for updates, and in the meantime fetch myself a beverage. When I come back, the tablet has turned the screen of and locked itself. Normally, this wouldn't be significant, except the crappy power button took forever to respond to my press. Whatever. I go to swipe the screen up and put my password in.

But the screen won't accept finger input.

{<2>}![iMad](/content/images/2014/Nov/lyra_table.gif)

Well, I tap my way back to Windows Update to see what the consensus is.

##### __I can't install updates because I need to install Windows 8.1__

## From Hell's heart I stab at thee

At this point, I need finger input. I sleep the tablet. I wake it, waiting ten centuries for the power button to respond. Finger input is still no-go.

Well fine, Asus, we'll play your little game.

I restarted the tablet, did battle to get it on my WiFi, opened the Windows Store, and started the Windows 8.1 installer. We'll see if the tablet is any better when that's done.

But first, let's consider something.

Windows 8.1, the first major update to Windows 8, was released to device manufacturers August 27th, 2013. It was released to the general public on October 17th, 2013. I bought my tablet on November 1st, 2014. Now, according to the Microsoft Store employee when I bought this tablet, it was fresh off the truck. Made in October 2014. A year after Windows 8.1 came out.

So why didn't it come with 8.1 pre-installed?

Compatibility? 8.1 is essentially a service pack on top of Windows 8, I can't think of anything that it broke.

Licensing? 8.1 is available for every Windows 8 device free-of-charge, and recommended to OEMs in place of vanilla Windows 8.

OEM "customisation"? This is a "Signature Device", meaning it only has Windows 8 and Office on it.

__So why does this tablet that I _just purchased_ have a build of Windows from two years ago running on it?__

## You can find me on the seventh circle

If this is the first experience people have with Windows tablets, I can suddenly see why they're not doing so well.

Now, I'm coming into this as a tech-savvy individual, as a developer, as someone who enjoys Windows 8 (and eagerly awaiting Windows 10!), but most importantly, I'm coming into this as a spoiled Android user who buys Nexus devices.

For those of you who don't know, the Nexus programme is a series of devices where Google works very closely with the manufacturer to create the flagship device for each release of Android. A part of this is a "Google Play Edition" build of Android, which is as vanilla as you get, and with only Google's core apps pre-loaded. 

When you first buy a Nexus device, you're greeted to a short and simple setup process, and then set free to use the device as you see fit. Never have I had issues with setting up a Nexus device, and as Google's blessed children, these devices usually have some of the smoothest out-of-box experiences you could ask for.

When I bought a "Signature Edition" Windows 8 device, I was expecting something similar. In fact, the Signature programme sounds very similar in spirit to the Nexus programme. Tablets that come with a very vanilla copy of Windows 8, and only a few blessed Microsoft apps.

It certainly was vanilla and had no bloat, but the initial impression is far worse.

## On a pale horse

I'm currently installing 8.1, and after that updating this tablet in the hopes that driver issues will be fixed. Hopefully I'll be much more impressed as time goes on, especially since I only bought this device so I could really dig into Windows Store development.

I might also continue this as a blog series to document my trials and tribulations as a Windows tablet owner, and as a Windows Store developer.

For now, I bid you adieu, and leave you a photo of a horse appropriate for the holiday.

{<3>}![](/content/images/2014/Nov/thanksgiving_dress_by_elosande-d6w1nlj.png)
Image courtesy of [Elosande](http://elosande.deviantart.com/art/Thanksgiving-dress-416622007)