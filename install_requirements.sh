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
# if [ -d ~/.oh-my-zsh ]; then
#     echo "oh-my-zsh already installed"
# else
#     echo "install oh-my-zsh ..."
#     sh -c "$(wget https://git.sjtu.edu.cn/sjtug/ohmyzsh/-/raw/master/tools/install.sh -O -)"
# fi

# zinit
if [ -d ~/.zinit ]; then
    echo "zinit already installed"
else
    echo "install zinit  ..."
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
fi
