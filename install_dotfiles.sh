#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating new symbolic links..."
ln -sfv $DIR/.bashrc $HOME/.bashrc
ln -sfv $DIR/.i3 $HOME/.i3
ln -sfv $DIR/.bash_aliases $HOME/.bash_aliases
ln -sfv $DIR/.ssh $HOME/.ssh
ln -sfv $DIR/.vimrc $HOME/.vimrc
ln -sfv $DIR/.gitconfig $HOME/.gitconfig
ln -sfv $DIR/.gitignore_global $HOME/.gitignore_global
# Link all scripts in .local/bin
ln -sfv $DIR/scripts/* $HOME/.local/bin/.

mkdir -p $HOME/.config/terminator
ln -sfv $DIR/config $HOME/.config/terminator/config

echo "Done!"
