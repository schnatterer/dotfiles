(
  p10kfolder="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  if ! [ -d "${p10kfolder}" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${p10kfolder}"
  fi
)
