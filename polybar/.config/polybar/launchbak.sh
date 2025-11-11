#!/usr/bin/env bash

# Load wal colors
wal_colors="$HOME/.cache/wal/colors.json"

export BG=$(jq -r .special.background $wal_colors)
export FG=$(jq -r .special.foreground $wal_colors)
export YELLOW=$(jq -r .colors.color3 $wal_colors)
export BLUE=$(jq -r .colors.color4 $wal_colors)
export GREEN=$(jq -r .colors.color2 $wal_colors)
export RED=$(jq -r .colors.color1 $wal_colors)
export ORANGE=$(jq -r .colors.color5 $wal_colors)
export CYAN=$(jq -r .colors.color6 $wal_colors)

# Kill existing bars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar dp4 &
polybar hdmi0 &
