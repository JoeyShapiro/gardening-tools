# meh. Dark Blood Rewind, a new beginning.

precmd_get_conda_env_name() {
if [[ -n $CONDA_PREFIX ]]; then
    if [[ $(basename $CONDA_PREFIX) == "anaconda3" ]]; then
        CONDA_ENV="base"
    else
        CONDA_ENV="$(basename $CONDA_PREFIX)"
    fi
else
    CONDA_ENV=""
fi
}
precmd_functions+=( precmd_get_conda_env_name )

# TODO updated all the TIME
precmd_update_prompt() {
PROMPT_CONDA=""
if [[ -n $CONDA_ENV ]]; then
    PROMPT_CONDA='(%{$fg[red]%}%{$fg[white]%}'"$CONDA_ENV"'%{$fg[white]%}%{$fg[red]%})'
fi
    PROMPT=$'\n'"%B%F{black}[%F{green}%D{%m/%d %H:%M}%F{black}] %F{red}%n%F{black}@%F{yellow}%m%F{black}:%F{cyan}%~"$'\n'"%F{magenta}($CONDA_ENV)%F{blue} ➜ %f%b"
PROMPT=$'%{$fg[red]%}┌[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[red]%}@%{$fg_bold[white]%}%m%{$reset_color%}%{$fg[red]%}] [%{$fg_bold[white]%}/dev/%y%{$reset_color%}%{$fg[red]%}] %{$(git_prompt_info)%}%(?,,%{$fg[red]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[red]%}])'"$PROMPT_CONDA"
PROMPT+=$'\n%{$fg[red]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[red]%}]>%{$reset_color%} '
PS2=$' %{$fg[red]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}⚡%{$reset_color%}"
}
precmd_functions+=( precmd_update_prompt )
