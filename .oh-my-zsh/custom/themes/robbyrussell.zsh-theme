PROMPT="%{$fg_bold[yellow]%}(%*) %{$fg[white]%}[%{$fg[green]%}%n%{$fg[white]%}@%{$fg[red]%}%m %{$fg_bold[magenta]%}%c%{$fg[white]%}]$ %{$reset_color%}"
PROMPT="\$(git_prompt_info) $PROMPT"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
