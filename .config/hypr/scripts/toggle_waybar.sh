#!/usr/bin/zsh
if pgrep -x waybar; then
  pkill waybar
else
  waybar -c ~/.config/waybar/hyprland.jsonc
fi
