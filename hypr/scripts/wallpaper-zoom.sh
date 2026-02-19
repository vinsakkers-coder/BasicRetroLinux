#!/bin/bash

NEW_WALL="$1"

# Set new wallpaper in background
hyprctl hyprpaper preload "$NEW_WALL"
hyprctl hyprpaper wallpaper ",$NEW_WALL"

# Create a temporary fullscreen overlay using swayimg or mpv
mpv --no-audio --loop=1 --no-border --fullscreen \
    --geometry=100%x100% \
    --panscan=1.2 \
    --vf=scale=iw*1.1:ih*1.1 \
    "$NEW_WALL" &

PID=$!

# Smooth zoom timing (adjust if you want slower/faster)
sleep 0.35

kill $PID
