# Lines configured by zsh-newuser-install
PROMPT='%F{#cc6666}$THEME_VI_MODE_SYMBOL$THEME_PROMPT_PREFIX%f%B%F{#81a2be}%~> %f%b'
HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# cat /home/`$USER`/.cache/wal/sequences

# Using vim keys for easier navigation of commands in the terminal
set -o vi
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

## Options
THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'>>'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'__'}

## Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
  if [ "${KEYMAP}" = 'vicmd' ]; then
    THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
  else
    THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  fi
  zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
  THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
  return $(( 128 + $1 ))
}

#aliases
alias spnd='i3lock-fancy-rapid 9 30 && systemctl suspend -i'
alias weather='curl wttr.in'
alias gp='git push'
alias gm='git commit -m'
alias gs='git status'
alias gl='git log'
alias ga='git add'
alias install='paru -S'
alias n='neofetch'
alias search='paru -Ss'
alias python='python3'
alias p='python3'
alias upgrade='sudo pacman -Syyu'
alias bruh='clear'
alias mc='cd ~/Downloads && prime-run java -jar TLauncher-2.792_beta.jar && exit'
alias govperf='echo "performance" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias gov='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'
alias cls='clear && ls'
alias ls='ls --color'
# Spawns
date
