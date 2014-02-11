#!/bin/bash

if [ ! -d "$HOME/.dotfiles" ]; then
	git clone https://github.com/dennis/dotfiles.git "$HOME/.dotfiles"
else
	cd "$HOME/.dotfiles"
	git pull origin master
fi

cd "$HOME/.dotfiles"
mv -u .vimrc ~/
mv -u .gitconfig ~/

