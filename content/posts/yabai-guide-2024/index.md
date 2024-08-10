---
# categories: ["multimedia", "Software devlopment"]
date: 2024-08-01T01:00:00Z
description: "A comprehensive guide on how to install and configure Yabai on macOS in 2024."
draft: false
slug: "yabai-guide-2024"
tags: ["macos", "Software-development"]
title: "How to install and configure Yabai on macOS in 2024"

showHero: false
---

# How to install and configure Yabai on macOS in 2024

Finally, after a long time, I decided to install Yabai on my macOS system. Previously I was using some scripts to manage my windows, however for a long time I wanted to try Yabai. For those who don't know, Yabai is a tiling window manager for macOS. Together with  skhd, a hotkey daemon for macOS, it's a great combo to manage widows spaces on macOS. Also it's open-source project hosted on GitHub [here](https://github.com/koekeishiya/yabai).

This is the way to install and configure Yabai on macOS as I did in July 2024.

## Prerequisites

Before we get started, make sure you have the following:

-  A Mac running macOS Big Sur or later.
-  Homebrew installed on your system.

## Step 0 Optional: Install Homebrew (If Not Already Installed)

First step is pretty easy. If you don't have Homebrew installed on your system you have to install it. It makes the whole yabai deploying on your system much easier. Homebew is a package manager for macOS that makes it easy to install software. To simply install Homebrew, run the following command in your Terminal:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Step 1: Install Yabai
Now since Homebrew installed, you can easily install Yabai. Run the following command in your Terminal:

```bash
brew install yabai
```

## Step 2: Configure Accessibility API
To function correctly, Yabai requires accessibility permissions. Grant these permissions by running:

```bash
sudo yabai --install-sa
```
Then, navigate to System Preferences > Security & Privacy > Privacy tab, and add Terminal (or your preferred terminal emulator) and Yabai to the list of applications allowed to control your Mac

## Step 3: Create and Modify Yabai Configuration File
Create a configuration file for Yabai in your home directory:

touch ~/.yabairc
Edit the configuration file with your preferred editor. Here's a basic configuration to get you started:

```bash
echo 'yabai -m config external_bar all:focused' > ~/.yabairc
```

Ensure the configuration file is executable:

```bash
chmod +x ~/.yabairc
```

As the bonus I will provide my yabairc file at the end of this guide feel free to use it.

## Step 4: Disabling SIP and additional configuration
Yabai requesires to disable SIP on all Macs to work properly. It works fine without it but you will be missing some key features.
If you have an M series Mac, you may need to disable System Integrity Protection (SIP) to use Yabai.

These are the features that won't work without disabled SIP:
1.  Window Insertion: Inserting windows into specific locations on the grid won't be possible.
2.  Focus Follows Mouse: The "focus follows mouse" feature won't work without SIP being disabled.
3.  Borderless Fullscreen Windows: True borderless fullscreen windows may not function correctly.
4.  Moving Windows to Another Display: You may not be able to move windows easily between displays without SIP adjustments.
5.  Space Management: Automated creation and management of macOS spaces won't be fully functional.

{{< alert >}}
**Warning!** Remember, disabling SIP can be dangerous if you are not sure what you are doing. If you are an experienced user, this might be fine. However, please make sure to understand the risks before proceeding.
{{< /alert >}}

To do this, follow these steps:

1. Restart your Mac and hold down Command + R to enter Recovery Mode.
2. Open Terminal from the Utilities menu.
3. Run the following command to disable SIP:

```bash
# If you're on Apple Silicon macOS 13.x.x OR newer
csrutil enable --without fs --without debug --without nvram
```
{{< alert >}}
**Warning!** After disabling SIP on M series Macs, all 3rd party apps that are part of iOS shared program will no longer work on your Mac without SIP.
{{< /alert >}}

After that you need to create a sudoers file for Yabai. This is required to allow Yabai to run without requiring a password. To do this, follow these steps:

```bash
# create a new file for writing - visudo uses the vim editor by default.
# go read about this if you have no idea what is going on.

sudo visudo -f /private/etc/sudoers.d/yabai

# input the line below into the file you are editing.
#  replace <yabai> with the path to the yabai binary (output of: which yabai).
#  replace <user> with your username (output of: whoami).
#  replace <hash> with the sha256 hash of the yabai binary (output of: shasum -a 256 $(which yabai)).
#   this hash must be updated manually after upgrading yabai.

<user> ALL=(root) NOPASSWD: sha256:<hash> <yabai> --load-sa
```

And the finall piece you have to run this command:

```bash
yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
sudo yabai --load-sa
```
The downside is that after every reboot you have to run this command. If you want to make it permanent you have to add this command to your startup scripts.

## Step 5: Restart Yabai to Apply Changes
After setting up your configuration, restart Yabai to apply the changes:

```bash
brew services start yabai
```


## Bonus: My yabairc config

