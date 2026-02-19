#!/bin/bash

# Installer for BasicRetroLinux
# Backs up old configs and symlinks new ones

echo "Installing BasicRetroLinux theme..."

# Backup old configs
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# List of folders in your repo to install
CONFIG_DIRS=("backgrounds" "cava" "fastfetch" "hypr" "kitty" "rofi" "waybar" "wlogout")

for dir in "${CONFIG_DIRS[@]}"; do
  if [ -d "$HOME/.config/$dir" ] || [ -L "$HOME/.config/$dir" ]; then
    echo "Backing up existing $dir to $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR/.config"
    mv "$HOME/.config/$dir" "$BACKUP_DIR/.config/"
  fi

  # Ensure parent dir exists
  mkdir -p "$HOME/.config"

  # Symlink the new config
  ln -sf "$(pwd)/$dir" "$HOME/.config/$dir"
done

echo "Installation complete!"
echo "Backups are stored in $BACKUP_DIR"
echo "You may need to restart your window manager or terminal."
