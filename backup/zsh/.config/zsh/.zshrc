# Enable colors and change prompt:
autoload -U colors && colors        #  Load colors
PS1="[%{$fg[yellow]%}%n%B%{$fg[white]%}@%{$reset_color%}%M %{$fg[yellow]%}%~%{$reset_color%}]$%b "

stty stop undef         # Disable ctrl-s to freeze terminal.

# History configurations
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"

# # append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)           # Include hidden files.

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Load Suggestions for Auto-Complete
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Ctrl+R Reverse Search
bindkey '^R' history-incremental-search-backward

alias vim=/usr/bin/nvim
alias vi=/usr/bin/nvim

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx
fi
