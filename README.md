# auto-setup

This reposioty is based on [shubhampathak/autosetup](https://github.com/shubhampathak/autosetup).

auto-setup.sh is a simple bash script (compatible with Debian based distributions like Ubuntu) to install and setup necessary softwares/tools after doing Fresh Install.

> Script is completely based on programming tools as well as some apps I use regularly like Visual Studio Code, Chromium etc.
> You can Modify it according to your need.

## Usage

### Linux (Debian based distributions like Ubuntu)

```bash
wget https://bit.ly/auto-setup
chmod +x auto-setup
./auto-setup

# After reboot,
bash ~/gitFolders/ubuntu-auto-setup/after-auto-setup.sh
```

### Windows 10

> #### Prerequisite Tools
>
> - [Git](https://git-scm.com/)
> - [Visual Studio Code](https://code.visualstudio.com/)
> - This repository

```bash
# Configure basic git setup and install Visual Studio Code Extensions after it installed
# Open git bash in this repository folder
# Setup git status and Install vscode extensions

bash auto-setup.sh
```

## Structure

It'll perform the following operations:

1. Delete firefox and default vim.
2. Install vim and set vim as default editor.
3. Install all the packages I need.
4. Python 3.7 default Setup
5. Setup pip and update
6. Custom gsettings.
7. Setup Git Global Config. (It'll ask for your name and email)
8. Install VSCode, Java etc. (See below list)
9. Cloning my personal git repositories.

## List

- ~~Anaconda~~ (Leave as Comments)
- Bleachbit
- Google Chrome
- D2Coding font
- Java
- LibreOffice
- Telegram
- vim-plug
- Visual Studio Code
- zsh
- My personal git repositories

## Note

Tested on Ubuntu 19.10, but it should work with other Debian based distributions as well.
