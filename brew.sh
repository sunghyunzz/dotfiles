#! /bin/bash
brew update

brew tap homebrew/services
brew tap homebrew/cask
brew tap homebrew/cask-fonts

brew install --cask iterm2 google-chrome 1password hey spotify

# Basic tools
brew reinstall git
brew install wget
brew install tree
brew install asdf
brew install fzf
brew install bat
brew install exa
brew install kubectl
