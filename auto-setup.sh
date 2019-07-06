#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after doing fresh install.      #
# Tested against Debian based distributions like Ubuntu 18.04.                                   #
##################################################################################################

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Update and Upgrade Command
echo -e "${c}Updating and upgrading before performing further operations"; $r
sudo apt update && sudo apt upgrade -y
sudo apt --fix-broken install -y

# Delete firefox and default vim.
echo -e "${c}Deleting firefox and default vim"; $r
sudo apt purge --auto-remove -y firefox* vim-*
sudo apt autoremove
sudo apt autoclean

# Installing vim and setting vim as default editor
echo -e "${c}Installing vim and setting vim as default editor"; $r
sudo apt install -y vim
sudo update-alternatives --config editor

# Installing complete packages (important)
echo -e "${c}Installing complete packages"; $r
sudo apt install -y \
apt-transport-https \
bleachbit build-essential \
chromium-browser \
curl \
fonts-naver-d2coding \
git \
gnome-tweaks \
intel-microcode \
libreoffice \
net-tools \
ntp \
telegram-desktop \
tlp \
tlp-rdw \
tree \
zsh

# Starting tlp
echo -e "${c}Starting tlp"; $r
sudo tlp start

# Setting up Git
echo -e "${c}Setting up Git"; $r
( set -x; git --version )
echo -e "${c}Setting up global git config at ~/.gitconfig"; $r
git config --global color.ui true
read -p "Enter Your Full Name: " name
read -p "Enter Your Email: " email
git config --global user.name "$name"
git config --global user.email "$email"
echo -e "${c}Git Setup Successfully!"; $r

# Installing Visual Studio Code
echo -e "${c}Installing Visual Studio Code"; $r
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update -y
sudo apt install -y code
sudo rm -f microsoft.gpg
echo -e "${c}Visual Studio Code Installed Successfully."; $r

# Setting up Java
echo -e "${c}Setting up Java"; $r
sudo apt install -y openjdk-12-jdk
sudo apt install -y openjdk-12-doc
( set -x ; java -version )
echo "" >> /etc/profile
echo "# Set JAVA_HOME" >> /etc/profile
echo "export JAVA_HOME=/usr/lib/jvm/java-12-openjdk-amd64" >> /etc/profile
echo -e "${c}Java Installed Successfully!"; $r

# Installing vim-plug
echo -e "${c}Installing vim-plug"; $r
cd
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${c}vim-plug Installed Successfully!"; $r

# Creating Directory Inside $HOME
echo -e "${c}Creating Directory named 'gitFolders' inside $HOME directory."; $r
cd
mkdir gitFolders

# Installing my vim plugins
echo -e "${c}Installing my vim plugins"; $r
cd gitFolders
git clone https://github.com/bossm0n5t3r/dotfiles.git
cd
cp -rp gitFolders/dotfiles/.vim/vimrc .vim/
vim .vim/vimrc
echo -e "${c}My vim plugins Installed Successfully!"; $r

# Installing NodeJS
echo -e "${c}Installing NodeJS"; $r
cd
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs
( set -x; nodejs -v )
echo -e "${c}NodeJS Installed Successfully!"; $r

# Deleting auto-setup.sh
echo -e "${c}Deleting auto-setup.sh"; $r
cd
rm -rf auto-setup.sh
echo -e "${c}auto-setup.sh Deleted Successfully!"; $r

# Final Update and Upgrade Command
echo -e "${c}Updating and upgrading to finish auto-setup script"; $r
sudo apt update && sudo apt upgrade -y
sudo apt --fix-broken install -y

# Changing bash shell to zsh
echo -e "${c}Changing bash shell to zsh"; $r
chsh -s `which zsh`

# After reboot
echo -e "${c}Now, you should reboot or shutdown now!"; $r
echo -e "${c}After reboot, you should run install-oh-my-zsh.sh and install-yarn.sh!"; $r