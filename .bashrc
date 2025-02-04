#
# ~/.bashrc
#

# If not running interactively, don't do anything
#[[ $(tty) == /dev/tty3 ]] && exec Hyprland

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
BLACK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"

#PS1='(${YELLOW}\t${WHITE}) [${YELLOW}\u${WHITE}@${YELLOW}\h ${WHITE}\W${WHITE}]$YELLOW$ $WHITE'
#PS1='\[$YELLOW\](\t) \[\e[0m\][\[$GREEN\]\u\[\e[0m\]@\[$RED\]\h \[$MAGENTA\]\W\[\e[0m\]]\$ \[\e[0m\]'

export PATH="$PATH:$HOME/.local/bin:/opt/android-sdk/platform-tools:$HOME/.cargo/bin"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export HISTCONTROL=ignoreboth:erasedups
export EDITOR=/usr/bin/nvim
#export GTK_THEME="Arc-Dark"
#export GDK_BACKEND=wayland
#export QT_QPA_PLATFORM=wayland
#export QT_QPA_PLATFORMTHEME=qt5ct
#MOZ_USE_XINPUT2=1
#source <(kubectl completion bash)
WLR_NO_HARDWARE_CURSORS=1

alias vim='/usr/bin/nvim'

if [ "$TMUX" = "" ]; then tmux; fi
