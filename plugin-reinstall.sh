#!/bin/bash

echo "Installing JSONLint"
npm install -g jsonlint

echo "Installing Tern..."
cd ~/.vim/plugged/tern_for_vim && npm install

echo "Installing YCM..."
cd ~/.vim/plugged/YouCompleteMe && ./install.py --clang-completer --tern-completer
