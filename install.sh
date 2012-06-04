#!/bin/bash

set -x

for f in `ls | grep -v install.sh`;
do
    ln -snf $PWD/$f $HOME/.$f
done

#source $HOME/.bash_profile

echo "Installed!"
