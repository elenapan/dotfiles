# dotfiles
## Some details
+ **OS**: Ubuntu 16.04
+ **WM**: Awesome
+ **Terminal**: Termite
+ **File Manager**: Nemo for GUI, Ranger for terminal
+ **Launcher**: Rofi
+ **Editors**: Spacemacs and Vim
+ **Browsers**: Firefox and Qutebrowser

## Latest preview
![Alt text](./screenshot.png?raw=true "Current desktop")

## Tips / Notes
+ You can open an issue if you have any questions / problems.
+ Are you new to AwesomeWM?

   Then I suggest you start from the default configuration and add pieces you like to it instead of trying to modify someone else's configuration even if you feel really comfortable with that specific config.  
   Otherwise you will have no idea how anything works and how you can modify things to your own liking. Trust me, I've been there.

+ Don't forget to use the [API Documentation for AwesomeWM](https://awesomewm.org/apidoc/index.html).
   
   It is well written and has plenty of examples.
   
### File structure
+ I have split my `rc.lua` into multiple files for organization purposes.

+ The `noodle` directory contains widgets that usually take up more than 50 lines of code.

   I prefer not filling my `bars.lua` with a ton of widget configurations, but also not making a seperate file for every widget.

+ In `themes` you can find a directory for each available theme.

   Such a directory should include at least a `theme.lua` and optionally icons, wallpaper, and whatever asset you need that is theme-specific.

### Things to do before trying out these dotfiles
+ Configure default applications

   In `rc.lua` there is a section where default applications such as terminal, editor and file manager are defined.  
   You should change those to your liking.

+ Configure autostart applications in `autostart.sh`

+ Install rofi

   I use rofi extensively for window switching and launching stuff.

+ Install a Nerd Font

   [Nerd Fonts](https://nerdfonts.com/#downloads) are monospace fonts with a ton of icons included.  
   I use them quite a lot in my bars as icons.

+ Have a general idea of what my keybinds do

   My keybinds will most probably not suit you, but on your first login you might need to know how to navigate the desktop.  

   See the next section for more details.

### Basic keybinds

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
+ `right click` - Main menu
+ `middle click` - Sidebar
+ `scroll up/down` - Cycle through tags
+ `double left click` - Jump to urgent client (or back to last tag if there is no such client)
+ ... And more.

### More details about the sidebar
+ Can be toggled with `super+grave`, middle clicking anywhere on the desktop, or clicking the left icon on the bottom bar.
+ Can be activated by moving the mouse to the edge of the screen and hidden by moving the mouse out of it (these settings can be easily enabled/disabled in your `theme.lua`.
+ By default it is always above windows, and does not grab your keyboard (so you can have it open while doing something else, or just toggle it for a second to check your battery while you are watching something in fullscreen)
+ Most widgets (volume, search, exit, music...) are clickable. 
+ Volume and music update only when they need to, as they are subscribed to pulse and mpd events respectively.
+ For the weather widget I modified this [polybar custom script](https://github.com/x70b1/polybar-scripts/tree/master/polybar-scripts/openweathermap-simple). It uses the [openweathermap API](https://openweathermap.org/api). If you want this to work, you will need to create an account there, get your key, look for your city ID, and place them in `noodle/weather.lua`.

### More details about the exit screen
+ Activate it with `super+escape`, by clicking Exit on the sidebar, or in the right click menu (awesome -> quit)
+ Mouse controls: Click on any icon to execute the command, `right click` or `middle click` anywhere to cancel.
+ Keyboard controls:
  + `escape` or `q` or `x` to cancel
  + `p` to poweroff
  + `r` to reboot
  + `s` to suspend
  + `e` to exit (logout)
  + `l` to lock

## Theme previews
### Manta
![Alt text](./previews/manta.png?raw=true "manta theme")

### Reasons
![Alt text](./previews/reasons.png?raw=true "reasons theme")
