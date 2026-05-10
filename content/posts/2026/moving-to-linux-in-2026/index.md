---
url: "/posts/moving-to-linux-in-2026/"
date: 2026-05-03T01:00:00Z
description: "I finally decided to move to Linux and I want to share my experience for anyone thinking about making the switch in 2026."
draft: true
slug: "moving-to-linux-in-2026"
tags: ["linux", "gaming", "cachyOS"]
categories: ["tech"]
title: "Migrating to Linux in 2026: Why I Left Windows and Never Looked Back"
series: ["migrating-to-linux"]
series_order: 1

---

As many others I decided that I have enough of Microsoft's random updates and breaking things all the time, telemetry, forced Microsoft products like Teams, OneDrive and AI **everywhere**. I simply said enough and although there is sort of hype right now to move to Linux, honestly I was not sure if this is a good choice. I have good experience with Linux on all platforms like servers (honestly Linux is now almost everywhere) but not exactly with desktop - the gaming desktop.

<!-- TODO: Add a personal anecdote about the specific moment you decided to leave Windows. What was the final straw? Was it a broken update? Forced Copilot? Something specific that made you say "that's it"? -->

---

## Choosing the Right Distro

The most important step here. Or is it? There are a lot of choices today - there are [so many distributions](https://en.wikipedia.org/wiki/List_of_Linux_distributions) to choose from.

In 2026 it does not really matter - there are many stable distributions that can be used for gaming. However I noticed one specific Linux distribution that caught my eye. It's **CachyOS**.

There is currently huge hype around CachyOS and I thought why not try it. Everyone keeps saying that this distribution is really stable, has great drivers - after installation no need to do anything else.

<!-- TODO: Briefly mention what makes CachyOS different from other distros (e.g., performance-optimized kernel, gaming-focused defaults). Why did you pick it over Fedora, Nobara, Pop!_OS, etc.? -->

---

## My Hardware

- CPU: AMD 5600
- GPU: AMD Radeon RX 6800
- System runs on NVME SSD 1TB
- 32GB RAM

Resolution I use on my monitor is 3840×1600 (ultrawide 2K) with refresh rate 75Hz.

---

## Installing CachyOS

The installation was pretty easy and simple. I had zero issues and honestly I was blown away that everything worked since first boot - I did not have to install any drivers, compile any additional kernel - none of that. Although you can, but for me that's overkill since I wanted to just give it a try and simulate being an average Windows user.

After a couple of minutes I had the installed version on my PC ready, no need for extra configuration - I chose mostly the defaults.

<!-- TODO: Add screenshot of the CachyOS installer or first boot if you have one -->

### Post-Installation

After the installation I installed the gaming packages:

```bash
sudo pacman -S cachyos-gaming-meta
```

```bash
sudo pacman -S cachyos-gaming-applications
```

And that's it. The system was ready.

<!-- TODO: Verify image path works and add alt text -->

![CachyOS desktop after setup](files/019d88f1-22ed-767b-ac7d-889c4d38bbe3/image.png)

---

## First Impressions

I had zero issues so far and I am shocked. Yes I had to do some configuration but overall it's all good. Every game I tried runs smoothly.

So far I have zero reasons to go back to Windows. With my current hardware I am happy. And remember - it's not about the distro, it's about Linux. Find the distro that works best for you. I might also migrate to a different distro in the near future but for now I am very happy where I am.

<!-- TODO: Expand this section - this is the heart of Part 1. Share specific "it just works" moments:
- What was the first thing you did after booting? Did the WiFi work? Sound? Monitor resolution?
- What surprised you the most compared to Windows?
- How does daily usage feel? File manager, browser, terminal?
- Any small annoyances you had to work around?
- What would you tell someone who is afraid to make the switch?
This section should encourage readers and celebrate that Linux in 2026 is genuinely ready for desktop use. -->

---

## What's Next

This is just the beginning of my journey. In the next parts of this series I'll cover:

- **Part 2: Gaming on Linux** - how to set up Steam, Proton, and ProtonDB. My experience with games like Baldur's Gate 3 and the current state of Nvidia GPU support.
- **Part 3: Tools and Optimization** - overclocking with LACT, fan control with CoolerControl, FSR tweaks with Optiscaler, and other tools that made my Linux experience even better.

<!-- TODO: Once Part 2 and Part 3 are published, replace the bullet points above with links to the actual posts -->
