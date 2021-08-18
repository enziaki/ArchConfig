# For_Ketsu

A simple install script that installs basic apps on Arch/Artix Linux after the base system install.

## Installation

Enter these into the terminal:

**Before executing the script make sure that `multilib` in included in the
`/etc/pacman.conf` Like shown. Otherwise the script will fail.**



```
git clone https://github.com/enziaki/for_ketsu
cd for_ketsu
sudo chmod +x pacinst.sh
./pacinst.sh
```


## Awesome WM theme and config

The theme file needs to be copied in `/usr/share/awesome/themes/default/` while
the config file needs to be copied into `~/.config/awesome/` This will already
be done by the script but only the `rc.lua` part. Themes has various ways of
installing it.\
*This is not the only way to do this and this is not even the
recommended way to do this.* *This will override your theme.lua that was given
by default on the system.*

**Use this with caution!**

## Picom

Picom must be enabled in the `.xinitrc` with `picom --experimental-backends` to use blur like so
```
picom --experimental-backends &

```
## End result

![End result should look something like this.](https://github.com/enziaki/for_ketsu/blob/main/Images/AwesomeRiceImage.png "Awesome (no pun intended) Rice")

## TODO

> Change the workflow to DWM instead of Awesome.\
> DWM patching with the patches and window swallowing.\
> Moving to wayland and things that are dependent on Xorg using Xwayland.\
> Using pipewire instead of pulseaudio.\
