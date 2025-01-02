#!/bin/bash

DOTFILES_DIR=~/dotfiles

ln -sf $DOTFILES_DIR/.zshrc ~/.zshrc
ln -sf $DOTFILES_DIR/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.p10k.zsh ~/.p10k.zsh

echo "Dotfiles symlinked!"