#!/bin/bash

if [ ! -d "$HOME/.dotfiles" ]; then
	git clone https://github.com/dennis/dotfiles.git "$HOME/.dotfiles"
	cd "$HOME/.dotfiles"
	mv -u .vimrc ~/
else
	echo "dotfiles is already installed"
fi

