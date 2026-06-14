#!/bin/bash

player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
  echo "No media"
  exit
fi

status=$(playerctl status 2>/dev/null)

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)

if [ "$status" = "Playing" ]; then
  echo "󰎈 $title - $artist"
elif [ "$status" = "Paused" ]; then
  echo "󰏤 $title - $artist"
else
  echo "Stopped"
fi
