#!/bin/sh

if ! [ -d "${HOME}/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh repo to $HOME/.oh-my-zsh"

  git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh > /dev/null 2>&1
  
  echo 'Successfully installed oh-my-zsh'
  
fi