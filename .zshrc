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
