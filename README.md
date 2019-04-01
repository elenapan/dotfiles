# dotfiles
## Some details
+ **OS**: Antergos
+ **WM**: Awesome
+ **Terminal**: xst (fork of Suckless terminal)
+ **File Manager**: Nemo for GUI, Ranger for terminal
+ **Bar Icons**: Typicons Font
+ **Launcher**: Rofi
+ **Editor**: Vim
+ **Browser**: Firefox

## Latest preview
![Screenshot](./previews/skyfall.png?raw=true "Latest")

## Dependencies
Here is a list of dependencies needed for making these themes work.
If you install all of them you will have a (mostly) smooth out of the box experience.
Of course, not all of them actually do something useful (see `fortune-mod` dependency).
Also if you are willing to edit a few configuration files, **which you will have to do** at some point, most of these dependencies can be replaced. For example you can replace `i3lock` with your own command, `rofi` with `dmenu`, my `screenshot.sh` script with `scrot`.

If you notice that something is missing, please open an issue so I can add the dependency to this table.

| Dependency | Description | Why/Where is it needed? |
| --- | --- | --- |
| `awesome` v4.2+ | Window manager | (explains itself) |
| `rofi` | Window switcher, application launcher and dmenu replacement | (explains itself) |
| `xorg-xbacklight` | Gets/Sets screen brightness (intel GPU only) | brightness widget |
| `lm_sensors` | CPU temperature sensor | CPU temperature widget |
| `upower` | Abstraction for enumerating power devices, listening to device events and more | battery widget |
| `pulseaudio`, `libpulse` | Sound system **(You probably already have these)** | volume widget, [bin/volume-control.sh](./bin/volume-control.sh) script |
| [bin/volume-control.sh](./bin/volume-control.sh) in your `$PATH` | Commands to control your volume | volume buttons, volume widget |
| `jq` | Parses `json` output | weather widget |
| `fortune-mod` | Displays random quotations (fortune cookies) | fortune widget |
| `mpd` | Server-side application for playing music | **sidebar** music widget |
| `mpc` | Minimalist command line interface to MPD | **sidebar** music widget |
| `i3lock` | Screen locker | exit screen lock command |
| `maim` | Takes screenshots (improved `scrot`) | [bin/screenshot.sh](./bin/screenshot.sh) script |
| [bin/screenshot.sh](./bin/screenshot.sh) in your `$PATH` | Commands to take/view screenshots | screenshot button |
| `feh` | Image viewer and wallpaper setter | screenshot previews, wallpapers |
| *Typicons* font | Icon font | text exit screen, text weather icons, *skyfall* bar |
| Any *Nerd Font* | Icon font | *manta* bar icons, *skyfall* taglist icons |
| [openweathermap](https://openweathermap.org/) key | Provides weather data | weather widgets |

## Things to do after you set up dependencies
+ Backup your current `~/.config/awesome` directory if you have one and copy this repo's `config/awesome` directory in its place.

+ Configure default applications

   In `rc.lua` there is a section where default applications such as terminal, editor and file manager are defined.
   You should change those to your liking.

+ Configure autostart applications in `autostart.sh`

+ *(Optional)* Load any `Xresources` colorscheme (`xrdb -merge <colorscheme file>`). In the [.xfiles](.xfiles) directory I provide you with a few of my own colorschemes, but you can also use your favorite one. All of my AwesomeWM themes take their colors from `xrdb`.

+ Have a general idea of what my keybinds do

   My keybinds will most probably not suit you, but on your first login you might need to know how to navigate the desktop.

   See the **Basic keybinds** section for more details.

**You are now ready to login with AwesomeWM!**

## Some recommended applications
+ **Terminals**: Termite / Kitty / urxvt / st
+ **File managers**: Nemo / Thunar
+ **Launchers**: Rofi / dmenu
+ **Browsers**: Firefox (with Vimium extension) / Qutebrowser
+ **Editors**: Vim / Sublime Text (with NeoVintageous plugin) / Spacemacs
+ **Music players**: mpd (with ncmpcpp)

### Eye-candy suggestions
- [bin/bunnyfetch](./bin/bunnyfetch) script - Display some system info
- `neofetch` - Display a ton of system info
- [even-better-ls](https://github.com/illinoisjackson/even-better-ls) - Icons for the `ls` command
- `cava` - Audio visualizer

## AwesomeWM configuration: File structure
+ I have split my `rc.lua` into multiple files for organization purposes.

+ The `noodle` directory contains widgets that usually take up more than 50 lines of code.

   I prefer not filling my `bars.lua` with a ton of widget configurations, but also not making a seperate file for every widget.

+ In `themes` you can find a directory for each available theme.

   Such a directory should include at least a `theme.lua` and optionally icons, wallpaper, and whatever asset you need that is theme-specific.

+ In `bar_themes` you can find a `.lua` file for each available bar or bar group.

   Multiple bars can be created in one file.

## Basic keybinds

I use `super` AKA Windows key as my main modifier.

#### Keyboard
+ `super + enter` - Spawn terminal
+ `super + shift + enter` - Spawn floating terminal
+ `super + d` - Launch rofi
+ `super + shift + q` - Close client
+ `super + control + space` - Toggle floating client
+ `super + [1-0]` - View tag AKA change workspace (for you i3 folks)
+ `super + shift + [1-0]` - Move focused client to tag
+ `super + s` - Tiling layout
+ `super + shift + s` - Floating layout
+ `super + w` - Maximized / Monocle layout
+ `super + [arrow keys]` - Change focus by direction
+ `super + j/k` - Cycle through clients
+ `super + h/l` - Add / remove clients to / from master area
+ `super + shift + [arrow keys] / [hjkl]` - Move client by direction. Move to edge if it is floating.
+ `super + control + [arrow keys] / [hjkl]` - Resize
+ `super + f` - Toggle fullscreen
+ `super + m` - Toggle maximize
+ `super + n` - Minimize
+ `super + shift + n` - Restore minimized
+ `super + c` - Center floating client
+ `super + u` - Jump to urgent client (or back to last tag if there is no such client)
+ `super + shift + b` - Toggle bar
+ `super + =` - Toggle tray
+ ... And many many more.

#### Mouse on desktop
+ `left click` - Dismiss all notifications, close sidebar and main menu
+ `double left click` - Jump to urgent client (or back to last tag if there is no such client)
+ `right click` - Main menu
+ `middle click` - Start screen
+ `scroll up/down` - Cycle through tags
+ `move to left/right edge` - Show sidebar
+ ... And more.

#### Mouse on titlebars
+ `left click` - Focus and raise
+ `left click (drag)` - Move
+ `right click (drag)` - Resize
+ `middle click` - Close
+ ... And more.

## Custom titlebars per class / name / whatever
+ For the custom titlebars to work your terminal or application needs to be able to set its own class or name

   Example: For the mpd titlebar it needs to have class "music" or name "Music Terminal". You can change this in `titlebars.lua`.
   You can find an example script that launches a terminal like this in `bin/music_terminal`
    ```shell
    # Termite
    termite --class music --exec ncmpcpp
    # st / xst
    st -c music -e ncmpcpp
    # urxvt
    urxvt -T "Music Terminal" -e ncmpcpp
    ```
+ Of course you can set your own custom titlebars for any application as long as you know its class, name, instance, whatever and then creating a custom titlebar setup in the existing if-else block in `titlebars.lua`. For example `if c.class == "Thunar" ...`
+ You can find details such as class, name, and others for any client with the `xprop` utility.

## More details about the start screen
+ Activate it with `super+F1`, or by middle clicking anywhere on the desktop.
+ Dismiss with `escape`, `q` or `F1` or `middle click`.
+ You can scroll on the calendar to switch to the previous / next month. Left click to reset.
+ The fortune box requires `fortune-mod`. Clicking it gives you a new fortune cookie :)
+ The brightness bar requires `xorg-xbacklight`.
+ The bell icon suspends / re-enables notifications on click.
+ The camera icon takes a screenshot instantly on left click and with a 5 second delay on right click. Requires "screenshot.sh" from my repo. Alternatively you can set your own screenshot command.

## More details about the sidebar
+ Can be toggled with `super+grave`.
+ Can be activated by moving the mouse to the edge of the screen and hidden by moving the mouse out of it (these settings can be easily enabled/disabled in your `theme.lua`).
+ By default it is always above windows, and does not grab your keyboard (so you can have it open while doing something else, or just toggle it for a second to check your battery while you are watching something in fullscreen).
+ Most widgets (volume, search, exit, music...) are clickable.
+ Volume and music update only when they need to, as they are subscribed to pulse and mpd events respectively.
+ For the weather widget I modified this [polybar custom script](https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/openweathermap-simple). It uses the [openweathermap API](https://openweathermap.org/api). If you want this to work, you will need to create an account there, get your key, look for your city ID, and place them in `noodle/weather.lua`. (Same goes for `text_weather.lua`)

## More details about the exit screen
+ Activate it with `super+escape`, by clicking Exit on the sidebar, or in the right click menu (awesome -> quit)
+ Mouse controls: Click on any icon to execute the command, `right click` or `middle click` anywhere to cancel.
+ Keyboard controls:
  + `escape` or `q` or `x` to cancel
  + `p` to poweroff
  + `r` to reboot
  + `s` to suspend
  + `e` to exit (logout)
  + `l` to lock

## Tips / Notes
+ You can open an issue if you have any questions / problems.
   
   Do not forget to search through old issues first. They could already contain an answer to your question.
   Also make sure you have the latest version of the repo. Little fixes happen all the time.

+ If you are new to AwesomeWM...
   
   I suggest you start from the default configuration and add pieces you like to it instead of trying to modify someone else's configuration even if you feel really comfortable with that specific config.
   Otherwise you will have no idea how anything works and how you can modify things to your own liking. Trust me, I've been there.

+ Don't forget to use the [API Documentation for AwesomeWM](https://awesomewm.org/apidoc/index.html).
   
   It is well written and has plenty of examples.

## Theme previews
### Lovelace
![Screenshot](./previews/lovelace.png?raw=true "lovelace theme")

### Manta
![Screenshot](./previews/manta.png?raw=true "manta theme")

### Reasons
![Screenshot](./previews/reasons.png?raw=true "reasons theme")
