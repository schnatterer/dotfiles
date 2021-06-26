# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#
## GPG
#

# ssh over gpg
# Launch gpg-agent
if [[ $(command -v gpg-connect-agent >/dev/null 2>&1) ]]; then
  gpg-connect-agent /bye
  # When using SSH support, use the current TTY for passphrase prompts
  gpg-connect-agent updatestartuptty /bye > /dev/null
  # Point the SSH_AUTH_SOCK to the one handled by gpg-agen
  
  AGENT_SOCK=$(gpgconf --list-dirs | grep agent-socket | sed 's/.*://')
  
  if [ -S $AGENT_SOCK ]; then export SSH_AUTH_SOCK=${AGENT_SOCK}.ssh
  else
    echo "$AGENT_SOCK doesn't exist. Is gpg-agent running ?"
  fi
fi 
