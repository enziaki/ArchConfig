# ArchConfig

A simple install script that installs basic apps on Arch or Debian systems

## Installation


**Before executing the script make sure that `multilib` in included in the
`/etc/pacman.conf` like shown. Otherwise the script will fail.**

![pacman](https://github.com/enziaki/for_ketsu/blob/main/Images/pacmanconf.png "How /etc/pacman.conf should be. Remove the #")

Enter these into the terminal:

If you just want to copy the config files, there is a `--config-only` flag that does just that.
```bash
./install.sh --config-only
```
For complete configuration:

```bash
git clone https://github.com/enziaki/ArchConfig

cd ArchConfig

chmod +x install.sh

./install.sh
```


## Awesome WM theme and config

If you want to use Awesome as your window manager, remove `exec dwm` with `exec
awesome` in `.xinitrc` and remove `dwmblocks &`. The theme file needs to be
copied in `/usr/share/awesome/themes/default/` while the config file needs to
be copied into `~/.config/awesome/` This will already be done by the script but
only the `rc.lua` part. Themes has various ways of installing it.\ *This is not
the only way to do this and this is not even the recommended way to do this.*
*This will override your theme.lua that was given by default on the system.*

**Use this with caution!**
## DWM

My build of [DWM](https://github.com/enziaki/dwm-enzi) along with Dwmblocks gets cloned by the script and is already present in `.xinitrc`
DWM is the default window manager along with alacritty as the default term

## End result
+ This is the default rice with DWM and alacritty
![End result with DWM](./Images/DWMrice.png)

+ This is the rice if you use Awesome
![End result should look something like this.](https://github.com/enziaki/for_ketsu/blob/main/Images/AwesomeRiceImage.png "Awesome (no pun intended) Rice")

## TODO

> [DONE] Change the workflow to DWM instead of Awesome.

> [DONE] DWM patching with the patches and window swallowing.

> [Moving to Gamescope] Moving to wayland and things that are dependent on Xorg using Xwayland.

> [DONE] Using pipewire instead of pulseaudio.

> [DONE] Note: There are some packages in the `install.sh` for Arch Linux that don't return a definite package location for pacman to install. This will result in a Failed script and half copied broken configs. Removing some packages completely resolves this issue. After correction, this section will be moved to TODO 
