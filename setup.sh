#!/bin/bash

OS=$(uname -s)

git clone https://github.com/felipecvo/dotfiles.git ~/.dotfiles

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  
if [ "$OS" == "Darwin" ]; then
  sudo softwareupdate -ia
  
  xcode-select --install
  
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  export PATH=/usr/local/bin:$PATH
  
  pushd ~/.dotfiles
    brew tap Homebrew/bundle
    brew install caskroom/cask/brew-cask
    brew bundle
  popd
fi

~/.dotfiles/install.sh
