# Dotfiles

This repository contains configuration files and setup scripts for my development environment, including Zsh with custom aliases and functions, and Neovim with NVChad. It helps to quickly set up a new machine with my preferred settings.

## Setup Instructions

### Automated Setup

To automate the setup process, you can use the provided `setup.sh` script. This script detects your operating system (Ubuntu or macOS) and installs the necessary packages and configurations.

#### Running the Automated Setup

1. Clone the repository:

   ```sh
   git clone https://github.com/nachat-ayoub/dotfiles.git
   cd dotfiles
   ```

2. Make the setup script executable and run it:

   ```sh
   chmod +x setup.sh
   ./setup.sh
   ```

### Manual Setup

If you prefer to set up the environment manually, follow the instructions below for your operating system.

#### Manual Setup on Ubuntu

1. **Install Zsh, Neovim, Git, and Curl**:

   ```sh
   sudo apt update
   sudo apt install -y zsh neovim git curl
   ```

2. **Set Zsh as the default shell**:

   ```sh
   chsh -s $(which zsh)
   ```

3. **Copy the .zshrc file**:

   ```sh
   cp dotfiles/.zshrc ~/
   ```

4. **Clone NVChad and set up Neovim**:

   ```sh
   git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
   ```

5. **Copy the custom Neovim configuration**:

   ```sh
   cp -r dotfiles/nvim ~/.config/
   ```

6. **Source the .zshrc file**:

   ```sh
   source ~/.zshrc
   ```

#### Manual Setup on macOS

1. **Install Homebrew** (if not already installed):

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Zsh, Neovim, and Git**:

   ```sh
   brew install zsh neovim git
   ```

3. **Set Zsh as the default shell**:

   ```sh
   chsh -s $(which zsh)
   ```

4. **Copy the .zshrc file**:

   ```sh
   cp dotfiles/.zshrc ~/
   ```

5. **Clone NVChad and set up Neovim**:

   ```sh
   git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
   ```

6. **Copy the custom Neovim configuration**:

   ```sh
   cp -r dotfiles/nvim ~/.config/
   ```

7. **Source the .zshrc file**:

   ```sh
   source ~/.zshrc
   ```

## Contributing

Feel free to submit issues or pull requests if you have suggestions for improvements or encounter any problems.

## License

This project is licensed under the MIT License.
