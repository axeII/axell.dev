---
url: "/posts/moving-to-linux-in-2026-part-3/"
date: 2026-05-03T01:00:00Z
description: "The tools and tweaks that took my Linux gaming setup to the next level - overclocking, fan control, FSR mods, AI terminal helpers, and more."
draft: true
slug: "linux-gaming-tools-and-optimization-2026"
tags: ["linux", "gaming", "cachyOS", "optimization", "tools"]
categories: ["tech"]
title: "Migrating to Linux in 2026: Tools and Optimization"
series: ["migrating-to-linux"]
series_order: 3

---

In [Part 1](/posts/moving-to-linux-in-2026/) I covered why I left Windows and installing CachyOS. In [Part 2](/posts/gaming-on-linux-in-2026/) I covered gaming with Steam and Proton. Now let's talk about the tools and tweaks that made my Linux experience even better.

After a while I started doing research on how to get better performance. Honestly for me this might be more fun than just playing games - I feel my friends think I am weird, but I find this to be a game in itself. If you are like me and want to try some improvements, I prepared a few topics I found that can be useful but are not required.

---

## Overclocking on AMD with LACT

The first thing you will miss coming from Windows is AMD's Adrenaline tool. But on Linux we have [LACT](https://github.com/ilya-zlobintsev/LACT).

This tool adds overclocking support for AMD GPUs. Nvidia GPUs sadly have limited support right now.

<!-- TODO: Verify image path works - this was from the original post -->

![LACT overclocking interface](files/019d81a3-a45a-76bd-8ab7-a43891a8910d/Screenshot_20260412_130252.png)

<!-- TODO: Describe what settings you changed. Did you adjust clock speeds, voltage, fan curve? What performance improvement did you see? Add before/after FPS numbers if you have them. -->

---

## Optiscaler - Enable FSR3 or FSR4 for Games That Only Support FSR 2

This is still an experiment but I am trying to give it a chance and see improvements.

Sadly FSR 4 is only supported on RDNA 4 architecture - I feel AMD copied Nvidia here. Although there is someone trying to find a compiler that will add FSR 4 support to RDNA 2. I might consider upgrading if that succeeds.

Note that Optiscaler only supports Windows, meaning on Linux it only works via Proton. If you have a native Linux binary you cannot use Optiscaler - however most games are being played via Proton so I don't think this is an issue.

<!-- TODO: Add link to the Optiscaler project. Show before/after comparison if possible. Which games did you try it with? -->

---

## CoolerControl - Fan Control for Linux

If you follow JayzTwoCents you might have heard of FanControl on Windows - a great piece of software that makes it easy to set up fans for maximum cooling. On Linux there is [CoolerControl](https://docs.coolercontrol.org/) which works basically the same way. The UI is different but the functionality is the same.

You can have multiple profiles like GPU or CPU which you can bind to each cooler in your PC, or use a MIX profile which works the same way as on FanControl (the coolest feature IMHO).

<!-- TODO: Verify image path works - this was from the original post -->

![CoolerControl interface](files/019da79e-fa82-732b-a78b-c70d0b4b95da/CoolerControl-screenshot-1.png)

<!-- TODO: Show your actual profile setup. What temperatures are you targeting? Did it make a noticeable difference in noise or thermals? -->

---

## opencode - AI in Your Terminal

I highly recommend this tool to anyone. I think it can help beginners or anyone who has knowledge of Linux. Since it's 2026 you don't need to ask forums or Reddit for help - you can use AI right in your terminal.

Install it from [opencode.ai](https://opencode.ai/) or via AUR. Why opencode? It's very convenient - instead of using Copilot or ChatGPT in a browser, this runs in the console and can update your configuration locally. Just tell it your problem and what you need to fix. The better you describe the problem, the better it will work.

You don't need to log in - just install it and use the free models which are good enough. No need to pay for extra models, though if you have a ChatGPT subscription you can use their API token.

<!-- TODO: Add example screenshot of debugging an issue with opencode -->
<!-- TODO: Share a specific example - what problem did you solve with it? Show the prompt and the result. -->

---

## Little Snitch - The Best Firewall

On my personal Mac I have had this program installed for about 10 years and have never been happier. It's not an antivirus - just a networking monitoring tool. The irony is that it can be better than any antivirus since some malware will never trigger if you have this tool watching your network traffic.

I was very happy to hear that this year they released a [free open source Linux version](https://obdev.at/products/littlesnitch-linux/download.html) - from the same company.

I don't plan to use antivirus on Linux, however I will definitely use this tool. Installation on CachyOS is a little tricky though - I installed it via AUR and then used a PWA from the Firefox browser. There is also an option to natively build it by cloning from GitHub.

<!-- TODO: Add screenshot of Little Snitch on Linux. Show an example of it catching unexpected outgoing traffic. -->

---

## Vicinae - Spotlight for Linux

I am used to Raycast on macOS which is not yet supported on Linux. Vicinae is a similar tool - like Spotlight for Linux. I recommend it but it's not strictly needed. CachyOS actually has a native spotlight-like feature - just press `Alt + Space`.

<!-- TODO: Add screenshot of Vicinae in action. Compare it to Raycast/Spotlight briefly. -->

---

## Final Thoughts

After three weeks of daily driving CachyOS I can confidently say - Linux in 2026 is ready for gaming. The combination of CachyOS, Steam with Proton, and the tools I described in this series made the switch almost painless. There are still rough edges, especially for Nvidia users, but the trajectory is clear.

If you've been sitting on the fence, just try it. You might be surprised.

<!-- TODO: Write a proper conclusion reflecting on the full journey across all three parts. What would you do differently? What advice would you give to someone starting today? -->
