#!/bin/bash

echo "Installing Tern..."
cd ~/.vim/bundle/tern_for_vim && npm install

echo "Installing YCM..."
cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --tern-completer
