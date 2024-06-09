#!/bin/bash

# Function to detect the operating system
detect_os() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -f /etc/os-release ]]; then
      . /etc/os-release
      OS=$NAME
      if [[ "$OS" == "Ubuntu" ]]; then
        echo "Detected Ubuntu"
        install_ubuntu
      else
        echo "Unsupported Linux distribution: $OS"
        exit 1
      fi
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected macOS"
    install_macos
  else
    echo "Unsupported OS: $OSTYPE"
    exit 1
  fi
}

# Function to install packages on Ubuntu
install_ubuntu() {
  sudo apt update
  sudo apt install -y zsh neovim git curl
}

# Function to install packages on macOS
install_macos() {
  # Install Homebrew if not already installed
  if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  
  # Install packages using Homebrew
  brew install zsh neovim git
}

# Function to set up Zsh
setup_zsh() {
  # Check if zsh is installed
  if ! command -v zsh &> /dev/null; then
    echo "Zsh installation failed or Zsh is not installed. Exiting..."
    exit 1
  fi

  # Set Zsh as the default shell
  chsh -s $(which zsh)

  # Copy .zshrc
  cp .zshrc ~/
}

# Function to set up Neovim with NVChad
setup_neovim() {
  # Clone NVChad if not already installed
  if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  fi

  # Copy custom nvim configuration if exists
  cp -r nvim ~/.config/
}

# Function to source .zshrc
source_zshrc() {
  source ~/.zshrc
}

# Main function to execute setup
main() {
  detect_os
  setup_zsh
  setup_neovim
  source_zshrc
  echo "Setup complete!"
}

# Execute the main function
main

