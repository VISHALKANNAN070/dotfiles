#📁 Directory Structure

alacritty/         # alacritty.toml + dank-theme.toml  
bin/               # custom scripts (should go into ~/.local/bin)
fastfetch/         # config.jsonc  
fuzzel/            # fuzzel.ini
mako/              # mako.config
mpd/               # MPD config notes
niri/              # config.kdl
swaylock/          # config
.zshrc             # Zsh configuration


##🚀 Installation
###1. Clone the repository
`git clone https://github.com/VISHALKANNAN070/dotfiles.git ~/dotfiles
cd ~/dotfiles`

###2. Install the configs
Alacritty

`mkdir -p ~/.config/alacritty
cp alacritty/alacritty.toml ~/.config/alacritty/
cp alacritty/dank-theme.toml ~/.config/alacritty/`

Scripts
`mkdir -p ~/.local/bin
cp bin/* ~/.local/bin/
chmod +x ~/.local/bin/*`

Fastfetch
`mkdir -p ~/.config/fastfetch
cp fastfetch/config.jsonc ~/.config/fastfetch/`

Mako
`mkdir -p ~/.config/mako
cp mako/mako.config ~/.config/mako/`


MPD & MPC
Create MPD directory:

`mkdir -p ~/.config/mpd
cp mpd/mpd.conf ~/.config/mpd/`

Create required dirs:

`mkdir -p ~/.local/share/mpd/{playlists,db,log}`

Start MPD:

`mpd ~/.config/mpd/mpd.conf`


Control music with MPC:

`mpc update        # scan library
mpc add <path>    # add music
mpc play
mpc pause
mpc next`

Included in scripts for fuzzel integration

Niri

`mkdir -p ~/.config/niri
cp niri/config.kdl ~/.config/niri/`

Swaylock

`mkdir -p ~/.config/swaylock
cp swaylock/config ~/.config/swaylock/`

Zsh

`cp .zshrc ~/`
`source ~/.zshrc`

Set Zsh as default shell:

`chsh -s /bin/zsh`

