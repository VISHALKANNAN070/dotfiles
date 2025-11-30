#!/bin/bash
echo "==> Checking for yay..."

if ! command -v yay &> /dev/null; then
    echo "==> yay not found. Installing..."

    sudo pacman -S --needed --noconfirm base-devel git

    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm

    echo "==> yay installed."
else
    echo "==> yay already installed."
fi

echo "==> Installing required packages..."

# Packages from official Arch repos
PACMAN_PACKAGES=(
    zsh
    waybar
    fuzzel
    mako
    swaylock
    alacritty
    micro
    fastfetch
    wl-clipboard
    pamixer
    playerctl
    jq
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    wireplumber
)

# Install PACMAN packages
sudo pacman -S --needed --noconfirm "${PACMAN_PACKAGES[@]}"

echo "==> Installing AUR packages (using yay)..."

AUR_PACKAGES=(
    niri
    cliphist
)

yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "==> Package installation complete."


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
