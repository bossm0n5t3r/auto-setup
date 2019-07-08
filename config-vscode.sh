#!/usr/bin/env bash

c='\e[32m' # Coloured echo (Green)
r='tput sgr0' #Reset colour after echo

# Setting Visual Studio Code
echo -e "${c}Setting Visual Studio Code"; $r
code
cp -rp $HOME/gitFolders/dotfiles/.vscode/settings.json $HOME/.config/Code/User/
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension formulahendry.code-runner
code --install-extension ExodiusStudios.comment-anchors
code --install-extension eamodio.gitlens
code --install-extension spywhere.guides
code --install-extension Equinusocio.vsc-material-theme
code --install-extension hoovercj.vscode-power-mode
code --install-extension vscode-icons-team.vscode-icons
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ritwickdey.LiveServer
echo -e "${c}Visual Studio Code Setting Successfully."; $r
