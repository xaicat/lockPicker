#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WALLPAPER_DIR="$SCRIPT_DIR/wallpapers"
LOCKPICKER="$WALLPAPER_DIR/lockPicker"
if [ ! -f "$LOCKPICKER" ]; then
    echo "Error: lockPicker not found in $WALLPAPER_DIR"
    exit 1
fi
chmod +x "$LOCKPICKER"
cd "$WALLPAPER_DIR" || exit
sudo ./lockPicker
