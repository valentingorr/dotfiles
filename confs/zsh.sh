#!/bin/bash

echo "Setting up ZSH :"
rm -rf $HOME/.oh-my-zsh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" > /dev/stderr
  exit 1
}
clear
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
clear
rm $HOME/.zshrc
rm $HOME/.zshrc.pre-oh-my-zsh
cp ./files/.p10k.zsh $HOME/.p10k.zsh
cp ./files/.zshrc $HOME/.zshrc
