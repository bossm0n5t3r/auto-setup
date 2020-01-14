#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after auto-setup.sh             #
# Tested against Debian based distributions like Ubuntu 19.10.                                   #
##################################################################################################

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Installing oh-my-zsh
echo -e "${c}Installing oh-my-zsh"; $r
cd
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo -e "${c}oh-my-zsh Installed Successfully."; $r

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
read -p "Press ENTER to continue"
code --install-extension Shan.code-settings-sync
echo -e "${c}Visual Studio Code Setting Successfully."; $r
