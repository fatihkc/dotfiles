#!/bin/bash

#Create dotfiles_old if not exist
if [ ! -d ~/dotfiles_old ]; then
    echo "Creating ~/dotfiles_old for backup of any existing dotfiles in ~"
    mkdir -p ~/dotfiles_old
fi

# Dotfiles directory
dir=~/dotfiles

# List of files to symlink in homedir
files=".gitconfig .zshrc"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    if [ -e ~/$file ]; then
        echo "Moving existing dotfile $file from ~ to $dir"
        mv ~/$file ~/dotfiles_old/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || { echo "Oh My Zsh installation failed"; exit 1; }
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

bash brew.sh