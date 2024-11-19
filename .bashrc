#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias v='nvim'
alias ls='ls -h -a -X --color=auto'
alias grep='grep --color=auto'

#PS1='[\u@\h]\n\w > '
# git
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\u@\h] ${PS1_CMD1}\n\w > '
