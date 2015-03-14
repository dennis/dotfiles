#!/bin/bash

DOTFILES="$HOME/.dotfiles"

if [ ! -d $DOTFILES ]; then
	git clone https://github.com/dennis/dotfiles.git "$DOTFILES"
else
	cd $DOTFILES
	git pull origin master
fi

cd $DOTFILES
cp -p .vimrc ~/
cp -p .gvimrc ~/
cp -p .gitconfig ~/
[ -d ~/.zsh ] || mkdir ~/.zsh
cp -p .zsh/* ~/.zsh/
cp -p .zshrc ~/
[ -d ~/.i3 ] || mkdir ~/.i3
cp -p .i3/config ~/.i3/config

