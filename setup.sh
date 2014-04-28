#! /bin/bash

if [ -e /usr/local/bin/brew ]
then
  echo "brew already installed, skipping..."
else
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew bundle

cd ~/

# Setup dotfiles
if [ -d ~/.emacs.d ]
then
  echo "Dotfiles already present, skipping..."
else
  git clone git@github.com:Jell/.dotfiles.git
  cd .dotfiles
  ./setup.sh
fi

# Setup emacs config
if [ -d ~/.emacs.d ]
then
  echo "emacs config already present, skipping..."
else
  git clone git@github.com:Jell/.emacs.d.git
fi

