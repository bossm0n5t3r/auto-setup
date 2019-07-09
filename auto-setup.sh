#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after doing fresh install.      #
# Tested against Debian based distributions like Ubuntu 19.04.                                   #
##################################################################################################

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

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
wget \
zsh

# Starting tlp
echo -e "${c}Starting tlp"; $r
sudo tlp start

# Show Battery Percentage on Top Bar [Debian (gnome)]
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Change button layout [Debian (gnome)]
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"

# Show clock seconds and weekday [Debian (gnome)]
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true

# Change default fonts to D2Coding [Debian (gnome)]
gsettings set org.gnome.desktop.interface font-name 'D2Coding 11'
gsettings set org.gnome.desktop.interface document-font-name 'D2Coding 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'D2Coding 13'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'D2Coding Bold 11'

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
sudo rm -rf microsoft.gpg
echo -e "${c}Visual Studio Code Installed Successfully."; $r

# Setting up Java
echo -e "${c}Setting up Java"; $r
sudo apt install -y openjdk-12-jdk
sudo apt install -y openjdk-12-doc
( set -x ; java -version )
echo "" >> ~/.profile
echo "# Set JAVA_HOME" >> ~/.profile
echo "export JAVA_HOME=/usr/lib/jvm/java-12-openjdk-amd64" >> ~/.profile
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

# Cloning my git repositories
echo -e "${c}Cloning my git repositories"; $r
cd gitFolders
git clone https://github.com/bossm0n5t3r/dotfiles.git
git clone https://github.com/bossm0n5t3r/ubuntu-auto-setup.git
git clone https://github.com/bossm0n5t3r/git-status-checker.git
cd
echo -e "${c}My git repositories Cloned Successfully!"; $r

# Installing my vim plugins
echo -e "${c}Installing my vim plugins"; $r
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

# Installing Yarn
echo -e "${c}Installing Yarn"; $r
cd
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn
echo "" >> ~/.profile
echo "# Set Yarn global path" >> ~/.profile
echo -e "export PATH=\"\$(yarn global bin):\$PATH\"" >> ~/.profile
( set -x; yarn -v )
echo -e "${c}Yarn Installed Successfully."; $r

# Installing Anaconda
echo -e "${c}Installing Anaconda"; $r
cd
wget https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
echo -e "${c}Anaconda Installed Successfully."; $r

# Deleting auto-setup.sh
echo -e "${c}Deleting auto-setup.sh"; $r
cd
rm -rf auto-setup.sh
echo -e "${c}auto-setup.sh Deleted Successfully!"; $r

# Deleting Anaconda3-2019.03-Linux-x86_64.sh
echo -e "${c}Deleting Anaconda3-2019.03-Linux-x86_64.sh"; $r
cd
rm -rf Anaconda3-2019.03-Linux-x86_64.sh
echo -e "${c}Anaconda3-2019.03-Linux-x86_64.sh Deleted Successfully!"; $r

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
