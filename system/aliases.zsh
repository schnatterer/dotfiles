# A trailing space in VALUE causes the next word to be checked for alias substitution when the alias is expanded.
alias watch='watch '
alias yaml="bat -p --language='yaml'"
alias json="bat -p --language='json'"

alias "c=xclip"
alias "v=xclip -o"

# modern/faster/saner alternatives to common unix commands
command -v exa >/dev/null 2>&1 && alias ls=exa
if [[ -f  ~/.config/broot/launcher/bash/br ]]; then
  source ~/.config/broot/launcher/bash/br
  command -v br >/dev/null 2>&1 && alias tree=br
fi
command -v duf >/dev/null 2>&1 && alias df=duf

idea() {
  if [[ -f "$HOME/.local/share/JetBrains/Toolbox/scripts/idea" ]]; then
    $HOME/.local/share/JetBrains/Toolbox/scripts/idea "$*"&!
  elif [[ -f "/snap/intellij-idea-ultimate/current/bin/idea.sh" ]]; then
    /snap/intellij-idea-ultimate/current/bin/idea.sh "$*"&!
  else 1
    echo "idea not installed"
    return 11
  fi
}

alias code=codium

explorer() {
    nautilus --browser "$*"
}

# Alternative to excluding single commands from history using leading spaces
freeze_history () {
  fc -A
  fc -p $HISTFILE
  unset HISTFILE
}
unfreeze_history () {
  fc -P
}