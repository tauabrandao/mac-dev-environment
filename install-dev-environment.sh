#!/bin/bash

# Function to interrupt script execution if a key is pressed
function interrupt_countdown() {
    local counter=$1
    printf "Starting in %s seconds. Press any key to cancel..." "$counter"
    while [ $counter -gt 0 ]; do
        read -s -n 1 -t 1 key
        if [ $? -eq 0 ]; then
            printf "\nInstallation canceled by the user.\n"
            exit 1
        fi
        printf "\rStarting in %2d seconds. Press any key to cancel..." "$((--counter))"
    done
    printf "\nStarting installation...\n"
}

# List of software to be installed
softwares=("Homebrew" "JDK 11" "JDK 16" "Maven 3.9" "Docker" "Minikube" "kubectl" "DBeaver" "Postman" "Visual Studio Code" "Node.js 16.x" "Angular CLI" "Lighttpd")

# Informing the user about the installation
echo "The following software will be installed if not already present on the system:"
for software in "${softwares[@]}"; do
    echo "- $software"
done
echo

# Start the countdown
interrupt_countdown 15

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
if [ -d "/Applications/DBeaver.app" ];
then
    echo "DBeaver already installed."
else
    echo "DBeaver not found. Installing..."
    brew install --cask dbeaver-community
fi

echo

# Check if Postman is installed via Homebrew and if the application directory exists
if brew list --cask | grep -q 'postman' && [ -d "/Applications/Postman.app" ]; then
    echo "Postman already installed."
elif [ -d "/Applications/Postman.app" ]; then
    # The application directory exists, but Homebrew doesn't have a record of it
    echo "Postman is installed but not recognized by Homebrew. Relinking..."
    brew link --overwrite postman
else
    # Postman is neither installed nor recognized by Homebrew
    echo "Postman not found. Installing..."
    brew install --cask postman
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
    echo "Node.js 16.x is already installed."
else
    echo "Node.js 16.x is not installed. Installing Node.js 16.x..."
    brew install node@16
fi

# Angular CLI
if ! command -v ng &> /dev/null
then
    echo "Angular CLI is not installed. Installing Angular CLI..."
    npm install -g @angular/cli

    # Verify installation
    if ! command -v ng &> /dev/null
    then
        echo "Error: Failed to install Angular CLI."
        exit
    fi

    echo "Angular CLI installed successfully."
else
    echo "Angular CLI is already installed."
fi

# Lighttpd
if command -v lighttpd &> /dev/null
then
    echo "Lighttpd is already installed."
else
    # Install Lighttpd using Homebrew
    echo "Installing Lighttpd using Homebrew..."
    brew install lighttpd
fi
