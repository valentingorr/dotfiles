#!/bin/bash

cat requirements/ascii.txt | sed "s/\(.*\)/\x1b[35m\1\x1b[0m/"
echo "https://github.com/valentingorr/dotfiles" && echo ""

sudo pacman -Syyu

packages_list="./requirements/packages.txt"
sudo pacman -S --noconfirm - <$(paste -s -d ' ' "$packages_list")
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
