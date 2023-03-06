#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found. Installing..."
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew found. Updating..."
    # Update Homebrew
    brew update
fi

echo

# Check if JDK 11 is installed
if javac -version | grep "11." &> /dev/null
then
    echo "JDK 11 already installed."
else
    # Install JDK 11
    echo "Installing JDK 11..."
    brew install --cask adoptopenjdk/openjdk/adoptopenjdk11

    # Verify JDK installation
    if javac -version | grep "11." &> /dev/null
    then
        echo "JDK 11 installation successful."
    else
        echo "JDK 11 installation failed."
    fi
fi

echo

# Install JDK 16
echo "Installing JDK 16..."
brew install --cask adoptopenjdk/openjdk/adoptopenjdk16

# Verify JDK installation
if javac -version | grep "16." &> /dev/null
then
    echo "JDK 16 installation successful."
else
    echo "JDK 16 installation failed."
fi

echo

# Check if Maven 3.9 is installed
if mvn -version | grep "Apache Maven 3.9." &> /dev/null
then
    echo "Maven 3.9 already installed."
else
    # Install Maven 3.9
    echo "Installing Maven 3.9..."
    brew install maven@3.9

    # Verify Maven installation
    if mvn -version | grep "Apache Maven 3.9." &> /dev/null
    then
        echo "Maven 3.9 installation successful."
    else
        echo "Maven 3.9 installation failed."
    fi
fi

echo

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    # Install Docker
    echo "Installing Docker..."
    brew install --cask docker

    # Start Docker
    echo "Starting Docker..."
    open /Applications/Docker.app

    # Verify Docker installation
    if docker -v &> /dev/null
    then
        echo "Docker installation successful."
    else
        echo "Docker installation failed."
    fi
else
    echo "Docker already installed."
fi

echo

# Check if Minikube is installed
if ! command -v minikube &> /dev/null
then
    # Install Minikube using Homebrew
    echo "Installing Minikube..."
    brew install minikube
else
    echo "Minikube is already installed on the system."
fi

echo

# Check if kubectl is installed
if ! command -v kubectl &> /dev/null
then
    # Install kubectl using Homebrew
    echo "Installing Kubectl..."
    brew install kubectl
else
    echo "kubectl is already installed on the system."
fi

echo

# DBeaver
if ! command -v dbeaver &> /dev/null
then
    echo "DBeaver not found. Installing..."
    brew install --cask dbeaver-community
else
    echo "DBeaver already installed."
fi

echo

# Postman
if ! command -v postman &> /dev/null
then
    echo "Postman not found. Installing..."
    brew install --cask postman
else
    echo "Postman already installed."
fi

echo

# VSCode
if ! command -v code &> /dev/null
then
    echo "Visual Studio Code not found. Installing..."
    brew install --cask visual-studio-code
else
    echo "Visual Studio Code already installed."
fi

# Node 16
if brew list -1 | grep -q "^node@16"
then
    echo "O Node.js 16.x já está instalado."
else
    echo "O Node.js 16.x não está instalado. Instalando o Node.js 16.x..."
    brew install node@16
fi

# Angular CLI
if ! command -v ng &> /dev/null
then
    echo "O Angular CLI não está instalado. Instalando o Angular CLI..."
    npm install -g @angular/cli

    # Verifica se a instalação foi bem-sucedida
    if ! command -v ng &> /dev/null
    then
        echo "Erro: Falha ao instalar o Angular CLI."
        exit
    fi

    echo "O Angular CLI foi instalado com sucesso."
else
    echo "O Angular CLI já está instalado."
fi

# Lighttpd
if command -v lighttpd &> /dev/null
then
    echo "Lighttpd is already installed"
else
    # Install Lighttpd using Homebrew
    echo "Installing Lighttpd using Homebrew"
    brew install lighttpd
fi

