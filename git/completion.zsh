# Use completion so this file is loaded last
# This allows for altering the aliases provided by oh-my-zsh

unalias ga
function ga() { if [[ $# == 0 ]]; then git add .; else git add "$@"; fi }

unalias gcmsg
function gcmsg() { 
  git commit -m "$*" 
}

function gacp () {
  git add . && git commit -m "$*" && git pull --rebase && git push
}
