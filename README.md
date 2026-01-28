# lockPicker
Changes your Kali Screenlock Background
### lockPicker - v1.0.0
**Release Date:** 28 Jan 2026
A simple, interactive Bash script to change your Kali Linux GDM login background easily with a GUI and safe image conversion.

**Features**

1. **GUI-based Wallpaper Selection**

Select wallpapers from any directory using a user-friendly dialog menu.

2. **Live Preview**

Preview the selected wallpaper before applying using feh, scaled to a 640x360 window for convenience.

3. **Automatic Screen Resolution Detection**

Detects your current screen resolution via xrandr and resizes wallpapers automatically to fit perfectly.

4. **Safe Image Conversion**

Converts wallpapers to a safe JPEG format using ImageMagick with optimized settings:

    - resize to your screen resolution
    
    - gravity center and -extent for perfect cropping
    
    - strip, -interlace none, -sampling-factor 4:4:4, -quality 90 for safe GRUB/GDM use

5. **Backup Functionality**

Optionally backup the existing login-blurred background before applying changes.

6. **Automatic GDM Update**

Apply the new wallpaper and optionally restart GDM immediately to see changes.

7. **Dynamic Temporary File Handling**

Each conversion generates a unique temporary file to avoid overwriting previous runs.

### Installation & Usage

Make sure dependencies are installed:

```sh
sudo apt install dialog feh x11-xserver-utils imagemagick
```

Run the script as root:
```sh
sudo ./kali-gdm-wallpaper-changer.sh
```

Follow the on-screen prompts to select and apply your wallpaper.

### Notes
- Works on Kali Linux GNOME.
- Converted images are temporarily stored in /tmp with unique filenames to avoid conflicts.
- If ImageMagick fails to convert, ensure it is installed and functioning correctly.
