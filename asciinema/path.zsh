# Use via " asciinema rec -c 'ASCIINEMA_REC=1 TITLE=schnatterer/moby-names-generator $SHELL'"
# For now, uncomment "exec tmux" to start recording without tmux
function setup_asciinema() {

  if [ "$ASCIINEMA_REC" = "1" ]; then
    # Set title if necessary
    if [ -n "$TITLE" ]; then
      DISABLE_AUTO_TITLE="true"
      echo -n -e "\033]0;$TITLE\007"
    fi

    # Disable plugin
    delete=you-should-use
    plugins=( "${plugins[@]/$delete}" )

    # Set simple prompt
    export PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
    export PS1=$PROMPT
    
    clear;
  fi
}