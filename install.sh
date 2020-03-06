#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

pushd $DIR

  VUNDLE_PATH=$DIR/vim/bundle/Vundle.vim

  if [ ! -d $VUNDLE_PATH ]; then
    mkdir -p $DIR/vim/bundle
    git clone https://github.com/gmarik/vundle.git $VUNDLE_PATH
  fi

popd

HIDDEN_FILES="ackrc boostnoterc gemrc gitconfig gitignore_global gvimrc irbrc tmux.conf vimrc vim zshrc"

for f in $HIDDEN_FILES; do
  echo "Linking $DIR/$f $HOME/.$f"
  ln -snf $DIR/$f $HOME/.$f
done

echo "Installed!"
