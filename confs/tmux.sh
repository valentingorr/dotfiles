#!/bin/bash

echo "Setting up tmux..."
rm -rf $HOME/.config/tmux/
rm -rf $HOME/.tmux/plugins/tpm
mkdir -p $HOME/.config/tmux/
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cp ./files/tmux.conf $HOME/.config/tmux/tmux.conf
