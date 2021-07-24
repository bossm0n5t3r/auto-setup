#!/usr/bin/env bash

##################################################################################################
# Author: bossm0n5t3r                                                                            #
# Description: Auto setup bash script to setup required programs after auto-setup.sh             #
# Tested against Debian based distributions like Ubuntu 20.04, 19.10.                            #
##################################################################################################

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Installing oh-my-zsh
echo -e "${c}Installing oh-my-zsh"; $r
cd
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo -e "${c}oh-my-zsh Installed Successfully."; $r
echo

# Installing vim-plug
echo -e "${c}Installing vim-plug"; $r
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo -e "${c}vim-plug Installed Successfully!"; $r
echo

# Setting up jEnv
echo -e "${c}Setting up jEnv"; $r
git clone https://github.com/jenv/jenv.git ~/.jenv
echo '' >> ~/.zshrc
echo '# jEnv' >> ~/.zshrc
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
echo -e "${c}jEnv Setup Successfully!"; $r
echo

# Setting up pyenv
echo -e "${c}Setting up pyenv"; $r
sudo apt update
sudo apt install -y \
make \
build-essential \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libreadline-dev \
libsqlite3-dev \
wget \
curl \
llvm \
libncursesw5-dev \
xz-utils \
tk-dev \
libxml2-dev \
libxmlsec1-dev \
libffi-dev \
liblzma-dev
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo '' >> ~/.zshrc
echo '# pyenv' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo -e "${c}If you want to show all the python versions that pyenv knows, run following commands"; $r
echo -e "${c}$ pyenv install --list | grep \" 3\.\""; $r
echo

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
read -p "Press ENTER to continue"
echo -e "${c}Visual Studio Code Setting Successfully."; $r
echo
