#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Installing Anaconda

echo -e "${c}Installing Anaconda"; $r
cd
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh
bash Anaconda3-2019.07-Linux-x86_64.sh
echo -e "${c}Anaconda Installed Successfully."; $r

# Deleting Anaconda3-2019.07-Linux-x86_64.sh

echo -e "${c}Deleting Anaconda3-2019.07-Linux-x86_64.sh"; $r
cd
rm -rf Anaconda3-2019.07-Linux-x86_64.sh
echo -e "${c}Anaconda3-2019.07-Linux-x86_64.sh Deleted Successfully!"; $r

# Setting Anaconda
echo -e "${c}Setting Anaconda"; $r
$HOME/anaconda3/bin/conda init zsh
echo -e "${c}Anaconda Setting Successfully."; $r

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
code --install-extension Equinusocio.vsc-material-theme
code --install-extension hoovercj.vscode-power-mode
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension wakatime.vscode-wakatime
# Web
code --install-extension ritwickdey.LiveServer
# Prettier
code --install-extension esbenp.prettier-vscode
# Markdown
code --install-extension yzhang.markdown-all-in-one
# Python
code --install-extension ms-python.python
# Java
code --install-extension redhat.java
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-test
code --install-extension tushortz.java-snippets
code --install-extension tushortz.java-imports-snippets
# MySQL
code --install-extension formulahendry.vscode-mysql
echo -e "${c}Visual Studio Code Setting Successfully."; $r

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

# Setting up Python
echo -e "${c}Setting up Python"; $r
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2
sudo update-alternatives --config python
( set -x; python --version )
echo -e "${c}Python Setup Successfully!"; $r

# Update pip
echo -e "${c}Update pip"; $r
sudo pip3 install -U pip
( set -x; pip --version )

# Set samsung keyboard backlight as max
cat /sys/class/leds/samsung::kbd_backlight/max_brightness | sudo tee /sys/class/leds/samsung::kbd_backlight/brightness

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

# Setting up Java
echo -e "${c}Setting up Java"; $r
sudo apt install -y openjdk-13-jdk openjdk-13-doc
( set -x ; java -version )
echo "" >> ~/.profile
echo "# Set JAVA_HOME" >> ~/.profile
echo "export JAVA_HOME=/usr/lib/jvm/java-13-openjdk-amd64" >> ~/.profile
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
git clone https://github.com/bossm0n5t3r/auto-setup.git
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
