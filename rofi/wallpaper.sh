#!/bin/bash

WALL_DIR="$HOME/Pictures/wallpapers"

# 1. Generate list and launch Rofi with "Only Images" UI
chosen=$(ls "$WALL_DIR" | while read -r img; do
  echo -ne "$img\0icon\x1f$WALL_DIR/$img\n"
done | rofi -dmenu -i -p "Select Wallpaper" \
  -show-icons \
  -theme-str '
        window { 
            width: 95%; 
            height: 40%; 
            background-color: transparent; 
            border: 0px;
        }
  mainbox { background-color: rgba(0, 0, 0, 0.70); children: [ listview ]; } /* Hides search bar if you want */
        listview { 
            columns: 4; 
            lines: 3; 
            spacing: 15px; 
            margin: 20px;
            background-color: #000000;
        }
        element { 
            orientation: vertical; 
            padding: 1px; 
            background-color: transparent;
        }
        element selected {
            background-color: #203F7F; /* Subtle highlight border/box */
            border: 2px;
            border-color: #273662;
            border-radius: 12px;
        }
        element-icon { 
            size: 330px; /* Bigger images */
            horizontal-align: 0.5; 
            background-color: transparent;
        }
        element-text { 
            enabled: false; /* REMOVES THE TEXT LABELS */
        }
    ')

[ -z "$chosen" ] && exit

wall="$WALL_DIR/$chosen"

# 2. Set wallpaper with awww
awww img "$wall" \
  --transition-type any \
  --transition-duration 1 \
  --transition-fps 45

sleep 0.2

# apply colors
wallust run "$wall"

# notify
notify-send -h string:x-canonical-private-synchronous:wallpaper \
  "Wallpaper" "$(basename "$wall")" -i "$wall"
