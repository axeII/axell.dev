---
url: "/posts/moving-to-linux-in-2026-part-2/"
date: 2026-05-03T01:00:00Z
description: "How to set up Steam and Proton on Linux, use ProtonDB, and my real experience gaming on CachyOS - including Baldur's Gate 3 and the state of Nvidia GPU support."
draft: true
slug: "gaming-on-linux-in-2026"
tags: ["linux", "gaming", "cachyOS", "steam", "proton"]
categories: ["tech"]
title: "Migrating to Linux in 2026: Gaming on Linux Actually Works"
series: ["migrating-to-linux"]
series_order: 2

---

In [Part 1](/posts/moving-to-linux-in-2026/) I covered why I left Windows and how I installed CachyOS. Now let's talk about the part everyone is worried about - gaming.

---

## How Does Installing Games Work?

If you followed my guide from Part 1 you should already have Steam installed via the `cachyos-gaming-meta` package - you don't need anything else. All the default stuff is already installed in the distribution.

Now comes the fun part. There is one thing you need to be aware of: obviously most games don't support Linux natively. So for that reason you have to use Proton. I won't go deep into how exactly Proton works but it's basically something that translates instructions so Linux is able to run Windows executables. Think of it like macOS Rosetta.

<!-- TODO: Add a brief explanation of Proton - it's Valve's fork of Wine, bundled with Steam. Mention that Wine stands for "Wine Is Not an Emulator" and that Proton adds gaming-specific patches on top. Keep it simple. -->

### Setting Up Steam for Linux Gaming

I recommend going to Steam settings and setting the compatibility to the Linux Proton / Steam OS / CachyOS version. If you choose this option you should be good to go - Steam will try to use this Proton version each time you install and start a game.

<!-- TODO: Add screenshot of Steam compatibility settings -->

---

## ProtonDB - Your Best Friend

You need to get familiar with [ProtonDB](https://www.protondb.com/). It's incredibly helpful for gamers on Linux.

I recommend logging in via Steam. First you will see all the games you own and you can directly see each game's support score. You can also help the community by writing your own findings and research.

<!-- TODO: Add screenshot from adding your first comment to ProtonDB -->

### Understanding the Scores

- **Platinum / Native** - you don't have to worry about anything, just start the game
- **Gold** - you might have to do some tweaking or research to improve the experience
- **Silver / Bronze** - expect more issues, but solutions often exist

I must have been lucky but so far I have not seen worse than gold. Not sure how badly the games would run on silver or bronze. Luckily I did not have the chance to find out.

I always recommend searching for the game you want to play on ProtonDB before launching it. If you see platinum you can play without any extra configuration. If you see gold you might have to consider doing some tweaking or check if recently a native Linux binary has been released. Actually this keeps happening more and more - Linux gaming is finally getting a much needed boost.

And last thing I recommend based on my experience - don't give up. If you find some problem or the game is just buggy, keep searching. There is a very high chance you will find a solution that fixes the issue.

---

## My Experience: Baldur's Gate 3

For me a good example is trying to run Baldur's Gate 3. I started the game and what happened - for the first time I had low FPS. I was afraid of this, but I kept doing research on Reddit and the internet.

<!-- TODO: Verify image path works - this was from the original post -->

![Baldur's Gate 3 on Linux](files/019d81a6-590f-7369-ae8d-ceb5de6b3e62/image.png)

After a while I found that there is actually a native Linux binary which I had to select manually since the default option was to use Proton (this happens when a game shows as gold but there is a native binary available). After switching to the native version I had full vsync FPS experience.

**Lesson learned:** Don't fully trust ProtonDB scores. It may seem like Proton is working fine but there might be a native binary that runs much better. Always check.

<!-- TODO: Add more game examples - what else did you play? How did they run? Any other games that needed tweaking? Build a small table of games you tested with their scores and your experience. -->

---

## Nvidia Gaming on Linux

It's a well known fact that gaming on Linux is better for AMD GPU users. As of early 2026 the support for Nvidia GPUs is still not ideal but it's getting much better - we might get full Nvidia GPU support this year.

<!-- TODO: Paste the link about better Nvidia support coming to CachyOS in 2026 -->

I am considering upgrading in the near future to an Nvidia 5070 Ti. Although currently the support is not great - based on my research current Nvidia users see about 30% lower performance. This is a huge limiting factor! However there are new drivers coming to CachyOS which promise to remove this limitation, which is great news for Nvidia users and may bring more people to CachyOS and Linux in general.

<!-- TODO: Once the new Nvidia drivers are released and you've tested them, update this section with real benchmark numbers. -->

---

## What's Next

In the next and final part of this series I'll cover the tools and optimizations that made my Linux gaming experience even better - overclocking with LACT, fan control with CoolerControl, FSR tweaks with Optiscaler, and more.

<!-- TODO: Once Part 3 is published, replace this with a link to the actual post -->
