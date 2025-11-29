#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "==> Creating required directories..."
mkdir -p ~/.config
mkdir -p ~/.config/{niri,waybar,fuzzel,mako,micro,swaylock,alacritty,fastfetch}
mkdir -p ~/scripts

echo "==> Creating symlinks..."

ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sfn "$DOTFILES/niri" ~/.config/niri
ln -sfn "$DOTFILES/waybar" ~/.config/waybar
ln -sfn "$DOTFILES/fuzzel" ~/.config/fuzzel
ln -sfn "$DOTFILES/mako" ~/.config/mako
ln -sfn "$DOTFILES/micro" ~/.config/micro
ln -sfn "$DOTFILES/swaylock" ~/.config/swaylock
ln -sfn "$DOTFILES/alacritty" ~/.config/alacritty
ln -sfn "$DOTFILES/fastfetch" ~/.config/fastfetch

ln -sf "$DOTFILES/scripts/"* ~/scripts/

echo "==> Done. Log out or reboot to apply."