```yaml
# default layout (can be bsp, stack or float)

yabai -m config layout bsp

yabai -m config window_placement second_child

# padding
yabai -m config top_padding 12
yabai -m config bottom_padding 12
yabai -m config left_padding 12
yabai -m config right_padding 12
yabai -m config window_gap 12

# mouse settings

# center mouse on window with focus
yabai -m config mouse_follows_focus on

# modifier for clicking and dragging with mouse
yabai -m config mouse_modifier alt
# set modifier + left-click drag to move window
yabai -m config mouse_action1 move
# set modifier + right-click drag to resize window
yabai -m config mouse_action2 resize


# when window is dropped in center of another window, swap them (on edges it will split it)
yabai -m mouse_drop_action swap


# list of apps that should float by default
yabai -m rule --add app="^System Settings$" manage=off
yabai -m rule --add app="^Calculator$" manage=off
yabai -m rule --add app="^Karabiner-Elements$" manage=off
yabai -m rule --add app="^Ice$" manage=off
yabai -m rule --add app="^Mac Mouse Fix$" manage=off
```
And here is the skhdrc file:

```yaml
# change window focus within space

alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north
alt - h : yabai -m window --focus west
alt - l : yabai -m window --focus east

# focus monitor
ctrl + alt - x  : yabai -m display --focus recent
ctrl + alt - z  : yabai -m display --focus prev
ctrl + alt - c  : yabai -m display --focus next
ctrl + alt - 1  : yabai -m display --focus 1
ctrl + alt - 2  : yabai -m display --focus 2
ctrl + alt - 3  : yabai -m display --focus 3

# rotate layout clockwise
alt - r : yabai -m space --rotate 90

# flip along y-axis
shift + alt - y : yabai -m space --mirror y-axis

# flip along x-axis
shift + alt - x : yabai -m space --mirror x-axis

# toggle window float
shift + alt - t : yabai -m window --toggle float --grid 4:4:1:1:2:2

# maximize a window
shift + alt - m : yabai -m window --toggle zoom-fullscreen

# balance out tree of windows (resize to occupy same area)
shift + alt - e : yabai -m space --balance

# swap windows
shift + alt - j : yabai -m window --swap south
shift + alt - k : yabai -m window --swap north
shift + alt - h : yabai -m window --swap west
shift + alt - l : yabai -m window --swap east

# move window
shift + cmd - h : yabai -m window --warp west
shift + cmd - j : yabai -m window --warp south
shift + cmd - k : yabai -m window --warp north
shift + cmd - l : yabai -m window --warp east

# move window to display left and right
shift + alt - s : yabai -m window --display west; yabai -m display --focus west;
shift + alt - g : yabai -m window --display east; yabai -m display --focus east;

#move window to prev and next space
shift + alt - p : yabai -m window --space prev;
shift + alt - n : yabai -m window --space next;

# move window to space #
shift + alt - 1 : yabai -m window --space 1;
shift + alt - 2 : yabai -m window --space 2;
shift + alt - 3 : yabai -m window --space 3;
shift + alt - 4 : yabai -m window --space 4;

shift + alt - a : yabai -m window --resize left:-20:0
shift + alt - s : yabai -m window --resize bottom:0:20
shift + alt - w : yabai -m window --resize top:0:-20
shift + alt - d : yabai -m window --resize right:20:0

# decrease window size
shift + cmd - a : yabai -m window --resize left:20:0
shift + cmd - s : yabai -m window --resize bottom:0:-20
shift + cmd - w : yabai -m window --resize top:0:20
shift + cmd - d : yabai -m window --resize right:-20:0


# stop/start/restart yabai
ctrl + alt - q : yabai --stop-service
ctrl + alt - s : yabai --start-service
ctrl + alt - r : yabai --restart-service


# open terminal, blazingly fast compared to iTerm/Hyper
cmd - return : ~/Applications/iTerm.app/Contents/MacOS/iTerm2 --single-instance -d ~

# toggle desktop offset
alt - a : yabai -m space --toggle padding --toggle gap

# toggle sticky (show on all spaces)
alt - s : yabai -m window --toggle sticky

# create desktop and follow focus - uses jq for parsing json (brew install jq)
cmd + alt - n : yabai -m space --create

# destroy desktop
# cmd + alt - w : yabai -m space --destroy
cmd + alt - w : yabai -m space --focus prev && yabai -m space recent --destroy

# fast focus desktop
cmd + alt - x : yabai -m space --focus recent
cmd + alt - z : yabai -m space --focus prev || skhd -k "ctrl + alt + cmd - z"
alt - c : yabai -m space --focus next || skhd -k "ctrl + alt + cmd - c"
alt - 1 : yabai -m space --focus  1 || skhd -k "ctrl + alt + cmd - 1"
alt - 2 : yabai -m space --focus  2 || skhd -k "ctrl + alt + cmd - 2"
alt - 3 : yabai -m space --focus  3 || skhd -k "ctrl + alt + cmd - 3"
alt - 4 : yabai -m space --focus  4 || skhd -k "ctrl + alt + cmd - 4"
alt - 5 : yabai -m space --focus  5 || skhd -k "ctrl + alt + cmd - 5"
alt - 6 : yabai -m space --focus  6 || skhd -k "ctrl + alt + cmd - 6"
alt - 7 : yabai -m space --focus  7 || skhd -k "ctrl + alt + cmd - 7"
alt - 8 : yabai -m space --focus  8 || skhd -k "ctrl + alt + cmd - 8"
alt - 9 : yabai -m space --focus  9 || skhd -k "ctrl + alt + cmd - 9"
alt - 0 : yabai -m space --focus 10 || skhd -k "ctrl + alt + cmd - 0"
```
