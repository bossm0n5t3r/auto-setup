#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after doing fresh install.      #
# Tested against Debian based distributions like Ubuntu 20.04, 19.10.                            #
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
gdebi-core \
git \
gnome-tweaks \
intel-microcode \
libreoffice \
net-tools \
ntp \
ruby-full \
telegram-desktop \
tlp \
tlp-rdw \
tree \
wget \
zsh

# Show Battery Percentage on Top Bar [Debian (gnome)]
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Change button layout (close,minimize,maximize:) [Debian (gnome)]
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
echo

# Setting up AdoptOpenJDK 16 openj9
echo -e "${c}Setting up AdoptOpenJDK 16 openj9"; $r
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install -y adoptopenjdk-16-openj9
echo -e "${c}AdoptOpenJDK 16 openj9 Setup Successfully!"; $r
echo

# Setting up Kotlin
echo -e "${c}Setting up Kotlin"; $r
sudo snap install --classic kotlin
( set -x; kotlinc -version )
echo -e "${c}Kotlin Setup Successfully!"; $r
echo

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
echo

# Installing IntelliJ IDEA Community Edition
echo -e "${c}Installing IntelliJ IDEA Community Edition"; $r
sudo snap install intellij-idea-community --classic --edge
echo -e "${c}IntelliJ IDEA Community Edition Installed Successfully."; $r
echo

# Installing Discord
echo -e "${c}Installing Discord"; $r
sudo snap install discord
echo -e "${c}Discord Installed Successfully."; $r
echo

# Deleting auto-setup
echo -e "${c}Deleting auto-setup"; $r
cd
rm -rf auto-setup
echo -e "${c}auto-setup Deleted Successfully!"; $r
echo

# Final Update and Upgrade Command
echo -e "${c}Updating and upgrading to finish auto-setup script"; $r
sudo apt update && sudo apt upgrade -y
sudo apt --fix-broken install -y

# Changing bash shell to zsh
echo -e "${c}Changing bash shell to zsh"; $r
chsh -s `which zsh`

# Finish
echo -e "${c}Now, you should reboot or shutdown now!"; $r
echo -e "${c}After reboot, run following commands"; $r
echo -e "${c}$ wget https://bit.ly/after-auto-setup"; $r
echo -e "${c}$ chmod +x after-auto-setup"; $r
echo -e "${c}$ ./after-auto-setup"; $r
echo -e "${c}WELCOME TO UBUNTU!"; $r

exit 0
