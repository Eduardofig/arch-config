#!/bin/bash
echo "starting"
sudo apt install neovim kitty xcape x11-xserver-utils fish npm clangd rg -y
mv ~/.config ~/.config.old
mv .config ~/.config
xset s off
xset -dpms
xset r rate 210 40
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xset s off
xset -dpms
xset r rate 210 40
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git config --global user.email "duzinho039@gmail.com"
git config --global user.name "Eduardofig"
echo "done"
