#!/bin/bash

echo "Installing JSONLint..."
npm install -g jsonlint

echo "Installing OmniSharp..."
cd ~/.vim/plugged/omnisharp-vim
git submodule update --init --recursive
cd server
xbuild

echo "Installing Tern..."
cd ~/.vim/plugged/tern_for_vim && npm install

echo "Installing YCM..."
cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer --tern-completer --omnisharp-completer

