#!/bin/bash

echo ""

figlet "Manahu Dots"

echo "-----------------------------------"
echo "Starting installation..."
echo ""

echo "Installing..."
sleep 1
echo "Configuring..."
sleep 1
echo "Finishing..."

DIR=$(pwd)

ln -sf $DIR/kitty ~/.config/kitty
ln -sf $DIR/rofi ~/.config/rofi
ln -sf $DIR/waybar ~/.config/waybar
ln -sf $DIR/nvim ~/.config/nvim

chmod +x $DIR/rofi/scripts/*.sh
chmod +x $DIR/themes2/*.sh

echo ""
figlet "Done!"
echo "Restart your session to apply changes."
