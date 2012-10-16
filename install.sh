#!/bin/sh
mv ~/.vimrc ~/.backup/.vimrc_backup
mv ~/.vim ~/.vim_backup
ln -s ${PWD}/vimrc ~/.vimrc
ln -s ${PWD}/vim ~/.vim
