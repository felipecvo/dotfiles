#!/bin/bash

OS=$(uname -s)

if [ "$OS" == "Darwin" ]; then
  sudo softwareupdate -ia
  
  xcode-select --install
  
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  export PATH=/usr/local/bin:$PATH
  
  git clone https://github.com/felipecvo/dotfiles.git ~/.dotfiles
  
  pushd ~/.dotfiles
    brew tap Homebrew/bundle
    brew install caskroom/cask/brew-cask
    brew bundle
  popd
fi
