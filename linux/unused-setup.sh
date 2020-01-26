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
