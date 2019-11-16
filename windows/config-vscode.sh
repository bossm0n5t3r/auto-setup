#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
read -p "Press ENTER to continue"
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
# code --install-extension formulahendry.vscode-mysql
echo -e "${c}Move settings.json to ~/AppData/Roaming/Code/User/."; $r
echo -e "${c}Visual Studio Code Setting Successfully."; $r
