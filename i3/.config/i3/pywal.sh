#!/bin/bash
# =========================================
# Cambia wallpaper e aggiorna i colori wal
# =========================================

# Scegli un wallpaper casuale
wallpaper=$(find ~/demon-slayer-wallpapers/ \( -name '*.jpg' -o -name '*.png' -o -name '.jpeg' \) -type f | shuf -n1)
wal -i "$wallpaper"
walcord

# Aggiorna lockscreen ridimensionato
convert "$wallpaper" -resize 1920x1080 ~/wallpapers/lockscreen.png

# -----------------------
# Aggiorna Polybar
# -----------------------
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

# -----------------------
# Aggiorna i3 colors
# -----------------------
i3colors="$HOME/.config/i3/wal_colors.conf"
cat > $i3colors <<EOF
client.focused          $(jq -r .colors.color4 $wal_colors) $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color7 $wal_colors) $(jq -r .colors.color4 $wal_colors) $(jq -r .colors.color0 $wal_colors)
client.focused_inactive $(jq -r .colors.color8 $wal_colors) $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color7 $wal_colors) $(jq -r .colors.color8 $wal_colors) $(jq -r .colors.color0 $wal_colors)
client.unfocused        $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color7 $wal_colors) $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color0 $wal_colors)
client.urgent           $(jq -r .colors.color1 $wal_colors) $(jq -r .colors.color0 $wal_colors) $(jq -r .colors.color7 $wal_colors) $(jq -r .colors.color1 $wal_colors) $(jq -r .colors.color0 $wal_colors)
EOF

# -----------------------
# Aggiorna Xresources e dunst
# -----------------------
xrdb -merge ~/.cache/wal/colors.Xresources
ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
pkill dunst
dunst &

# -----------------------
# Rilancia Polybar
# -----------------------
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar dp4 &
polybar hdmi0 &

# -----------------------
# Ricarica i3
# -----------------------
i3-msg reload
