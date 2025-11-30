#!/bin/bash

echo "======================================"
echo "        Arch Linux Bootstrap"
echo "======================================"

echo "==> Updating system..."
sudo pacman -Syu --noconfirm

echo "==> Installing essentials (git + base-devel)..."
sudo pacman -S --needed --noconfirm git base-devel

echo "==> Checking if dotfiles folder exists..."
if [ ! -d "$HOME/dotfiles" ]; then
    echo "==> Cloning your dotfiles..."
    git clone git@github.com:VISHALKANNAN070/dotfiles.git ~/dotfiles
fi

echo "==> Running install.sh..."
cd ~/dotfiles
chmod +x install.sh
./install.sh

echo "======================================"
echo "Bootstrap complete! Reboot recommended."
echo "======================================"
