#!/bin/bash

# Wait for the desktop to load
sleep 10

# Get the width of the primary display
SCREEN_WIDTH=$(xrandr | grep '*' | head -n1 | awk '{print $1}' | cut -d'x' -f1)

# Update both conky config files to use the detected width
sed -i -E "s/(minimum_width\s*=\s*)([0-9]*|),/\1$SCREEN_WIDTH,/" ~/.conkyrc_banner
sed -i -E "s/(minimum_width\s*=\s*)([0-9]*|),/\1$SCREEN_WIDTH,/" ~/.conkyrc_transparent

# Start both conkys
conky -c ~/.conkyrc_banner &
sleep 1
conky -c ~/.conkyrc_transparent &
