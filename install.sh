#!/bin/bash

#Create dotfiles if not exist
if [ ! -d ~/dotfiles ]; then
    mkdir ~/dotfiles
fi
# Dotfiles directory
dir=~/dotfiles

# List of files to symlink in homedir
files=".bashrc .vimrc .gitconfig .zshrc"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e ~/$file ]; then
        echo "Moving existing dotfile $file from ~ to $dir"
        mv ~/$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

#bash brew.sh