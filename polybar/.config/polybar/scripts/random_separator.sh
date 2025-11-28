#!/bin/bash

# --- LISTA SIMBOLI ESOTERICI, PLANETARI E MISTICI ---
SEPARATORS=(
"☉" "☾" "☿" "♀" "♁" "♂" "♃" "♄" "♅" "♆" "♇" "⛢"
"🌌" "🌠" "🌟" "🧿" "💫" "🪬" "⚛️" "⚜️" "☤"
"🕉️" "☯️" "✝️" "✡️" "☪️" "☸️" "🧘" "🕊️"
"△" "▽" "⚚" "⌬" "꩜"
)

NUM_SEPARATORS=${#SEPARATORS[@]}

# Genera un indice CASUALE.
RANDOM_INDEX=$(( RANDOM % NUM_SEPARATORS ))

# Stampa il simbolo selezionato.
echo "%{F#9932CC}${SEPARATORS[RANDOM_INDEX]}%{F-}"

# Esegui un'ultima pulizia nel caso il vecchio file di stato esista ancora:
rm -f /tmp/polybar_separator_index
