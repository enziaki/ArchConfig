sudo pacman -S pulseaudio pulseaudio-alsa xorg xorg-xinit xorg-server udisks2 gvfs gvfs-mtp pcmanfm alcritty kitty bashtop firefox kate evince youtube-dl xterm vlc vim unzip unrar thermald tlp scrot rofi nitrogen picom ntfs-3g gtkimageview alsa-utils neofetch lolcat handbrake gimp figlet discord kdeconnect awesome steam wine nvidia nvidia-dkms plasma-meta sddm 
#starting of the exec codes
echo "exec startpalsma-x11" >> ~/.xinitrc
#systemctl service
systemctl enable sddm.service && systemctl start sddm
