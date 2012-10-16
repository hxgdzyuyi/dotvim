#!/bin/sh
path=${PWD}
mkdir -p ~/.backup
git submodule update --init
if test -f ~/.vimrc; then mv ~/.vimrc ~/.backup/; fi
if test -d ~/.vim; then mv ~/.vim ~/.backup/; fi
ln -s ${path}/vimrc ~/.vimrc
ln -s ${path}/vim ~/.vim
vim -c BundleInstall
