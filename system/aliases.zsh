# A trailing space in VALUE causes the next word to be checked for alias substitution when the alias is expanded.
alias watch='watch '
alias yaml="bat -p --language='yaml'"
alias json="bat -p --language='json'"

alias "c=xclip"
alias "v=xclip -o"

# Safety net for rm
# I know I shouldn't but lets try it: 
# https://github.com/andreafrancia/trash-cli/tree/0.23.11.10#can-i-alias-rm-to-trash-put
# Although the interface of trash-put seems to be compatible with rm, it has different semantics which will cause you problems. For example, while rm requires -R for deleting directories trash-put does not.
command -v trash-put >/dev/null 2>&1 && alias rm=trash-put

# modern/faster/saner alternatives to common unix commands
command -v eza >/dev/null 2>&1 && alias ls=eza
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