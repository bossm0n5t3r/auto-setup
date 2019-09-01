#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
read -p "Press ENTER to continue"
cp -rp ~/Desktop/gitFolders/dotfiles/.vscode/settings.json ~/AppData/Roaming/Code/User/
# Basic
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension formulahendry.code-runner
code --install-extension ExodiusStudios.comment-anchors
code --install-extension eamodio.gitlens
code --install-extension Equinusocio.vsc-material-theme
code --install-extension hoovercj.vscode-power-mode
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscode-icons-team.vscode-icons
# Web
code --install-extension ritwickdey.LiveServer
# Node.js
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
echo -e "${c}Visual Studio Code Setting Successfully."; $r
