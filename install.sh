os=$(cat /etc/*release | grep "^ID=")

common(){
# A common function. Regardless of the distro being used
 neofetch | lolcat
 echo "Current user: $(whoami)"

#Copying the zshrc file to home
  cp .zshrc ~/
  touch ~/.zsh_history

# Changing the shell to zsh from bash
  chsh -s $(which zsh)
 
#Making some folders for video conversion scripts that I use for davinci resolve
  mkdir -p ~/Videos/Scripts
  cp VideoScripts/*.sh ~/Videos/Scripts

#copying the alacritty config
  cp Alacritty/alacritty.yml ~/.config/alacritty

#Vim and it's files
  cp vim/.vimrc ~/

}

archinstall(){
  echo "Installing for Arch Linux on user $(whoami)"
  sudo pacman -Syyu xorg-xrandr xorg-xsetroot nvidia parcellite nomacs rust xfce4-power-manager cargo-bloat evince \
ttf-font-awesome pipewire awesome feh xorg xorg-xinit xorg-server steam wine nvidia nvidia-prime \
nvidia-utils nvidia-settings mesa-demos wget udisks2 gvfs gvfs-mtp nautilus kitty bashtop firefox youtube-dl xterm gvim unzip file-roller \
unrar thermald tlp scrot rofi nitrogen picom ntfs-3g alsa-utils neofetch lolcat handbrake gimp figlet playerctl kdeconnect sshfs ttf-sazanami \
zsh acpi python lxappearance libreoffice-fresh dunst code htop jdk8-openjdk jre8-openjdk jre8-openjdk-headless \
lib32-nvidia-utils mpv network-manager-applet noto-fonts-emoji sxiv aarch64-linux-gnu-gcc arm-none-eabi-gcc blueberry xfce4-settings ttf-fira-sans \
ttf-fira-code otf-fira-mono otf-fantasque-sans-mono ttf-fantasque-sans-mono bottom ttf-jetbrains-mono-nerd ttf-jetbrains-mono  \ 
opencl-nvidia flameshot alacritty


#Copying the config files to their destined places
  mkdir ~/.config/awesome/ ~/.config/picom/ ~/.config/alacritty

#Copying the awesome dotfile (just the config because theme is optional)
  cp awesome/rc.lua ~/.config/awesome/

#copying the picom config
  cp picom/picom.conf ~/.config/picom/

# Cloning paru (my package manager)
  git clone https://aur.archlinux.org/paru.git
  ( cd paru && makepkg -si )

# needed paru packages
  paru -Syy davinci-resolve i3lock-fancy-rapid-git google-chrome myxer vim-plug

# Copying xinitrc
  cp .xinitrc ~/

# Cloning DWM
git clone https://github.com/enziaki/dwm-enzi
( cd dwm-enzi && sudo make clean install)
( cd dwm-enzi/dwmblocks && sudo make clean install )

}

debinstall(){
  echo "Installing for Debian on user $(whoami)"
  sudo apt-get update && sudo apt upgrade -y
  sudo apt install wine steam gimp lolcat zsh figlet vim-gtk3 discord htop bashtop lutris gnome-tweak-tool gnome-shell-extensions tlp powertop neofetch bashtop q4wine xorriso vlc torbrowser-launcher youtube-dl audacity handbrake psensor gnome-shell-extension-pixelsaver gnome-shell-extension-dash-to-panel obs-studio -y
}

if [ $os = "ID=arch" ]; then
  archinstall
  common

elif [ $os = "ID=pop" ] || [ $os = "ID=debian" ]; then
  debinstall
  common

else
  echo "Distro not recognized!"
  exit 
fi 
