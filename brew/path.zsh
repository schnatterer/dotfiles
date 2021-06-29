[[ -s /home/linuxbrew/.linuxbrew/bin/brew ]] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Completion. Don't load in completion.zsh, because this needs to be added before compinit
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi