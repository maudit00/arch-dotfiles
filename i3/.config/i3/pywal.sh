#!/bin/bash
find ~/gruvbox-wallpapers -type f -name '*.jpg' -o -name '*.png' -print0 | shuf -zn1 | xargs -0 wal -i  
# Generate new status.toml with last pywal color scheme
 /usr/bin/wal_i3rust -i ~/.cache/wal/colors.json -c ~/i3status-rust/config.toml
# Replace lockscreen with used wallpaper
lastPywal="$(ls -Art ~/.cache/wal/schemes| tail -n 1)"
wallpaper="$(jq -r '.wallpaper' ~/.cache/wal/schemes/$lastPywal)"
convert $wallpaper -resize 1920x1080  ~/wallpapers/lockscreen.png

# remove last pywal file
rm ~/.cache/wal/schemes/$lastPywal

# Symlink dunst config
sudo ln -sf ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
sudo ln -sf ~/.cache/wal/colors.Xresources ~/.Xresources

# Restart dunst with the new color scheme
pkill dunst
dunst &

# Reload i3
i3 reload
i3 restart
