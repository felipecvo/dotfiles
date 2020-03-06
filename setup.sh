#!/bin/bash

OS=$(uname -s)

DOTFILE_PATH="$HOME/.dotfiles"

if [ ! -d "$DOTFILE_PATH" ]; then
  git clone https://github.com/felipecvo/dotfiles.git ~/.dotfiles
else
  echo "You already have dotfiles cloned."
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "You already have Oh My Zsh installed."
fi

if [ "$OS" == "Darwin" ]; then
  sudo softwareupdate -ia

  xcode-select --install

  which -s brew
  if [[ $? != 0 ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    brew update
  fi

  export PATH=/usr/local/bin:$PATH

  pushd $DOTFILE_PATH
    brew tap Homebrew/bundle
    brew install caskroom/cask/brew-cask
    brew bundle
  popd
elif [ "$OS" == "Linux" ]; then
  sudo apt install -y ruby
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  cd ~/.rbenv && src/configure && make -C src
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

$DOTFILE_PATH/install.sh
