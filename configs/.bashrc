set -o vi

export VISUAL=nvim
export EDITOR="$VISUAL"
export PAGER="$VISUAL +Man!"

alias vi="nvim"
alias vim="nvim"
alias nvimdiff="nvim -d"

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'
# Increase history size so searching backwards in command history works more frequently
HISTSIZE=200000
HISTFILESIZE=200000


# git aliases
alias gap="git add -up"
alias gs="git status"
alias gd="git difftool"
alias gf="git fetch"
alias gp="git push"
alias gpf="git push -f"

alias cls="clear"
alias l="ls -l"
alias la="ls -la"
#alias tmux="tmux -2"

if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias l='ls -l --color=auto'
    alias la='ls -la --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
    color_prompt=yes
else
    color_prompt=
fi

D=$'\e[37;40m' #WHITE
MAGENTA=$'\e[35;40m'
GREEN=$'\e[32;40m'
CYAN=$'\e[36;40m'
LIGHT_GREEN=$'\e[92;40m'

if [ "$color_prompt" = yes ];then
        PS1='${MAGENTA}\u${D}@${CYAN}\h${GREEN} \w/${D}\n$ '
else
        PS1='\u@\h \w\n$ '
fi

#disable ctrl-s pausing terminal
stty -ixon

set bell-style none

set -o ignoreeof

# import the completion scripts
source /etc/profile.d/bash_completion.sh
# make man pages tab completion work with cppman (man std::vector)
# had forward slash (/) in it but it breaks tab completion for folders
export COMP_WORDBREAKS=" \"\'><;|&("

#export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0

