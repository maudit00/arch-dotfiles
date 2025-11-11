#!/bin/bash

wal_colors="$HOME/.cache/wal/colors.json"
POLYBAR_COLORS="$HOME/.config/polybar/colors.ini"

cat > $POLYBAR_COLORS <<EOF
[colors]
bg = $(jq -r .special.background $wal_colors)
fg = $(jq -r .special.foreground $wal_colors)
yellow = $(jq -r .colors.color3 $wal_colors)
orange = $(jq -r .colors.color5 $wal_colors)
blue = $(jq -r .colors.color4 $wal_colors)
green = $(jq -r .colors.color2 $wal_colors)
red = $(jq -r .colors.color1 $wal_colors)
cyan = $(jq -r .colors.color6 $wal_colors)
EOF
