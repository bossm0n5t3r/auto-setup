#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after auto-setup.sh             #
# Tested against Debian based distributions like Ubuntu 19.04.                                   #
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
cp -rp $HOME/gitFolders/dotfiles/.vscode/settings.json $HOME/.config/Code/User/
# Basic
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension formulahendry.code-runner
code --install-extension ExodiusStudios.comment-anchors
code --install-extension eamodio.gitlens
code --install-extension spywhere.guides
code --install-extension Equinusocio.vsc-material-theme
code --install-extension hoovercj.vscode-power-mode
code --install-extension vscode-icons-team.vscode-icons
# Web
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ritwickdey.LiveServer
# Markdown
code --install-extension yzhang.markdown-all-in-one
# Python
code --install-extension ms-python.python
echo -e "${c}Visual Studio Code Setting Successfully."; $r

# Setting Anaconda
echo -e "${c}Setting Anaconda"; $r
$HOME/anaconda3/bin/conda init zsh
echo -e "${c}Anaconda Setting Successfully."; $r
