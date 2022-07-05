#!/bin/sh

# Installing brew
usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew maintenance - Install java, origin of everything :)
brew update
brew tap caskroom/cask
brew tap caskroom/versions
brew cask install groovy

# Regular brew installs
brew install maven
brew install git
brew install jenv
brew install jq
brew install parallel


# Casks
brew cask install firefox
brew cask install sourcetree
brew cask install todoist
brew cask install bitwarden
brew cask install visual-studio-code
brew cask install bluejeans
brew cask install drawio
brew cask install franz
brew cask install slack
brew cask install termius
brew cask install zoomus
brew cask install microsoft-office
brew cask install microsoft-teams
brew cask install postman
brew cask install iterm2
brew cask install todoist

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

# Install AIO
npm install -g @adobe/aio-cl
aio plugins:update
