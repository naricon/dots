#!/usr/bin/env -S bash --noprofile --norc

# Andrea Alberti, 2024

# Resolve the directory containing this script
SCRIPT_DIR=${BASH_SOURCE[0]%/*}

# $1: option
# $2: default value
tmux_get() {
  local tmux_param_name=$1
  local default_param=$2
  local value
  
  value=$(tmux show -gqv "$tmux_param_name")
  if [[ -n "$value" ]]; then
      echo "$value"
  else
      echo "$default_param"
  fi
}

# Fetch Tmux options with defaults
key=$(tmux_get '@fzf-links-key' 'C-h')
history_lines=$(tmux_get '@fzf-links-history-lines' '0')
editor_open_cmd=$(tmux_get '@fzf-links-editor-open-cmd' "tmux new-window -n 'vim' vim +%line '%file'")
browser_open_cmd=$(tmux_get '@fzf-links-browser-open-cmd' "firefox '%url'")
fzf_path=$(tmux_get '@fzf-links-fzf-path' 'fzf')
fzf_display_options=$(tmux_get '@fzf-links-fzf-display-options' '-w 100% --maxnum-displayed 20 --multi --track --no-preview')
path_extension=$(tmux_get '@fzf-links-path-extension' '')
loglevel_tmux=$(tmux_get '@fzf-links-loglevel-tmux' 'WARNING')
loglevel_file=$(tmux_get '@fzf-links-loglevel-file' 'DEBUG')
log_filename=$(tmux_get '@fzf-links-log-filename' '')
python=$(tmux_get '@fzf-links-python' 'python3')
python_path=$(tmux_get '@fzf-links-python-path' '')
use_colors=$(tmux_get '@fzf-links-use-colors' 'on')
ls_colors_filename=$(tmux_get '@fzf-links-ls-colors-filename' '')
user_schemes_path=$(tmux_get '@fzf-links-user-schemes-path' '')
hide_fzf_header=$(tmux_get '@fzf-links-hide-fzf-header' 'off')

# Expand variables to resolve ~ and environment variables (e.g. $HOME)
path_extension=$(eval echo "$path_extension")
log_filename=$(eval echo "$log_filename")
python=$(eval which "$python")
python_path=$(eval echo "$python_path")
ls_colors_filename=$(eval echo "$ls_colors_filename")
user_schemes_path=$(eval echo "$user_schemes_path")

# Bind the key in Tmux to run the Python script
tmux bind-key -N "Open links with fuzzy finder (tmux-fzf-links plugin)" "$key" run-shell "if [[ ! -x \"$python\" ]]; then
  tmux display-message -d 0 \"fzf-links: no executable python found at the location: $python_path\"
  exit 0
fi
PYTHONPATH=\"$SCRIPT_DIR/tmux-fzf-links-python-pkg:$python_path\" \"$python\" -m tmux_fzf_links \"$history_lines\" \"$editor_open_cmd\" \"$browser_open_cmd\" \"$fzf_path\" \"$fzf_display_options\" \"$path_extension\" \"$loglevel_tmux\" \"$loglevel_file\" \"$log_filename\" \"$user_schemes_path\" \"$use_colors\" \"$ls_colors_filename\" \"$hide_fzf_header\"
"