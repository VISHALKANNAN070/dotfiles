# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vishal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#alias
alias c='clear'
alias q='exit'
alias f='yay -Ss'
alias g='yay -S'
alias w='micro'
#Username custom
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# Colors
name_color="%F{blue}"
arrow_color="%F{green}"
path_color="%F{yellow}"
reset="%f"

PROMPT=$'%F{blue}${USER}${reset}%f %F{green}→%f %F{yellow}%~%f\n%# '
export "MICRO_TRUECOLOR"=1
export PATH="$HOME/.local/bin:$PATH"
