#!/bin/bash

THEME="nature"
WALL="$HOME/Pictures/wallpapers/wallhaven-xejdrv_1920x1080.png"
# Set wallpaper (smooth transition)
awww img "$WALL" \
  --transition-type any \
  --transition-fps 45

# Apply kitty theme
cp "$HOME/.config/themes/$THEME/current-theme.conf" ~/.config/kitty/current-theme.conf

# Apply waybar theme
cp "$HOME/.config/themes/$THEME/style.css" ~/.config/waybar/style.css

# Apply waybar theme
cp "$HOME/.config/themes/$THEME/config.rasi" ~/.config/rofi/config.rasi

# Reload waybar
killall waybar 2>/dev/null
waybar >/dev/null 2>&1 &

# Reload kitty
killall -SIGUSR1 kitty 2>/dev/null

# Save current theme
echo "$THEME" >~/.config/themes2/.current_theme

# Notification
notify-send "🎨 $THEME mode activated"
