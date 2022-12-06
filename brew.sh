#! /bin/bash
brew update

brew tap homebrew/services
brew tap homebrew/cask
brew tap homebrew/cask-fonts

brew install --cask iterm2 google-chrome 1password hey spotify obsidian tower linear-linear jetbrains-toolbox

# Basic tools
brew reinstall git
brew install wget
brew install tree
brew install fzf
brew install bat
brew install exa
brew install kubectl
brew install gh

# Languages
brew install go
brew install python
brew install nodejs
