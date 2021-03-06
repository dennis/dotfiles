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
cp -p .zshrc ~/
cp -p .gemrc ~/
[ -d ~/.i3 ] || mkdir ~/.i3
cp -p .i3/config ~/.i3/config
cp -pr .bin ~/
ln -fs ~/.vimrc ~/.config/nvim/init.vim
