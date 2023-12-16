# Gardening Tools
Assortment of stuff i use for my systems

## stuff
oh-my-zsh
brew
git

conda config --set auto_activate_base false
conda config --set changeps1 false

```bash
precmd_get_conda_env_name() {
if [[ -n $CONDA_PREFIX ]]; then
    if [[ $(basename $CONDA_PREFIX) == "miniconda3" ]]; then
        CONDA_ENV="base"
    else
        CONDA_ENV="$(basename $CONDA_PREFIX)"
    fi
else
    CONDA_ENV=""
fi
}
precmd_functions+=( precmd_get_conda_env_name )
precmd_update_prompt() {
    PROMPT=$'\n'"%B%F{black}[%F{green}%D{%m/%d %H:%M}%F{black}] %F{red}%n%F{black}@%F{yellow}%m%F{black}:%F{cyan}%~"$'\n'"%F{magenta}($CONDA_ENV)%F{blue} ➜ %f%b"
}
precmd_functions+=( precmd_update_prompt )
```
