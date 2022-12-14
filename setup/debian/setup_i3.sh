#!/bin/bash
# setting up i3 and associated configs

sudo apt install feh compton
pip install --user bumblebee-status
pip isntall --user pywal
mkdir -p ~/.config/i3
cp ../../debian-dotfiles/i3-config ~/.config/i3/config
cp ../../debian-dotfiles/compton.conf ~/.config/compton.conf
echo "wal -n -i \$(cat ~/.current_background) > /dev/null" >> ~/.bashrc
