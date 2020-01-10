#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Setting up Git
echo -e "${c}Setting up Git"; $r
( set -x; git --version )
echo -e "${c}Setting up global git config"; $r
git config --global color.ui true
read -p "Enter Your Full Name: " name
read -p "Enter Your Email: " email
git config --global user.name "$name"
git config --global user.email "$email"
echo -e "${c}Git Setup Successfully!"; $r

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
read -p "Press ENTER to continue"
code --install-extension Shan.code-settings-sync
echo -e "${c}Move settings.json to ~/AppData/Roaming/Code/User/."; $r
echo -e "${c}Visual Studio Code Setting Successfully."; $r
