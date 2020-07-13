# How to change the GDM theme

To change the GDM (lock/login screen) theme, you need to replace the system's _default_ GNOME Shell theme.

## :warning: Cautions :warning:

- If the replacement fails, your desktop environment will not work properly. So please **be careful** if doing this.
- When applying this, other third-party GNOME Shell themes would look broken until you restore to the original theme.
- If GNOME Shell has been updated and restored to the original theme, you will need to install this again.
  > Note: On Arch Linux, you can automatically reinstall the GDM theme by creating a [hook](https://wiki.archlinux.org/index.php/Pacman#Hooks) file. For example, if you use oomox-amarena as your GDM theme, put [this file](https://gist.github.com/looselyrigorous/a1aa931ce48627cc39daccc9253b30c7) in the `/usr/share/libalpm/hooks/` directory.

## Requirements

- `glib-compile-resources` — The package name depends on the distro.
  - `glib2` (Arch Linux)
  - `glib2-devel` (Fedora, openSUSE, etc.)
  - `libglib2.0-dev-bin` (Debian, Ubuntu, etc.)
- `libxml2-utils` — Ubuntu users only.

## Installation

1. **Back up** the original theme file first. If you are already using a custom GDM theme, skip this:

  ```sh
  sudo cp -av /usr/share/gnome-shell/gnome-shell-theme.gresource{,~}
  ```

2. Select a **GTK** theme to decide which variant to install.
3. Replace the default theme file:

  ```sh
  GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")
  cd /usr/share/themes/${GTK_THEME}/gnome-shell
  sudo glib-compile-resources --target=/usr/share/gnome-shell/gnome-shell-theme.gresource gnome-shell-theme.gresource.xml
  ```

4. Reload the theme. If you are running GNOME Shell, press <kbd>Alt</kbd> + <kbd>F2</kbd> then type `rt`.

## Uninstallation

1. Restore to the original theme file from the backup:

  ```sh
  sudo mv -v /usr/share/gnome-shell/gnome-shell-theme.gresource{~,}
  ```

2. Reload the theme. If you are running GNOME Shell, press <kbd>Alt</kbd> + <kbd>F2</kbd> then type `rt`.
