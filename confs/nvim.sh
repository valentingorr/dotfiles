#!/bin/bash

echo "Setting up neovim..."
rm -rf ~/.config/nvim/
mkdir -p ~/.config/nvim/
packerDir="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
rm -rf $packerDir
git clone --depth 1 https://github.com/wbthomason/packer.nvim $packerDir 
clear
git clone https://github.com/valentingorr/nvim-config.git -b wsl $HOME/.config/nvim/
