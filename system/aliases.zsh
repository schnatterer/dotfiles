# A trailing space in VALUE causes the next word to be checked for alias substitution when the alias is expanded.
alias watch='watch '
alias bat='batcat'
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
  /snap/intellij-idea-ultimate/current/bin/idea.sh "$*"&!
}

explorer() {
    nautilus --browser "$*"
}