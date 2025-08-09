#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=nvim
export VISUAL=nvim
export TERMINAL=st-256color

export PATH="$PATH:$(find ~/.local/bin -type d | paste -sd ':' -)"
