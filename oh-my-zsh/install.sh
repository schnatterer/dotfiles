#!/bin/sh

if ! [ -d "${HOME}/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh repo to $HOME/.oh-my-zsh"

  git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh > /dev/null 2>&1
  
  echo 'Successfully installed oh-my-zsh'
  
fi

  # This belongs to powerlevel10 folder but needs to be executed after cloning omz 
  # -> https://github.com/schnatterer/dotfiles-loader/issues/1
  (
    p10kfolder="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    if ! [ -d "${p10kfolder}" ]; then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${p10kfolder}"
    fi
  )