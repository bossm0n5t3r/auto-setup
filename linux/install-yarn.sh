#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Installing Yarn
echo -e "${c}Installing Yarn"; $r
cd
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn
echo "" >> .zshrc
echo "# Set Yarn global path" >> .zshrc
echo -e "export PATH=\"\$(yarn global bin):\$PATH\"" >> .zshrc
( set -x; yarn -v )
echo -e "${c}Yarn Installed Successfully."; $r
