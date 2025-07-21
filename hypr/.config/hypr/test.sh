#!bin/bash/
swww img '/home/bruca/Pictures/bello.gif' --transition-duration 1.2 --transition-step 255 --transition-type outer --transition-pos 0,0 &&
  wal -i '/home/bruca/Pictures/bello.gif' --saturate 0.7 -n -b 010101 &&
  notify-send -i '/home/bruca/Pictures/bello.gif' "New Wallpaper" &&
  pywalfox update
