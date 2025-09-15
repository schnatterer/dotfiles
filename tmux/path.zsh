command -v tmux >/dev/null 2>&1 && if [[ "$TMUX" = "" ]] && [[ -z "$NO_TMUX" ]]; then
  # Start tmux in the same process, so ctrl + d closes the window right away instead of returning to a non-tmux shell
  # If you want a terminal without tmux start a new window with NO_TMUX=1 zsh or  zsh -c "NO_TMUX=1 zsh"
  exec tmux
fi

# we use xterm as default,
# but we use screen for tmux.
# This is required to support home+end keys
if [ -n "${TMUX}" ]; then
    export TERM="screen-256color"
else
    export TERM="xterm-256color"
fi
