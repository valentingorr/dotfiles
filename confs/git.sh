#!/bin/bash

echo "Setting up git..."
echo
read -p "Your Name (John Doe) : " name
read -p "Your Email : " email
read -p "Your Username : " username
read -p "SSH Passphrase : " passphrase
clear

git config --global init.defaultBranch main 
git config --global user.email "$email"
git config --global user.name "$name"

identityFile="$HOME/.ssh/github"

ssh-keygen -t rsa -b 4096 -C "$email" -N "$passphrase" -f $identityFile

configFile=$HOME/.ssh/config
if [ ! -e "$configFile" ]; then
	touch $configFile
fi

echo "Host github.com" >> $configFile
echo "	User $username" >> $configFile
echo "	IdentityFile $identityFile" >> $configFile
