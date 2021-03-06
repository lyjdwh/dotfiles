#!/bin/bash
# marker
git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py

ln -s ~/dotfiles/.alacritty.yml          ~/.alacritty.yml
ln -s ~/dotfiles/.condarc                ~/.condarc
ln -s ~/dotfiles/.tmux.conf              ~/.tmux.conf
ln -s ~/dotfiles/.vimrc                  ~/.vimrc
ln -s ~/dotfiles/.zshrc                  ~/.zshrc
ln -s ~/dotfiles/.zsh_aliases            ~/.zsh_aliases
ln -s ~/dotfiles/robbyrussell-modified.zsh-theme     ~/.oh-my-zsh/themes/robbyrussell-modified.zsh-theme
ln -s ~/dotfiles/.gitconfig              ~/.gitconfig
ln -s ~/dotfiles/ranger/commands.py      ~/.config/ranger/commands.py
ln -s ~/dotfiles/ranger/rc.conf          ~/.config/ranger/rc.conf
ln -s ~/dotfiles/ranger/rifle.conf       ~/.config/ranger/rifle.conf
ln -s ~/dotfiles/ranger/scope.sh         ~/.config/ranger/scope.sh
ln -s ~/dotfiles/vscode/settings.json    ~/.config/Code/User/settings.json
ln -s ~/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
