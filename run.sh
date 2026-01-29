#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WALLPAPER_DIR="$SCRIPT_DIR/wallpapers"
LOCKPICKER="$WALLPAPER_DIR/lockPickerX"

# ----------------------------
# Dependency check & install
# ----------------------------
DEPS=(dialog feh xrandr convert systemctl)

missing=()

for cmd in "${DEPS[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        missing+=("$cmd")
    fi
done

if [ ${#missing[@]} -ne 0 ]; then
    echo "Missing dependencies: ${missing[*]}"
    echo "Installing missing packages..."

    sudo apt update
    sudo apt install -y "${missing[@]}"

    # Re-check after install
    for cmd in "${missing[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            echo "Failed to install: $cmd"
            exit 1
        fi
    done
fi

# ----------------------------
# Validate lockPicker binary
# ----------------------------
if [ ! -f "$LOCKPICKER" ]; then
    echo "Error: lockPicker not found in $WALLPAPER_DIR"
    exit 1
fi

chmod +x "$LOCKPICKER"

# ----------------------------
# Run application
# ----------------------------
cd "$WALLPAPER_DIR" || exit 1
sudo ./lockPickerX
