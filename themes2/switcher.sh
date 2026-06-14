#!/bin/bash

DIR="$HOME/.config/themes2"

choice=$(ls "$DIR" | grep '\.sh$' | sed 's/.sh//' | rofi -dmenu -p "Theme")

[ -z "$choice" ] && exit

bash "$DIR/$choice.sh"
