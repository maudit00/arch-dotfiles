#!/bin/bash

# Controlla se playerctl esiste
if ! command -v playerctl >/dev/null 2>&1; then
    echo "playerctl not installed"
    exit 0
fi

# Prendi info sul brano
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
status=$(playerctl status 2>/dev/null)

# Mostra output
if [ -z "$artist" ] || [ -z "$title" ]; then
    echo "No music"
else
    if [ "$status" = "Playing" ]; then
        icon="▶︎"
    elif [ "$status" = "Paused" ]; then
        icon=""
    else
        icon=""
    fi
    echo "$icon $artist - $title"
fi
