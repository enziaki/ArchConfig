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
# Create a todo txt file using edittodo first
alias todo='cat /home/`whoami`/.todo.txt'
alias edittodo='vim /home/`whoami`/.todo.txt'
