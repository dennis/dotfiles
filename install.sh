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
cp -p .gitconfig ~/
[ -d ~/.zsh ] || mkdir ~/.zsh
cp -p .zsh/* ~/.zsh/
cp -p .zshrc ~/
