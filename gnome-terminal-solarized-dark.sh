#!/bin/bash

# Solarized Dark theme for GNOME Terminal
# This script sets up the Solarized Dark color scheme

# Get the default profile UUID
PROFILE_UUID=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
PROFILE_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE_UUID/"

echo "Applying Solarized Dark theme to GNOME Terminal..."

# Set the color palette (Solarized Dark)
gsettings set $PROFILE_PATH palette "['#073642', '#dc322f', '#859900', '#b58900', '#268bd2', '#d33682', '#2aa198', '#eee8d5', '#002b36', '#cb4b16', '#586e75', '#657b83', '#839496', '#6c71c4', '#93a1a1', '#fdf6e3']"

# Set background color (dark blue-gray)
gsettings set $PROFILE_PATH background-color "'#002b36'"

# Set foreground color (light gray)
gsettings set $PROFILE_PATH foreground-color "'#839496'"

# Set bold color to bright base1
gsettings set $PROFILE_PATH bold-color "'#93a1a1'"

# Use colors from system theme
gsettings set $PROFILE_PATH use-theme-colors false

# Use colors for bold text
gsettings set $PROFILE_PATH bold-color-same-as-fg false

echo "Solarized Dark theme applied successfully!"
echo "You may need to restart your terminal or open a new tab to see the changes."
