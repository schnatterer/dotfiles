# we use xterm as default,
# but we use screen for tmux.
# This is required to support home+end keys
if [ -n "${TMUX}" ]; then
    export TERM="screen-256color"
else
    export TERM="xterm-256color"
fi
