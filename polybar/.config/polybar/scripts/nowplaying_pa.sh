#!/bin/bash

NODE=$(pw-dump | jq '.[] | select(.info.props."media.class"=="Stream/Output/Audio") | select(.info.props."media.name"=="Playback Stream" or .info.props."node.description"=="Telegram")')

if [ -z "$NODE" ]; then
    echo ""
    exit 0
fi

APP=$(echo "$NODE" | jq -r '.info.props."node.description"')
VOL=$(pw-cli info "${APP}" 2>/dev/null | grep -oP 'volume = \K.*' | head -n1)

# Se volume vuoto fallback
[ -z "$VOL" ] && VOL="--"

ICON="🎧"

echo "$ICON $APP  [$VOL]"
