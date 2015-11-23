#!/bin/bash

DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

pushd $DIR

  VUNDLE_PATH=$DIR/vim/bundle/Vundle.vim

  if [ ! -d $VUNDLE_PATH ]; then
    mkdir -p $DIR/vim/bundle
    git clone https://github.com/gmarik/vundle.git $VUNDLE_PATH
  fi

popd

HIDDEN_FILES="vimrc vim"

for f in $HIDDEN_FILES; do
  ln -snf $DIR/$f $HOME/.$f
done

#
#source $HOME/.bash_profile
#
#touch .installed
#
#echo "Installed!"
