---
layout: post
title: "Jenkins - The CI We Love to Hate"
date: 2014-08-15 11:23:00
tags: code, ponies, jenkins, werker, retrolambda, pvl, eqbeats, bronytunes, android
---
I'll start off with this: I _hate_ [Jenkins](http://jenkins-ci.org/). Full stop.

<!-- break -->

![Jenkins](/images/other/jenkins_logo.png)

For the uninitiated, Jenkins is a CI server. It's designed to take your code, build it, run your test suite, and report the results. In this sense, it's a really strong tool to have in your arsenal.

Too bad it ___sucks___.

Recently, I started work on Android applications for [Ponyville Live!](https://ponyvillelive.com/), [EqBeats](https://eqbeats.org/) and [BronyTunes](https://bronytunes.com/). Sometimes, people ask how these are going, sometimes they want to see visual progress; both of these I suck at supplying. In the interest of automation and visibility, I thought I'd provide the eager beavers in all three camps with nightly builds of the apps

First, I tried using [Wercker](http://wercker.com/), an excellent (hosted!) alternative to Jenkins. For a normal Android app, Wercker is great, however the code for these apps have one point that breaks Wercker. Namely, they use [Retrolambda](https://github.com/orfjackal/retrolambda) to get features from Java 8 onto Java 6 (which Android is based on). Because of this, there's some custom work that needs to be done to compile the applications.

I tried [building a solution](https://github.com/berwyn/werker-retrolambda) to get Wercker working, but it proved to be difficult and needs more attention than I can afford to give it right now (remember this statement, it's good for a laugh later).

Being the intrepid explorer that I am (not), I then set out to roll a Jenkins server of my own. Everything went fine apart from installing the Android SDK being a pain, and then I tried to get Jenkins to build the apps.

Que seven hours of pain, misery, suffering and agony trying to get Jenkins to not wipe out temp files, invoke Gradle, not mess up folder permissions, find the Android SDK I spent so much time downloading, and eventually just hacking around Jenkins with a dirty script.

```bash
touch retrolambda.gradle
cat > retrolambda.gradle <<EOF
retrolambda {
    jdk '/usr/lib/jvm/java-8-oracle'
    oldJdk '/usr/lib/jvm/java-7-oracle'
    javaVersion JavaVersion.VERSION_1_7
}
EOF
chmod 777 .
export ANDROID_HOME="/home/azureuser/.android-sdk"
```

![](/images/ponies/mlfw5804_16094.gif)

Now it builds, and you can all check out the artefacts on [my ci server](http://ci.codeweaver.so/job/Neigh/).

In the near future, I'll do some writeups and walkthroughs of these apps for those interested, but for now, enjoy the build artefacts.

As always, I leave you with a cute smallhorse

![](/images/ponies/new_cttzranvas_by_dragonfoxgirl_d77c66d.png)