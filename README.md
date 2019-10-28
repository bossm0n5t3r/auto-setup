# auto-setup

This reposioty is based on [shubhampathak/autosetup](https://github.com/shubhampathak/autosetup).

auto-setup.sh is a simple bash script (compatible with Debian based distributions like Ubuntu) to install and setup necessary softwares/tools after doing Fresh Install.

> Script is completely based on programming tools as well as some apps I use regularly like Visual Studio Code, Chromium etc.
> You can Modify it according to your need.

## Usage

### Linux (Debian based distributions like Ubuntu)

```bash
wget https://raw.githubusercontent.com/bossm0n5t3r/ubuntu-auto-setup/master/auto-setup.sh
chmod +x auto-setup.sh
./auto-setup.sh

# After reboot,
bash ~/gitFolders/ubuntu-auto-setup/after-auto-setup.sh
```

### Windows 10

> #### Prerequisite Tools
>
> - [Git](https://git-scm.com/)
> - [Visual Studio Code](https://code.visualstudio.com/)
> - MySQL (If you use this)
> - This repository

```bash
# Only configure Visual Studio Code after it installed
# Open git bash in this repository folder

bash config-vscode.sh
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

- Anaconda
- Bleachbit
- Chromium
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
