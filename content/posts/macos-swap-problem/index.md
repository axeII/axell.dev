---
categories: ["tech", "multimedia"]
date: 2021-01-18T01:01:23Z
description: ""
draft: false
slug: "macos-swap-problem"
tags: ["tech", "multimedia"]
title: "macOS Swap Problem"
showHero: true
---

If you are the owner of a MacBook, then you will know how much the macOS system swaps. It's actually not that big of a deal these days since there are super [fast](https://eclecticlight.co/2020/12/12/how-fast-is-the-ssd-inside-an-m1-mac/) SSDs that Macs are equipped with. Now, it may seem like if there is a fast disk, then it's okay.

Well, to tell the truth, it does depend on which MacBook you own. Which CPU your Mac has, how much memory, and whether it has an HDD or SSD.

On older models, I can confirm that swapping has a huge impact on system performance. However, if you use a newer model, especially a Pro model, there is less impact on system performance, which you may not notice, and you don't have to restart every week (_lucky you_).

{{< alert >}}
I can't confirm if M1 MacBooks also work the same; however, versions with Intel processors do work like this.
{{< /alert >}}

It doesn't really matter how much RAM your Mac has (of course, more is better, and it has an impact on the system), macOS is designed this way to... well, swap a lot. Other systems (like Linux) don't seem to swap this much.

Here is how it works:

1. System is booted with clean memory.
2. User operates the laptop using minimal memory swap.
3. MacBook is set to sleep mode by the user, and the system creates a file in the filesystem `/var/vm/sleepimage`. The size of this file equals the size of the RAM (unless the SSD is low on capacity).
4. System stores the contents of RAM in this file. Note that this file is not deleted when the system is back on.

You can delete this file, but once you "delete it," the space will not be freed until the kernel and other processes close the file, so restart your Mac. The image file will be recreated next time you need to sleep - so if you had an HDD with that file contiguously allocated, you will make things worse when it's allocated in non-contiguous blocks. SSD won't care either way.

There are two problems with this feature:

1. You lose some space on the disk. (For me, the system still stores a huge file in the filesystem.)
2. Since you write an 8GB size of data on your SSD every time you put your MacBook into sleep mode, it has some impact on SSD lifespan.

If you run `sudo pmset -a hibernatemode 0; sudo rm /var/vm/sleepimage`, the Mac will use a normal sleep mode (like desktop Macs by default) and it won't recreate `/var/vm/sleepimage`.

>hibernatemode = 0 (binary 0000) by default on supported desktops. The system will not back memory up to persistent storage. The system must wake from the contents of memory; the system will lose context on power loss. This is, historically, plain old sleep.

Meaning that 0 (traditional sleep mode) enables fast wake up and sleep, saves disk space, and reduces writing to the drive.

I also didn't see any noticeable impact on my MacBook's battery. This can save your SSD lifespan, and since you can't swap SSDs on newer MacBooks, it also saves your whole MacBook lifespan.

{{< alert >}}
I highly recommend not deleting swap files. It's not worth it. You can lose data and make your system unstable. If you want to free up space on your disk, you can use `sudo rm -rf /private/var/vm/*`, but I don't recommend it.
{{< /alert >}}

---

_Note: Testing was done on a MacBook Air 2017 with 8GB RAM_

Sources: "[https://apple.stackexchange.com/questions/50235/what-i-can-delete-from-private-var-vm/115748](https://apple.stackexchange.com/questions/50235/what-i-can-delete-from-private-var-vm/115748)"
