# Default SAVEHIST seems to be 10,000 in Ubuntu
# Keep in mind that the whole thing is kept in memory!
export HISTSIZE=10000000
export SAVEHIST=${HISTSIZE}

# Ctrl+u behavior as in bash. Opposite of ctrl+k 🙂
bindkey \^U backward-kill-line