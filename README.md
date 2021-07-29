# auto-setup

[![CI](https://github.com/bossm0n5t3r/auto-setup/actions/workflows/main.yml/badge.svg?branch=master)](https://github.com/bossm0n5t3r/auto-setup/actions/workflows/main.yml) ![ubuntu](https://img.shields.io/badge/ubuntu-20.04-brightgreen) ![ubuntu](https://img.shields.io/badge/ubuntu-19.10-brightgreen)

This reposioty is based on [shubhampathak/autosetup](https://github.com/shubhampathak/autosetup).

`auto-setup.sh` is a simple bash script (compatible with Debian based distributions like Ubuntu) to install and setup necessary softwares/tools after doing Fresh Install.

> Script is completely based on programming tools as well as some apps I use regularly like Visual Studio Code, Chromium etc.
> You can Modify it according to your need.

## Usage

### Linux (Debian based distributions like Ubuntu)

```bash
wget https://bit.ly/auto-setup
chmod +x auto-setup
./auto-setup

# After reboot,
wget https://bit.ly/after-auto-setup
chmod +x after-auto-setup
./after-auto-setup
```

### Windows 10 (NO LONGER MAINTAINED)

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
4. Custom gsettings.
5. Setup Git Global Config. (It'll ask for your `name` and `email`)
6. Install some programming languages and tools etc. (See below list)
7. Cloning my personal git repositories.

## List

### auto-setup

- Bleachbit
- Google Chrome
- D2Coding font
- Discord
- LibreOffice
- Telegram
- zsh

## Programming languages and tools

### auto-setup

- AdoptOpenJDK 16 openj9
- Kotlin
- Visual Studio Code
- IntelliJ IDEA Community Edition

### after-auto-setup

- vim-plug
- jEnv
- pyenv

## Note

Tested on Ubuntu 20.04, 19.10, but it should work with other Debian based distributions as well.
