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
brew install --cask slack
brew install --cask postman
brew install --cask iterm2
brew install fig
brew install --cask xmind
brew install --cask home-assistant

# MacOS tooling
mas install 441258766
brew install --cask alt-tab
brew install --cask fluor

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node --lts

# Install AIO
npm install -g @adobe/aio-cli
aio plugins:update
