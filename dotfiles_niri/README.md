# 🔧 Dotfiles

## 📂 Directory Structure

```text
├── alacritty/       # Terminal configuration
├── bin/             # Custom scripts (installs to ~/.local/bin)
├── fastfetch/       # System fetch tool config
├── fuzzel/          # App launcher config
├── mako/            # Notification daemon config
├── mpd/             # Music Player Daemon config
├── niri/            # Window Manager (Niri) config
├── swaylock/        # Screen locker config
└── .zshrc           # Zsh shell configuration

🚀 Installation
1. Clone the Repository
Bash

git clone [https://github.com/VISHALKANNAN070/dotfiles.git](https://github.com/VISHALKANNAN070/dotfiles.git) ~/dotfiles
cd ~/dotfiles

2. Install Configurations

Window Manager & Terminal
Bash

# Niri
mkdir -p ~/.config/niri
cp niri/config.kdl ~/.config/niri/

# Alacritty
mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml ~/.config/alacritty/
cp alacritty/dank-theme.toml ~/.config/alacritty/

# Swaylock
mkdir -p ~/.config/swaylock
cp swaylock/config ~/.config/swaylock/

Utilities (Mako, Fastfetch, Scripts)
Bash

# Mako
mkdir -p ~/.config/mako
cp mako/mako.config ~/.config/mako/

# Fastfetch
mkdir -p ~/.config/fastfetch
cp fastfetch/config.jsonc ~/.config/fastfetch/

# Scripts
mkdir -p ~/.local/bin
cp bin/* ~/.local/bin/
chmod +x ~/.local/bin/*

Shell (Zsh)
Bash

cp .zshrc ~/
chsh -s /bin/zsh

🎵 Music Setup (MPD & MPC)

Setup
Bash

# Create directories
mkdir -p ~/.config/mpd
mkdir -p ~/.local/share/mpd/{playlists,db,log}

# Copy config
cp mpd/mpd.conf ~/.config/mpd/

# Start MPD
mpd ~/.config/mpd/mpd.conf

Usage
Bash

mpc update        # scan library
mpc add <path>    # add music
mpc play
mpc pause
mpc next

Note: Scripts for Fuzzel integration are included in the bin folder.
