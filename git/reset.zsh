# safety net for git reset --hard
function git() {
  # Path to the `git` binary
  GIT="/usr/bin/git"

  # Sanity check
  if [ ! -f ${GIT} ]; then
    echo "Error: git binary not found" >&2
    return 255
  fi

  # Command to be executed
  command=$1

  # Remove command from $@ array
  shift 1

  # Check command against list of supported commands
  case $command in
  "cd")
    cd $(git rev-parse --show-toplevel)/${1}
    ;;
  "reset")
    if [ "$1" = "--hard" ]; then
      $GIT add -u
      if $GIT commit -m "Saving state before hard reset"; then
        # only create a backup ref & perform a reset if
        # a commit was created (otherwise there's nothing
        # to reset!)
        backupRef="refs/reset-backups/$(date +%s)"
        $GIT update-ref $backupRef HEAD
        $GIT reset --hard HEAD~1
        echo "Created backup ref: $backupRef"
      fi
      if [ -n "$2" ]; then
        $GIT reset --hard $2
      fi
    else
      $GIT ${command} "$@"
    fi
    ;;
  *)
    # Execute the git binary
    $GIT ${command} "$@"
    ;;
  esac

  # Return something
  return $?
}
