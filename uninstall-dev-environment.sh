#!/bin/bash

# Uninstall JDK 11 and 16
echo "Uninstalling JDKs..."
brew uninstall --cask adoptopenjdk/openjdk/adoptopenjdk11
brew uninstall --cask adoptopenjdk/openjdk/adoptopenjdk16

# Uninstall Maven
echo "Uninstalling Maven..."
brew uninstall maven@3.9

# Uninstall Docker
echo "Uninstalling Docker..."
brew uninstall --cask docker

# Uninstall Minikube
echo "Uninstalling Minikube..."
brew uninstall minikube

# Uninstall kubectl
echo "Uninstalling kubectl..."
brew uninstall kubectl

# Uninstall DBeaver
echo "Uninstalling DBeaver..."
brew uninstall --cask dbeaver-community

# Uninstall Postman
echo "Uninstalling Postman..."
brew uninstall --cask postman

# Uninstall VSCode
echo "Uninstalling Visual Studio Code..."
brew uninstall --cask visual-studio-code

# Uninstall Node16
echo "O Node.js 16.x está instalado. Removendo o Node.js 16.x..."
brew uninstall node@16

# Uninstall Homebrew
echo "Uninstalling Homebrew..."
/bin/bash -c "$(curl -fsSL 
https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

echo "Uninstallation complete."

