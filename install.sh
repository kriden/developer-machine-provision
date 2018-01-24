#!/bin/sh

# Installing brew
usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew maintenance - Install java, origin of everything :)
brew update
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install java8
brew cask install groovy

# Regular brew installs
brew install maven
brew install git

# Casks
brew cask install firefox
brew cask install sourcetree
brew cask install evernote
brew cask install todoist
brew cask install 1password
brew cask install intellij-idea
brew cask install dropbox
brew cask install vagrantbox
brew cask install vagrant
brew cask install vagrant-manager

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install node
