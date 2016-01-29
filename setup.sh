#!/bin/bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export PATH=/usr/local/bin:$PATH

git clone https://github.com/felipecvo/dotfiles.git ~/.dotfiles

PUSHD ~/.dotfiles
  brew tap Homebrew/bundle
  brew install caskroom/cask/brew-cask
  brew bundle
POPD
