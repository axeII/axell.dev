---
date: 2026-05-03T01:00:00Z
description: "I finally decided to move to linux and I want to share my experience and guide for gamers who are thinking about moving to linux in 2026."
draft: true
slug: "moving-to-linux-in-2026"
tags: ["linux", "gaming", "cachyOS"]
categories: ["linux", "gaming", "cachyOS"]
title: "Moving to Linux in 2026: My Journey and Guide for Gamers"

---


# Series: Moving to Linux in 2026

As many others I decied I have enough of microsfot random updates and breaking things all the time, telemtry, forced microsoft products like teams, onedrive and also AI everywhere. I simply said enough and although there is sort of hype right now move to linux honestly I was not sure if this is good choice. I have good exprericne with linux on all platforms like servers (hontestly linux is now almost everyhwere) but not exactly with desktop - the gaming desktop.

## 1\. Choose the right Linux!

The most important step here. Or is it? There is lot of choices today which distrubution you can chosee as there is more then choices are many.

https://en.wikipedia.org/wiki/List_of_Linux_distributions

At the year 2026 it does not really matter today there are many stable distributions that can be used for stable gaming. However for my I’ve notice one specific linux distributation that cought my eye. It’s the **cachyOS**.

There is currently huge hype around cachy OS and I though why not try it. Everyone keeps saying that this distribution is really stable, has great drivers - after instaltion no need to do anything else. And at the moment 79

I had zero issues so far and I am shocked. Yes I had to do some configuration but overall its’ all good. Every game I tried runs smoothly

## Current hardware

- CPU: AMD 5600
- GPU: AMD Radeon RX 6800
- My system runs on NVME SSD 1TB
- Also 32GB RAM

Resolution I use on my monitor is 3840×1600 (ultrawide 2k) with refresh rate 75Hz.

## The installation of cachy OS?

It was pretty easy and simple. I had zero issues during the installation and hoesntly I was blowned away that everything worked since first bootup and I did not have to install any drivers, compile any aditinonal kernel - non of that. Although you can but for me that overkill since I wanted to just give a try and I wanted to simulate being averige Windows user. If you are interesed and want to follow my journey and simple quick tutorial to follow please follow this guide post I made about installing the cachyOS. Nothing extra here to be honest.

# Installation

## nstallation of cachy OS

Was pretty smooth. After couple minutes I had the installed verison on my pc ready no need for extra configuration I choose mostly the defaults.

## Tools I installed after

After the instaltion

```
sudo pacman -S cachyos-gaming-meta
```

```
sudo pacman -S cachyos-gaming-applications
```

![](files/019d88f1-22ed-767b-ac7d-889c4d38bbe3/image.png)

I recommend to visit protondb where you can get tips how to improve the score or settings per game. If the game shows platinum or native you don’t have to worry about pretty much nothing and just start the game. Worse is that if you see gold. That means you might have to do some reaserch on the game to improve the score.

I must have been lucky but so far I have not seen worse score then gold. Not sure how badly the games would run on silver or bronze. Luckily I did not have the chance to try so far.

## How does installing games work?

If you would follow my guide you woulbe able to install steam by three commands and you done you don’t need anyhing else. All default stuff is already installed in the distrubtion. Now comes to fun part there is one thing you need to be aware. Obviously most games don’t support natively linux. So for that reason you have to use proton. I don’t go in deep how exactly proton works but ti’s just something that does translating instructions so Linux is able to run the files. Basically macos rosetta.


I recommend to go to the steam settings and first time to set is the compatibility to lnux proton steam os cachy os. If you choose this option you should be good to go as steam will try to choose this proton version each time you install and start the game.

Second I recommend is always try to search the game you want to play in protondb. If you see platinum you can play the game without any extra configuration but fi you see gold you might have to consider doing some tweaking or just see if recently there has been update for example native linux binary has been released. Actually this keep happening luckily as Linux’s gaming is getting finally much needed boost.

And last thing I recommend based on my experience is don’t give up. If you find some problem or the game is just buggy please keep searching and there is very high chance you will find solution that will fix the issue.

For me this can be example trying run the Baldurs gate 3. I run the game and what happend for the first time I had low FPS. I was afraid of this, but I kept doing researhc on reddit and overall the internet.

![](files/019d81a6-590f-7369-ae8d-ceb5de6b3e62/image.png)

After while I found that there is actually native binary which I had to choose since the default option was to use proton (example when the game is gold score but there is native binary) after that when I played the game I had full vsync FPS experince.

## Nvidia gaming?

It’s well known fact that gaming on linux is better for AMD GPU users. For now March 2026 the support for the nvidia gpu is still no ideal but it’s getting much better and we might get full nvidia GPU support this year.

