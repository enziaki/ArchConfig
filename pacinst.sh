
sudo pacman -Syyu xorg-xrandr xorg-xsetroot nvidia-dkms parcellite nomacs rust xfce4-power-manager xfce4-screenshooter cargo-bloat ttf-font-awesome pavucontrol volumeicon awesome feh pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server steam wine nvidia nvidia-prime nvidia-utils nvidia-settings mesa-demos wget udisks2 gvfs gvfs-mtp nautilus kitty bashtop firefox youtube-dl xterm vlc gvim unzip file-roller unrar thermald tlp scrot rofi nitrogen picom ntfs-3g alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect sshfs ttf-sazanami discord zsh acpi python lxappearance libreoffice-fresh dunst chromium code htop java8-openjfx jdk8-openjdk jre8-openjdk jre8-openjdk-headless lib32-nvidia-utils mpv network-manager-applet noto-fonts-emoji sxiv

neofetch | lolcat
echo "Now I will enable some services which will ask you for your password so be prepared" | lolcat
echo "Current user: `whoami`"

#Copying the zshrc file to home
cp .zshrc ~/
touch ~/.zsh_history

# Changing the shell to zsh from bash
chsh -s $(which zsh)

#Copying the config files to their destined places
mkdir ~/.config/awesome/ ~/.config/picom/

#Copying the awesome dotfile (just the config because theme is optional)
cp awesome/rc.lua ~/.config/awesome/

#copying the picom config
cp picom/picom.conf ~/.config/picom/

echo "Downloading DWM and ST in `pwd`. For installation refer to extra.txt"
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
wget https://dl.suckless.org/st/st-0.8.4.tar.gz

#extracting dwm and st
tar -xpvf dwm-6.2.tar.gz
tar -xpvf st-0.8.4.tar.gz

# Cloning yay-git 
git clone https://aur.archlinux.org/yay-git.git

#For installation refer to extra.txt
less extra.txt

