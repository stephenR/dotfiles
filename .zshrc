export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

#temp from vincent
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
#zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:options' auto-description '%d'


autoload -Uz compinit
compinit
# End of lines added by compinstall

# correction
#setopt correctall

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

alias vim='gvim -v'

export PATH="/home/tsuro/opt/bin:$PATH:/sbin:/usr/sbin:/usr/local/sbin"

bindkey "^R" history-incremental-search-backward

zstyle ':completion:*' menu select=5

#dont overwrite files with ">"
setopt noclobber

bindkey "^N" accept-and-menu-complete

bindkey "^P" push-line

# change the cursor color with vi mode - only works in rxvt-unicode, afaik
zle-keymap-select () {
    if [[ $TERM == "rxvt" ]]; then
        if [ $KEYMAP = vicmd ]; then
            echo -ne "\033]12;Red\007"
        else
            echo -ne "\033]12;Grey\007"
        fi
    fi
}
zle -N zle-keymap-select
zle-line-init () {
    zle -K viins
    if [[ $TERM == "rxvt" ]]; then
        echo -ne "\033]12;Grey\007"
    fi
    # echo -n "[?25l"
}
zle -N zle-line-init

#TODO syntax highlighting

alias bell='echo -en "\a"'

#switch to last working directory
function cd() {
    builtin cd "$@";
    if [ "$PWD" != "/home/tsuro" ]; then
        echo "$PWD" >! ~/.cwd;
    fi
}
export cd

alias cwd='cd "$(cat ~/.cwd)" 2>/dev/null'

cwd

#export LD_PRELOAD="/home/tsuro/workspace/opt/stderred/build/libstderred.so${LD_PRELOAD:+:$LD_PRELOAD}"
