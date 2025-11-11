#!/bin/bash

# Aggiorna i colori da wal
~/.config/polybar/wal_colors.sh

# Uccidi eventuali barre esistenti
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Lancia le barre
polybar dp4 &
polybar hdmi0 &
