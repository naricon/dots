#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias r="ranger"

alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='$(tput setaf 9)[$(tput setaf 10)\u$(tput setaf 11)@$(tput setaf 12)\h $(tput setaf 13)\W$(tput setaf 14)]$(tput setaf 15)\$ '
