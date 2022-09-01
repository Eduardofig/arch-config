#!/bin/bash
echo "starting"
sudo apt install neovim kitty xcape x11-xserver-utils fish npm clangd ripgrep silversearcher-ag ranger -y
mv ~/.config ~/.config.old
mv ~/arch-config/.config ~/.config
xset s off
xset -dpms
xset r rate 210 40
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xset s off
xset -dpms
xset r rate 210 40

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git config --global user.email "duzinho039@gmail.com"
git config --global user.name "Eduardofig"
sudo npm i -g gitmoji-cli
vim +PlugInstall +qall
gsettings set org.gnome.desktop.background picture-uri file:///home/pop-os/arch-config/Walpapers/wallpaper\ 5.jpeg
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true
echo "done"
