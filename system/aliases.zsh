# A trailing space in VALUE causes the next word to be checked for alias substitution when the alias is expanded.
alias watch='watch '
alias bat='batcat'
alias yaml="bat -p --language='yaml'"
alias json="bat -p --language='json'"

alias "c=xclip"
alias "v=xclip -o"

command -v exa >/dev/null 2>&1 && alias ls=exa

idea() {
  /snap/intellij-idea-ultimate/current/bin/idea.sh "$*"&!
}

explorer() {
    nautilus --browser "$*"
}