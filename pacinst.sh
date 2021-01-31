echo "The script will now ask you for your sudo password."
sudo su
pacman -Syyu pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server udisks2 gvfs gvfs-mtp pcmanfm kitty bashtop firefox youtube-dl xterm vlc vim unzip unrar thermald tlp scrot rofi nitrogen picom ntfs-3g gtkimageview alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect awesome plasma-meta sddm sshfs ttf-sazanami discord zsh acpi python lxappearance libreoffice-fresh dunst 
#starting of the exec codes
neofetch | lolcat
echo "Now I will enable some services which will ask you for your password so be prepared UwU" | lolcat
echo "exec startpalsma-x11" >> ~/.xinitrc
#systemctl service
systemctl enable sddm
echo "You need to enable multilib which will let you install steam and wine. It's in /etc/pacman.conf" | lolcat
echo "Current user: `whoami`"
cp .zshrc ~/
touch ~/.zsh_history
#Changing the shell to zsh from bash
chsh -s /usr/bin/zsh
#Installing dwm even though you have KDE installed
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
tar -xpvf dwm-6.2
#just extracting because dwm may require some xorg headers that may or may not be installed on your system
less extra.txt

