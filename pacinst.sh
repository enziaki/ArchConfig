sudo pacman -Sy pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server udisks2 gvfs gvfs-mtp pcmanfm kitty bashtop firefox youtube-dl xterm vlc vim unzip unrar thermald tlp scrot rofi nitrogen picom ntfs-3g gtkimageview alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect awesome plasma-meta sddm sshfs ttf-sazanami discord zsh acpi python lxappearance libreoffice-fresh 
#starting of the exec codes
neofetch | lolcat
echo "Now I will enable some services which will ask you for your password so be prepared UwU" | lolcat
echo "exec startpalsma-x11" >> ~/.xinitrc
#systemctl service
systemctl enable sddm
echo "You need to enable multilib which will let you install steam and wine. It's in /etc/pacman.conf" | lolcat
echo "Current user: `whoami`"
cp .zshrc ~/
less extra.txt

