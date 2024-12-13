<div align="center">
    <img src=".github/assets/header.svg" width="100%" height="100%" alt="elena's dotfiles banner">
</div>

<h1 align="center">
    <a href="#setup">Setup</a> ･
    <a href="https://github.com/elenapan/dotfiles/wiki">Wiki</a> ･
    <a href="https://github.com/elenapan/dotfiles/wiki/Gallery">Gallery</a> ･
    <a href="#tip-jar">Tip Jar</a>
</h1>
<br>

**Thanks for dropping by!**

<img src="https://raw.githubusercontent.com/wiki/elenapan/dotfiles/assets/aphelion.png" alt="img" align="right" width="400px">

This is my personal collection of configuration files that forms the desktop you see on the right.

Here are some details about my current setup:

+ **OS**: Gentoo
+ **Window Manager / Compositor**: [SwayFX](https://github.com/WillPower3309/swayfx)
+ **Widgets**: [Eww](https://github.com/elkowar/eww)
+ **Notifications**: [dunst](https://github.com/dunst-project/dunst)
+ **Shell**: [zsh](https://wiki.archlinux.org/index.php/Zsh)
+ **Terminal**: [kitty](https://github.com/kovidgoyal/kitty)
+ **Editor**: [Neovim](https://github.com/neovim/neovim)
+ **File Manager**: [nnn](https://github.com/jarun/nnn) and [Nemo](https://github.com/linuxmint/nemo)
+ **Launcher**: [rofi](https://github.com/davatorium/rofi/)
+ **Browser**: Firefox

<br>
<br>

## Philosophy
This is **not a traditional desktop** in any sense. It is highly opinionated, consists of what works for me and looks good for me and frequently disregards traditional desktop conventions and expectations. It has been evolving for about 8 years, spanning across several window managers and a migration from X11 to Wayland.

This desktop is:
- Mouse-friendly but keyboard-loving, particularly when it comes to Vi keys
- Dark and cozy, with vibrant colors and a sprinkle of kawaii-ness

## Latest iteration: `Aphelion`

Features:

- A sidebar widget with 3 pages:
  1. Clock, date, weather, system info
  2. Calendar and agenda
  3. Media info and controls
- Network widget integrated with [iwd](https://wiki.gentoo.org/wiki/Iwd)
- Agenda widget integrated with `.org` files
- Quick alarm widget
- 2-in-1 powermenu and lockscreen widget
- A simple dock widget, compatible with sway
- Bunny headpats

**All interactive widgets can be controlled both with the mouse and the keyboard.**

<h3>
    <a href="https://www.youtube.com/watch?v=IrF-VVKKK7o"><tt>🎬 45 second showcase (YouTube)</tt></a>
</h3>

## Setup

1. **Install dependencies**

   The following packages need to be installed for all desktop functionality to work.

   | Package | Purpose |
   | --- | --- |
   | [`swayfx`](https://github.com/WillPower3309/swayfx) | Window manager / compositor |
   | [`i3ipc`](https://github.com/altdesktop/i3ipc-python) | Sway-related scripts |
   | [`eww`](https://github.com/elkowar/eww) | Widgets |
   | `bash` | Various scripts |
   | `python` | Various scripts |
   | [`rofi-wayland`](https://github.com/lbonn/rofi) | Launchers and menus |
   | `dunst` | Notification daemon |
   | `libnotify` | Notification creation with `notify-send` |
   | [`notify-send.sh`](https://github.com/vlevit/notify-send.sh) | `notify-send` wrapper for notification replacement |
   | `jq` | `json` parsing in various scripts |
   | `inotify-tools` | Reaction to file changes in various scripts |
   | `wget` | Making HTTP requests in various scripts |
   | `acpid` | Battery charger state information |
   | `pulseaudio` | Sound daemon |
   | `slurp` | Screen region selection (Wayland) |
   | `grim` | Screenshot tool (Wayland) |
   | `grimshot` | `grim` and `slurp` wrapper |
   | `playerctl` | Media info |
   | `imagemagick` | Media art cropping |
   | `gammastep` | Screen color temperature tool |
   | `kdeconnect` | Phone battery information |
   | `kitty` | Terminal emulator |
   | `iproute2` | Network events information |
   | `iwd` | Wireless daemon |

> [!WARNING]
> **`iwd`**: If you already have a different wireless daemon installed, do not install and enable `iwd`. Having more than one wireless daemon running at the same time might disconnect your current wireless connection or cause other network issues. Note that [`iwd` can be used as a backend for NetworkManager](https://wiki.archlinux.org/title/NetworkManager#Using_iwd_as_the_Wi-Fi_backend).


> [!NOTE]
> Depending on your distribution, the names of the above packages may slightly differ. Also, some of the packages might not be available in your distribution's repositories so you might have to build them from source.

2. **Install fonts**

    The current setup uses the following fonts:
    - [Baro](https://befonts.com/baro-font-family.html)
    - [Kyok](https://www.1001fonts.com/kyok-font.html)
    - [BattleAndy](https://www.dafont.com/battle-andy.font)
    - My custom build of [Iosevka](https://github.com/be5invis/Iosevka/)
    - [Icomoon](https://icomoon.io/about_icon_fonts)
    - [Material Design Icons](https://fonts.google.com/icons)

    To save you time hunting for them online, I have uploaded a [.zip file to Dropbox](https://www.dropbox.com/scl/fi/fcjwlalz1zq19a05tdw0f/elenapan-dotfiles-fonts.zip?rlkey=uljkjoyi5qipi6hc9ju9ibk4o&st=zwqrvroc&dl=0). Download the .zip and then:

    ```sh
    # Assuming the .zip was saved in ~/Downloads
    unzip -d ~/.local/share/fonts ~/Downloads/elenapan-dotfiles-fonts.zip
    fc-cache -v
    ```

3. **Install dotfiles**

    Backup first:
    ```sh
    mkdir ~/config-backup
    cp -r ~/.config/{sway,eww,dunst,fontconfig,kitty,rofi} ~/config-backup
    ```

    Then clone the repo and install the relevant dotfiles:
    ```sh
    git clone https://github.com/elenapan/dotfiles
    cd dotfiles
    cp -r config/{sway,eww,dunst,fontconfig,kitty,rofi} ~/.config
    ```

4. **Tweak the last few settings**

    - Set wallpaper:
      ```sh
      cp /path/to/your/wallpaper ~/.local/share/wallpaper
      ```

    - Set location for the weather information widget:

      Edit `~/.config/eww/scripts/daemons/weather.sh` and set the `location` variable. For example:
      ```sh
      location="Moscow,Russia"
      ```

    - Set lockscreen widget password:

      Edit `~/.config/eww/globals.yuck` and set the `screen-lock-password` variable. For example:
      ```lisp
      (defvar screen-lock-password "hunter2")
      ```

    - Set agenda widget `.org` files to watch:

      Edit `~/.config/eww/scripts/daemons/agenda.sh` and set the `org_files` variable. For example:
      ```lisp
      org_files=("$HOME/notes/todo.org" "$HOME/notes/birthdays.org" "$HOME/notes/finance.org")
      ```

## Login

To start the desktop, you may follow the steps in the ["Starting" section of the Sway article in the Arch Wiki](https://wiki.archlinux.org/title/Sway#Starting)

> [!NOTE]
> SwayFX is essentially Sway with extra features, which means Sway-related and i3-related resources also apply to SwayFX.

## Usage

All keybinds are declared in the [sway configuration directory](config/sway) in the following files:
- Global keybinds: [`keys`](config/sway/keys)
- [Binding modes](https://i3wm.org/docs/userguide.html#binding_modes): [`modes`](config/sway/modes)
- Widget keybinds: [`eww`](config/sway/eww)

  These keybinds, implemented using binding modes, are only active when the respective widget is visible.

## Contributing

- **Bugs**: This desktop has only one consistent user (me) and there could be bugs I haven't run into yet. If you have the time to report a bug, please do so in the repository's [issues](https://github.com/elenapan/dotfiles/issues).
- **Pull requests**: Pull requests for bug fixes or README improvements are welcome. However, before starting work on a pull request for a new feature, please open an issue so we can discuss about it first.

## Tip Jar
If you enjoy using this desktop or parts of it and would like to show your appreciation, you may leave a tip here.

It is never required but always appreciated.

Thank you from the bottom of my heart! 💙

- [**Patreon**](https://www.patreon.com/elenapan)
- **Ethereum**: 0x831539d94155C797f786e99f1D061BEc7F11bD38
- **Bitcoin**: 12j3D4KR94LY7Svvmp3KzGbfGC4YCZkCLe

---

<h3 align="center">
    <a href="#"><tt>👆 Back to top</tt></a>
</h3>
