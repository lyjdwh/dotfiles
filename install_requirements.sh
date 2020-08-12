#!/usr/bin/env bash
# **********************************************************************
# Copyright © 2020 liuyan
# File Name: install_requirements.sh
# Author: liuyan
# Email: lyjdwh@gmail.com
# Created: 2020-08-12 16:57:30 (CST)
# Last Update: Wednesday 2020-08-12 18:14:09 (CST)
#          By: lyjdwh@gmail.com
# Description:
# **********************************************************************

# oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh already installed"
else
    echo "install oh-my-zsh ..."
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# antigen
if [ -a ~/.oh-my-zsh/plugins/antigen.zsh ]; then
    echo "antigen already installed"
else
    curl -L git.io/antigen > ~/.oh-my-zsh/plugins/antigen.zsh
fi

# install marker
if [ -d ~/.marker ]; then
    echo "marker already cloned"
else
    echo "clone marker ..."
    git clone https://github.com/pindexis/marker  ~/.marker
fi
