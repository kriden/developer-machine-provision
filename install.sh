#!/bin/sh

# Installing brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap buo/cask-upgrade

# Brew maintenance
brew tap homebrew/cask-versions
brew update
brew tap homebrew/cask

# Mac Apple Store install
brew install mas

# Browsers
brew install --cask firefox
brew install --cask google-chrome

# Development tooling
brew install groovy
brew install java
brew install maven
brew install git
brew install jenv
brew install jq
brew install parallel
brew install --cask sourcetree
brew install --cask visual-studio-code

# Tools
brew install --cask todoist
brew install --cask bitwarden
brew install --cask drawio
brew install --cask franz
brew install --cask slack
brew install --cask termius
brew install --cask postman
brew install --cask iterm2
brew install --cask cloudmounter
brew install fig
brew install --cask xmind

# Communication stuff
brew install --cask bluejeans
brew install --cask zoomus
brew install --cask microsoft-office
brew install --cask microsoft-teams

# Tooling
mas install 441258766 #Magnet
brew install --cask alt-tab

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

# Install AIO
npm install -g @adobe/aio-cli
aio plugins:update
