echo "The script will now ask you for your sudo password."
sudo su
pacman -Syyu xorg-xrandr pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server steam wine nvidia nvidia-prime nmcli nvidia-utils nvidia-settings mesa-demos wget udisks2 gvfs gvfs-mtp pcmanfm kitty bashtop firefox youtube-dl xterm vlc gvim unzip unrar thermald tlp scrot rofi nitrogen picom ntfs-3g gtkimageview alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect sshfs ttf-sazanami discord zsh acpi python lxappearance libreoffice-fresh dunst 
#starting of the exec codes
neofetch | lolcat
echo "Now I will enable some services which will ask you for your password so be prepared UwU" | lolcat
#systemctl service
echo "You need to enable multilib which will let you install steam and wine. It's in /etc/pacman.conf" | lolcat
echo "Current user: `whoami`"
# Will not be needing the next two lines for my install.
#cp .zshrc ~/
#touch ~/.zsh_history
#Changing the shell to zsh from bash
chsh -s /usr/bin/zsh
#Installing dwm even though you have KDE installed
echo "Downloading DWM and St in `pwd`. For installation refer to extra.txt"
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
wget https://dl.suckless.org/st/st-0.8.4.tar.gz
tar -xpvf dwm-6.2
tar -xpvf st-0.8.4
#just extracting because dwm may require some xorg headers that may or may not be installed on your system
#For installing refer to extra.txt
exit
less extra.txt

