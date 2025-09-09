# Core Linux system
core=(
 base
 base-devel
 linux
 linux-firmware
 linux-headers
 intel-ucode
 efibootmgr
 grub
 os-prober
 pacman-contrib
)

# Audio system
audio=(
 alsa-firmware
 alsa-utils
 pipewire
 pipewire-alsa
 pipewire-jack
 pipewire-pulse
 wireplumber
 pavucontrol
 sof-firmware
 cava
 mpd
 mpc
 rmpc
)

# Xorg display server
xorg=(
 xclip
 xdg-user-dirs
 xorg-bdftopcf
 xorg-font-util
 xorg-iceauth
 xorg-mkfontscale
 xorg-server
 xorg-setxkbmap
 xorg-xauth
 xorg-xcmsdb
 xorg-xcursorgen
 xorg-xdpyinfo
 xorg-xev
 xorg-xinit
 xorg-xinput
 xorg-xkbcomp
 xorg-xkbutils
 xorg-xkill
 xorg-xlsclients
 xorg-xmodmap
 xorg-xprop
 xorg-xrandr
 xorg-xrdb
 xorg-xset
 xorg-xsetroot
 xorg-xwininfo
)

# Window manager and desktop
window_manager=(
 awesome
 lain-git
 lightdm
 lightdm-gtk-greeter
 lightdm-slick-greeter
 rofi
 picom
 nitrogen
)

# Theming and appearance
theming=(
 lxappearance-gtk3
 orchis-theme
 papirus-icon-theme
 kvantum-qt5
 kvantum-theme-orchis-git
)

# Fonts
fonts=(
 noto-fonts-cjk
 noto-fonts-emoji
 ttf-jetbrains-mono-nerd
)

# Development tools
development=(
 gcc
 gdb
 git
 github-cli
 go
 rust
 npm
 python-pipx
 uv
 neovim
)

# System utilities
utils=(
 7zip
 bat
 betterlockscreen
 brightnessctl
 btop
 calc
 curl
 eza
 fzf
 man-db
 ncdu
 neofetch
 ripgrep
 starship
 stow
 tldr
 tmux
 tree
 udisks2
 unzip
 wget
 yay
 yazi
 zoxide
 zsh
)

# Network and security
network_security=(
 networkmanager
 openssh
 ufw
 gnu-netcat
 inetutils
 bitwarden
 pass
 seahorse
)

# Media and graphics
media=(
 flameshot
 mpv
 obs-studio
 sxiv
 redshift
)

# Applications
applications=(
 discord
 firefox
 ghostty
 obsidian
 qalculate-qt
 qutebrowser
 steam
 zathura
 zathura-pdf-mupdf
)

# System maintenance
maintenance=(
 timeshift
 gparted
 aria2
)

# Hardware support
hardware=(
 bluez
 bluez-utils
 evemu
 evtest
 nvidia
 nvidia-settings
)

# File systems and archives
filesystem=(
 exfatprogs
 cpio
)

# Compatibility libraries
compat_libs=(
 lib32-libpng12
 libpng12
 libxcrypt-compat
 ncurses5-compat-libs
)

# Miscellaneous
misc=(
 kindlegen
 python-adblock
 resvg
 tinyxxd
)
