<p align="center">
  <img width="25%" src="https://github.com/elenapan.png" />
</p>

<p align="center">
  <b>🎀 Elena's configuration files 🎀</b>
</p>

<p align="center">
<a href="#setup"><img width="150px" style="padding: 0 10px;" src=".assets/setup.png"></a>
<a href="https://github.com/elenapan/dotfiles/wiki"><img width="150px" style="padding: 0 10px;" src=".assets/wiki.png"></a>
<a href="https://github.com/elenapan/dotfiles/wiki/Gallery"><img width="150px" style="padding: 0 10px;" src=".assets/gallery.png"></a>
<a href="#tipjar"><img width="150px" style="padding: 0 10px;" src=".assets/tipjar.png"></a>
</p>


### Thanks for dropping by!

<img src="https://raw.githubusercontent.com/wiki/elenapan/dotfiles/assets/amarena.png" alt="img" align="right" width="400px">

This is my personal collection of configuration files.

You are probably here for my AwesomeWM configuration.

The [setup section](#setup) will guide you through the installation process.

Here are some details about my setup:

+ **WM**: [AwesomeWM](https://github.com/awesomeWM/awesome/) 💙 config included!
+ **OS**: Arch Linux
+ **Shell**: [zsh](https://wiki.archlinux.org/index.php/Zsh)
+ **Terminal**: [kitty](https://github.com/kovidgoyal/kitty/) 💙 config included!
+ **Editor**: [Neovim](https://github.com/neovim/neovim/) 💙 config included!
+ **Org editor**: [Doom Emacs](https://github.com/hlissner/doom-emacs/)
+ **File Manager**: [Thunar](https://git.xfce.org/xfce/thunar/)
+ **Launcher**: [rofi](https://github.com/davatorium/rofi/) 💙 config included!
+ **Browser**: Firefox

## New stuff

- New release: Code name `amarena`
- Brand new sidebar theme
- Revamped dashboard: now with corona stats for your country of choice
- Mini window switcher / manager activated with <kbd>super + tab</kbd>. Check out all its features [here](https://github.com/elenapan/dotfiles/wiki/Desktop-elements#window-switcher)
- Custom mouse-friendly `ncmpcpp` UI
- Adorable battery indicator
- Support for [PAM authentication](https://wiki.archlinux.org/index.php/PAM) through the built-in lock screen
- Cleaner code (but no one will notice)

## Setup

Here are the instructions you should follow to replicate my AwesomeWM setup.

1. Install the [git version of AwesomeWM](https://github.com/awesomeWM/awesome/).

   **Arch users** can use the [awesome-git AUR package](https://aur.archlinux.org/packages/awesome-git/).
   ```shell
   yay -S awesome-git
   ```

   **For other distros**, build instructions are [here](https://github.com/awesomeWM/awesome/#building-and-installation).

2. Install dependencies and enable services

   *If you are curious, [click here](https://github.com/elenapan/dotfiles/wiki/Detailed-dependency-table) to see a table of dependencies and why they are needed.*

   + Software

     - **Ubuntu** 18.04 or newer (and all Ubuntu-based distributions)

         ```shell
         sudo apt install rofi lm-sensors acpid jq fortune-mod redshift mpd mpc maim feh pulseaudio inotify-tools xdotool

         # Install light, which is not in the official Ubuntu repositories
         wget https://github.com/haikarainen/light/releases/download/v1.2/light_1.2_amd64.deb
         sudo dpkg -i light_1.2_amd64.deb
         ```

     - **Arch Linux** (and all Arch-based distributions)

         *Assuming your AUR helper is* `yay`

         ```shell
         yay -S rofi lm_sensors acpid jq fortune-mod redshift mpd mpc maim feh light-git pulseaudio inotify-tools xdotool
         ```
   + Services

      ```shell
      # For automatically launching mpd on login
      systemctl --user enable mpd.service
      systemctl --user start mpd.service
      # For charger plug/unplug events (if you have a battery)
      sudo systemctl enable acpid.service
      sudo systemctl start acpid.service
      ```

3. Install needed fonts

   You will need to install a few fonts (mainly icon fonts) in order for text and icons to be rendered properly.

   Necessary fonts:
   + **Typicons** - [github](https://github.com/fontello/typicons.font)
   + **Material Design Icons** - [dropbox](https://www.dropbox.com/s/4fevs095ho7xtf9/material-design-icons.ttf?dl=0)
   + **Icomoon** - [dropbox](https://www.dropbox.com/s/hrkub2yo9iapljz/icomoon.zip?dl=0)
   + **Nerd Fonts** - [website](https://www.nerdfonts.com/font-downloads)
      (You only need to pick and download one Nerd Font. They all include the same icons)
   + **Scriptina** - [website](https://www.dafont.com/scriptina.font) - Handwritten font used in the lock screen

   Optional fonts:
   + **My custom Iosevka build** - [dropbox](https://www.dropbox.com/s/nqyurzy8wcupkkz/myosevka.zip?dl=0) - 💙 *my favorite monospace font*
   + **Anka/Coder**
   + **Google Sans** - 💙 *my favorite sans font*
   + **Roboto Condensed**
   + **San Francisco Display**

   Once you download them and unpack them, place them into `~/.fonts` or `~/.local/share/fonts`.
   - You will need to create the directory if it does not exist.
   - It does not matter that the actual font files (`.ttf`) are deep inside multiple directories. They will be detected as long as they can be accessed from `~/.fonts` or `~/.local/share/fonts`.

   You can find the fonts required inside the `misc/fonts` folder of the repository.
   ```shell
   cp -r ./misc/fonts/* ~/.fonts/
   # Or to ~/.local/share/fonts
   cp -r ./misc/fonts/* ~/.local/share/fonts/
   ```
   Finally, run the following in order for your system to detect the newly installed fonts.
   ```shell
   fc-cache -v
   ```

4. Install my AwesomeWM configuration files

   ```shell
   git clone https://github.com/elenapan/dotfiles
   cd dotfiles
   [ -e ~/.config/awesome ] && mv ~/.config/awesome ~/.config/awesome-backup-"$(date +%Y.%m.%d-%H.%M.%S)" # Backup current configuration
   cp -r config/awesome ~/.config/awesome
   ```

4. Configure stuff

   The relevant files are inside your `~/.config/awesome` directory.

   + User preferences and default applications

      In `rc.lua` there is a *User variables and preferences* section where user preferences and default applications are defined.
      You should change those to your liking. Probably the most important change you can make is to set your `terminal`.

      For more sophisticated control over your apps, check out `apps.lua`

      Note: For the weather widgets to work, you will also need to create an account on [openweathermap](https://openweathermap.org), get your key, look for your city ID, and set `openweathermap_key` and `openweathermap_city_id` accordingly.

   + Have a general idea of what my keybinds do

      My keybinds will most probably not suit you completely, but on your first login you might need to know how to navigate the desktop.

      See the [keybinds](#keybinds) section for more details.

      You can edit `keys.lua` to configure your keybinds.

   + *(Optional)* This is also a good time to take a look at [how my configuration is structured](#awesomewm-configuration-file-structure) in order to understand the purpose of each file.

5. Login with AwesomeWM 🎉

   Congratulations, at this point you should be ready to log out of your current desktop and into AwesomeWM.

   Your login screen should have a button that lets you change between available desktop sessions. If not, [click here](https://github.com/elenapan/dotfiles/wiki/Troubleshooting#i-cannot-find-the-login-screen-button-that-lets-me-login-with-awesomewm) to find out how to fix it.

   Try it, play with it, enjoy it.
   Consider checking out the [Advanced setup](https://github.com/elenapan/dotfiles/wiki/Advanced-setup) in order to enable and configure various components that are not needed to use the desktop, but provide a better experience.


6. *(Optional)* Eye-candy

   + Set the wallpaper

      ```shell
      feh --bg-fill /path/to/your/wallpaper
      ```

   + Load a colorscheme

      ```shell
      xrdb -merge /path/to/colorscheme
      ```

      Notes:
      - To see the new colors you should restart AwesomeWM with <kbd>super+shift+r</kbd> or by right-clicking the desktop and clicking the gear icon (bottom-right).
      - In the [.xfiles](.xfiles) directory of the repository I provide you with a few of my own colorschemes, but you can also use your favorite one.
      - All of my AwesomeWM themes take their colors from `xrdb`. This also means that they play nice with tools like [pywal](https://github.com/dylanaraps/pywal).


## AwesomeWM configuration: File structure

After setting up my AwesomeWM configuration, inside `~/.config/awesome` you will find the following:

+ 🔧 `rc.lua`

   The main configuration file which binds everything together.

   This file allows you to set user preferences, choose themes, configure default layouts for each tag, window rules and more.
   It is also responsible for initializing all necessary desktop components.

+ ⌨️ `keys.lua`

   It initializes global and client keybinds.
   In addition, it defines what mouse clicks do on windows, window titlebars or the desktop.

+ 🎮 `apps.lua`

   Provides functions for *activating* various applications, meaning either spawning them, focusing them or toggling them depending on whether they are currently running or not.

+ 📚 `helpers.lua`

   Provides various uncategorized helper functions to make our life easier and our code cleaner.

+ 🎨 `themes` directory

   Here you can find a directory for each available theme.

   Such a directory should include at least a `theme.lua` and optionally icons, wallpaper, and whatever asset you need that is theme-specific.
   The `theme.lua` file usually sets colors, sizes and positions of various elements.

+ 🖼 `icons` directory

   Here you can find a directory for each available icon theme and an `init.lua` file which initializes the `icons` variables.

   Icons can be images taken from the selected icon theme or text symbols taken from some icon font.

   For example, `icons.image.firefox` can be used to refer to your selected theme's Firefox icon instead of using the full path to the image. This makes it easy to switch between themes.

   Note: Icon themes defined here have nothing to do with your system-wide icon theme.

+ 🎀 `decorations` directory

   In this directory you can find window decoration (titlebar) styles.

   They affect the layout of the titlebar and the titlebar buttons (e.g. close, maximize, minimize).

   Optionally, they may implement more complex decorations, using multiple titlebars around the window to create a certain look (e.g. double borders) or achieve anti-aliased window corners.

   Finally, some clients may have their own special titlebars added to them in order to simulate a custom UI.
   For now, a custom `mpd` UI has been implemented.

   The `decorations` module also includes helper functions that generate titlebar buttons, in case you do not have/want image buttons.

+ 💎 `elemental` directory

   Contains desktop components or *elements* such as bars, sidebars, lock screens and more.
   Elements with multiple available themes have their own directory. For example:

   + In `elemental/bar` you can find a `.lua` file for each available bar or bar group.

      Multiple bars can be created in one file.
      Every bar theme provides the global functions `wibars_toggle()` and `tray_toggle()` which you can bind to any keys you want.

   + In `elemental/sidebar` you can find a `.lua` file for each available sidebar theme.

   + ... And so on.

+ 💬 `notifications` directory

   This directory includes notification daemons that trigger notifications for various desktop events such as volume or brightness change.
   Also it includes notification themes that define the layout of the notification contents.

+ 🍜 `noodle` directory: Contains widgets that usually take up more than 50 lines of code.

   Widgets display information in visual form (text, images, progress bars).
   Without them, all desktop elements would just be empty boxes.
   They are used by the desktop components defined inside the `elemental` directory.
   Widgets can be defined in any file but I prefer to separate a big widget (with a lot of logic) from the element I am using it in.

+ 😈 `evil` directory

   Contains daemons (processes that run in the background) which emit system info.

   They provide an easy way of writing widgets that rely on external information. All you need to do is subscribe to the signal a daemon provides.
   No need to remember which shell command gives you the necessary info or bother about killing orphan processes. Evil takes care of everything.

## Keybinds

I use <kbd>super</kbd> AKA Windows key as my main modifier.

#### Keyboard
| Keybind | Action |
| --- | --- |
| <kbd>super + enter</kbd> | Spawn terminal |
| <kbd>super + shift + enter</kbd> | Spawn floating terminal |
| <kbd>super + d</kbd> | Launch rofi |
| <kbd>super + shift + q</kbd> | Close client |
| <kbd>super + control + space</kbd> | Toggle floating client |
| <kbd>super + [1-0]</kbd> | View tag AKA change workspace (for you i3 folks) |
| <kbd>super + shift + [1-0]</kbd> | Move focused client to tag |
| <kbd>super + s</kbd> | Tiling layout |
| <kbd>super + shift + s</kbd> | Floating layout |
| <kbd>super + w</kbd> | Maximized / Monocle layout |
| <kbd>super + [arrow keys]</kbd> | Change focus by direction |
| <kbd>super + [hjkl]</kbd> | ^ |
| <kbd>super + shift + [arrow keys]</kbd> | Move client by direction. Move to edge if it is floating. |
| <kbd>super + shift + [hjkl]</kbd> | ^ |
| <kbd>super + control + [arrow keys]</kbd> | Resize client |
| <kbd>super + control + [hjkl]</kbd> | ^ |
| <kbd>super + f</kbd> | Toggle fullscreen |
| <kbd>super + m</kbd> | Toggle maximize |
| <kbd>super + n</kbd> | Minimize |
| <kbd>super + shift + n</kbd> | Restore minimized |
| <kbd>super + c</kbd> | Center floating client |
| <kbd>super + u</kbd> | Jump to urgent client (or back to last tag if there is no such client) |
| <kbd>super + b</kbd> | Toggle bar |
| <kbd>super + =</kbd> | Toggle tray |

*... And many many more.*

#### Mouse on the desktop
| Mousebind | Action |
| --- | --- |
| `left click` | Dismiss all notifications, close sidebar and main menu |
| `double left click` | Jump to urgent client (or back to last tag if there is no such client) |
| `right click` | App drawer |
| `middle click` | Dashboard |
| `scroll up/down` | Cycle through tags |
| `move to screen edge` | Show sidebar |

#### Mouse on window titlebars
| Mousebind | Action |
| --- | --- |
| `left click` | Focus and raise |
| `left click (drag)` | Move |
| `right click (drag)` | Resize |
| `middle click` | Close |

### Notes
If you have any questions or issues, first check if you can find your answer in the [wiki](https://github.com/elenapan/dotfiles/wiki).
Then you can search in the repository's [issues](https://github.com/elenapan/dotfiles/issues) or make a new issue.

### Tipjar
If you enjoy my themes and would like to show your appreciation, you may tip me here.

It is never required but always appreciated.

Thank you from the bottom of my heart! 💙

- [**Patreon**](https://www.patreon.com/elenapan)
- **Ethereum**: 0x831539d94155C797f786e99f1D061BEc7F11bD38
- **Bitcoin**: 12j3D4KR94LY7Svvmp3KzGbfGC4YCZkCLe
