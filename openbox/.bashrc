#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\e[01;37m\]\w \e[01;34m\]  \e[00;37m\] "


## Aliases

alias sv='sudo vim'
alias sp='sudo pacman -S'
alias n='nvim'

