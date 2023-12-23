#!/bin/bash

cat requirements/ascii.txt | sed "s/\(.*\)/\x1b[35m\1\x1b[0m/" && echo ""

sudo apt update && sudo apt upgrade -y

debs_list="./requirements/debs.txt"
sudo apt install -y $(paste -s -d ' ' "$debs_list")
clear

echo "Installing Neovim..."
echo
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
rm nvim.appimage
rm -rf squashfs-root
clear

echo "Installing NodeJS..."
echo
curl -LO https://nodejs.org/download/release/v21.2.0/node-v21.2.0-linux-x64.tar.gz
tar -xzf node-v21.2.0-linux-x64.tar.gz
sudo mv node-v21.2.0-linux-x64 /usr/local/node/
rm node-v21.2.0-linux-x64.tar.gz
rm -rf node-v21.2.0-linux-x64/
sudo ln -s /usr/local/node/bin/node /usr/local/bin/node
clear

echo "Installing Node Packages..."
np_list=$(paste -s -d ' ' "./requirements/node_packages.txt")
echo
echo "install $np_list"
echo
sudo npm install -g $np_list
clear

confs="./confs/*.sh"
for file in $confs; do
	chmod +x $file
	./$file
	clear
done

neofetch
echo

echo "~/.ssh/github.pub >> https://github.com/settings/ssh/new"