TODO: paste here link to suport nvidia cachy os better in 2026

Don’t trust fully the proton db because it may seems like it’s working fine but it’s not since I had issues that the proton db showed gold for example with the badurls gate but then running native linux version it’s runs so well.

## Improve gaming on cachy OS?

After while I started doing reasarch how to get better perfomance. Honestly for me this might be more fun then just playing games and I feel my friends might feel I am weird on this but I find this as a game. If you are like me and want to give a try to do some improvements I prepared few topics I found that can be usefull but not needed.

### ProtonDB

You need to get familiar with tis site. It’s very helpfull for gamers on linux

TODO: Also explain how proton works it’s from steam etc. It sues wine what is wine and how it works.

I recoomend to login via steam. First you will see all your games you own in steam and you can direclty see the game suport scrore. Also you can help the community and write your own research and findings.

TODO: add screenshot from adding my first comment to protodb

### Overclocking on AMD

The First thing you will miss is obviously the amd’s adrenaline tool. But for linux we have tool. The LACT. Can be found here: https://github.com/ilya-zlobintsev/LACT

This tool adds overclocking support for AMD gpus. The nvidia GPUs have sadly limited support right now.

This tool also supports the

![](files/019d81a3-a45a-76bd-8ab7-a43891a8910d/Screenshot_20260412_130252.png)

### Optiscaler - enable FSR3 or FSR4 for games with support only FSR 2

This is still and experminet but I am trying to give this a chance and see improvments

Sadly teh FSR 4 is supported only for RDNA 4 architecture and I feel here AMD copied Nvidia although there someone tryigng to find compliter that will add support FSR 4 to RDNA 2. I might consider upgrade if that will be sucess.

Note that optiscaler only supports windows meaning on linux only via proton. If you have native linux binary you cannot use the optiscale - however most games are being played via proton so I don’t think this is an issue.

### Cooler control aka fancontrol for linux

If you follow jayztwo cents you might have heard you are using fan control on windows which is great piece of software. It really helps easy to setup fans to run higher so you get maxium power of your PC. For linux there is cooler control https://docs.coolercontrol.org/ which works basically the same way the UI is differnet however it works the same way. You can have multiple profiles like GPU or CPU which you can bond to each cooler in your PC or use MIX profile which works the same way as on FanControl (the most cool feature IMHO).

![](files/019da79e-fa82-732b-a78b-c70d0b4b95da/CoolerControl-screenshot-1.png)

### opencode

I highly to recommend this tool anyone. I think this tool can help beginner or anyone who has better knowlidge of linux. Since it’s 2026 you don’t need to ask any forums or reddit for help. Instead you can use the AI

TODO: generate AI image for AI :D

Install it via here: [https://opencode.ai](https://opencode.ai/) or you can use AUR. Why opencode. It’s very conviniet instead of using copilot or chatgpt. This will run in the console and can update your configuraiton locally. Just tell it your problem what you need to fix. The better you describe the problem and what you need the better it will work. Also you don’t need to login anyway you just install it you and you can use free models which are good enough. No need to pay for extra models. Though if you have chatgpt subscription you can use theyir API token.

TODO add exmaple screenshot of debuign issue with opencode

## Extra tools that can help

### Little snitch - the best firewall

On my personal Mac I have this program installed and never been more happy. It’s not antivirus just netowrking monitoring tool however the irony is that it can be better then any antivurs as some malwares will never trigger on mac if you have this tool installed. After I guess 10 years using this tool on mac I was very happy to heard that this year they released free open source version - the same company.

Go here: https://obdev.at/products/littlesnitch-linux/download.html

Again I don’t plan to use antivirus on linux however I will definatelly use this tool. Installation on cachyOS is little tricky though. I installed it via AUR and then used pwa from the firefox browser. There is also option to natively build by cloning it from github.

### Vicinae

Another usefull tool. I am used to raycast which is not yet supported. This is also similar to spotlight on macos which for me is very usefull. I recommend this tool but it’s not needed. Btw cachyOS has native spotlit just use alt + space.

## Final thoughts - after week of usage

So far I have zero reasons to go back to windows. With my current hardware I am happy. I am considering upgrading in near future to nvidia 5070ti. Althouh currently the uspport is not great and based on my research the currentl nvidia users are limit by 30% down - this is huge limit factor! However there is new drivers coming to cachyos which promise to remove this limit which is great news for nvidia users and may bring more suers to cachy OS. Also rember it’s not distro but linux. Find the distro you find the best. I might also migrate to different distro in near future but for now I am very happy where I am.
