sudo pacman -Syyu xorg-xrandr xorg-xsetroot rust xfce4-power-manager xfce4-screenshooter cargo-bloat pamixer ttf-font-awesome pavucontrol awesome feh pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server steam wine nvidia nvidia-prime nvidia-utils nvidia-settings mesa-demos wget udisks2 gvfs gvfs-mtp pcmanfm kitty bashtop firefox youtube-dl xterm vlc gvim unzip unrar thermald tlp scrot rofi nitrogen picom ntfs-3g gtkimageview alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect sshfs ttf-sazanami discord zsh acpi python lxappearance libreoffice-fresh dunst 
#starting of the exec codes
neofetch | lolcat
echo "Now I will enable some services which will ask you for your password so be prepared UwU" | lolcat
echo "You need to enable multilib which will let you install steam and wine. It's in /etc/pacman.conf" | lolcat
echo "Current user: `whoami`"
# Will not be needing the next two lines for my install.
cp .zshrc ~/
touch ~/.zsh_history
#Changing the shell to zsh from bash
sudo chsh -s $(which zsh)

# echo "Downloading DWM and ST in `pwd`. For installation refer to extra.txt"
# wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
# wget https://dl.suckless.org/st/st-0.8.4.tar.gz
# tar -xzvf dwm-6.2.tar.gz
# tar -xzvf st-0.8.4.tar.gz
#just extracting because dwm may require some xorg headers that may or may not be installed on your system
#For installing refer to extra.txt
exit
less extra.txt

