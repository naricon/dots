#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -l -h -a -X --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='[\u@\h]\n\w > '
