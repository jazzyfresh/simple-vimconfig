#!/bin/bash

cd

ln -s .vim/vimrc .vimrc

# install vim plugins with vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

