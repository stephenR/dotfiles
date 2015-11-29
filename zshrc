export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.history
setopt extendedglob
bindkey -v
bindkey "^?" backward-delete-char
bindkey "^W" backward-delete-word

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tsuro/.zshrc'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:matches' group 'yes'
#grouped completion
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt
autoload -U promptinit
promptinit
prompt redhat

setopt hist_ignore_space
setopt hist_ignore_all_dups

alias lsc='ls --color=always'
alias ls='ls --color=auto'
alias grepc='grep --color=always'
alias grep='grep --color=auto'

bindkey "^R" history-incremental-search-backward

zstyle ':completion:*' menu select=5

#dont overwrite files with ">"
setopt noclobber

bindkey "^N" accept-and-menu-complete

bindkey "^P" push-line

alias bell='(notify-send Terminal "Job finished with status $?"; echo -en "\a")'

#switch to last working directory
function cd() {
    builtin cd "$@";
    if [ "$PWD" != "$HOME" ]; then
        echo "$PWD" >! ~/.cwd;
    fi
}
export cd

alias cwd='cd "$(cat ~/.cwd)" 2>/dev/null'

cwd

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats \
       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
fi
}

PROMPT="%F{2}%n@%m:%F{3}%~%{$reset_color%}% :"$'$(vcs_info_wrapper)'"# "

source ~/dotfiles/local/zshrc
