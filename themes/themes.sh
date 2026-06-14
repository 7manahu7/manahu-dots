#!/bin/bash

THEMES_DIR="$HOME/.config/themes"

choice=$(ls "$THEMES_DIR" | rofi -dmenu -p "Select Theme")

[ -z "$choice" ] && exit

# Apply configs
[ -f "$THEMES_DIR/$choice/current-theme.conf" ] && cp "$THEMES_DIR/$choice/current-theme.conf" ~/.config/kitty/current-theme.conf
[ -f "$THEMES_DIR/$choice/style.css" ] && cp "$THEMES_DIR/$choice/style.css" ~/.config/waybar/style.css
[ -f "$THEMES_DIR/$choice/config.jsonc" ] && cp "$THEMES_DIR/$choice/config.jsonc" ~/.config/waybar/config.jsonc

# Reload waybar
pkill waybar
waybar &

# Reload kitty (important 🔥)
killall -SIGUSR1 kitty 2>/dev/null

notify-send "Theme switched to $choice"
