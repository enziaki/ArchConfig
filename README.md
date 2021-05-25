# For_Ketsu

A simple install script that installs basic apps on arch linux

## Installation

Enter these into the terminal:

Before executing the script make sure that `multilib` in included in the `etc/pacman.conf` otherwise the script will fail.

```
git clone https://github.com/enziaki/for_ketsu
cd for_ketsu
sudo chmod +x pacinst.sh
./pacinst.sh
```


## Awesome WM theme and config

the theme file needs to be copied in `/usr/share/awesome/themes/default/` while the config file needs to be copied into `~/.config/awesome/`

*This is not the only way to do this and this is not even the recommended way to do this.*
*This will override your theme.lua that was given by default on the system.*

**Use this with caution!**


