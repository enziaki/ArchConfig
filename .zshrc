# Lines configured by zsh-newuser-install
PROMPT='%~> '
HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=100000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

cat /home/`whoami`/.cache/wal/sequences



#aliases
alias b='bashtop'
alias spnd='i3lock-fancy-rapid 9 30 && systemctl suspend -i'
alias weather='curl wttr.in'
alias gp='git push'
alias gm='git commit -m'
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias install='sudo pacman -S'
alias n='neofetch'
alias search='yay -Ss'
alias python='python3'
alias p='python3'
alias upgrade='sudo pacman -Syyu'
alias todo='cat /home/`whoami`/.todo.txt'
# edittodo can be used to create  the hidden text file and can be manipulated easily
alias edittodo='vim /home/`whoami`/.todo.txt'
alias bruh='clear'
alias mc='cd ~/Downloads && prime-run java -jar TLauncher-2.792_beta.jar && exit'
alias govperf='echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias gov='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'

# Spawns
date
