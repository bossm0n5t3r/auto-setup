#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after doing fresh install.      #
# Tested against Debian based distributions like Ubuntu 19.10.                                   #
##################################################################################################

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' # Reset colour after echo

# Update and Upgrade Command
echo -e "${c}Updating and upgrading before performing further operations"; $r
sudo apt update && sudo apt upgrade -y
sudo apt --fix-broken install -y

# Delete firefox and default vim
echo -e "${c}Deleting firefox and default vim"; $r
sudo apt purge --auto-remove -y firefox* vim-*
sudo apt autoremove -y
sudo apt autoclean -y

# Installing vim and setting vim as default editor
echo -e "${c}Installing vim and setting vim as default editor"; $r
sudo apt install -y vim
sudo update-alternatives --config editor

# Installing all the packages I need
echo -e "${c}Installing complete packages"; $r
sudo apt install -y \
apt-transport-https \
bleachbit \
build-essential \
clang-format \
curl \
fonts-naver-d2coding \
git \
gnome-tweaks \
intel-microcode \
libreoffice \
net-tools \
ntp \
python3.7 \
python3-pip \
ruby-full \
telegram-desktop \
tlp \
tlp-rdw \
tree \
wget \
zsh

# Starting tlp
echo -e "${c}Starting tlp"; $r
sudo tlp start

# Installing Google Chrome
echo -e "${c}Installing Google Chrome"; $r
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt update
sudo apt install google-chrome-stable
sudo rm -rf /etc/apt/sources.list.d/google.list

# Installing Visual Studio Code
echo -e "${c}Installing Visual Studio Code"; $r
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt install -y code
sudo rm -rf microsoft.gpg
echo -e "${c}Visual Studio Code Installed Successfully."; $r

# Deleting auto-setup
echo -e "${c}Deleting auto-setup"; $r
cd
rm -rf auto-setup
echo -e "${c}auto-setup Deleted Successfully!"; $r

# Final Update and Upgrade Command
echo -e "${c}Updating and upgrading to finish auto-setup script"; $r
sudo apt update && sudo apt upgrade -y
sudo apt --fix-broken install -y

# Changing bash shell to zsh
echo -e "${c}Changing bash shell to zsh"; $r
chsh -s `which zsh`

# Finish
echo -e "${c}Now, you should reboot or shutdown now!"; $r
echo -e "${c}After reboot, you should run after-auto-setup!"; $r
echo -e "${c}WELCOME TO UBUNTU!"; $r

exit 0
