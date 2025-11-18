#!/bin/bash

ICONE_NAME="oomox-xresources-reverse" 
TARGET_ICONS_PATH="${HOME}/.icons/${ICONE_NAME}"

echo "▶️ Aggiornamento Definitivo Tema Icone: ${ICONE_NAME}"

# 1. Pulizia Totale delle Cache Icone UTENTE (Molto Aggressivo)
echo "    🧹 Pulizia cache utente..."
rm -rf "${HOME}/.cache/icon-cache.bin"
rm -rf "${HOME}/.cache/gtk-icon-theme.cache"
# Rimuovere tutte le icone temporanee cache
find "${HOME}/.cache/" -type f -name 'icon-theme.cache' -delete

# 2. Aggiorna i File di Configurazione GTK
# ... (lasciare la modifica di settings.ini e gtkrc-2.0 come prima) ...
sed -i '/gtk-icon-theme-name=/d' "${HOME}/.config/gtk-3.0/settings.ini"
echo "gtk-icon-theme-name=${ICONE_NAME}" >> "${HOME}/.config/gtk-3.0/settings.ini"

# 3. Aggiorna l'Ereditarietà (Fallback)
# Questo assicura che se un'icona manca, il sistema cerchi in Adwaita (base)
echo "    🧬 Verifica ereditarietà nel file index.theme..."
sed -i '/Inherits=/d' "${TARGET_ICONS_PATH}/index.theme"
echo "Inherits=Adwaita,hicolor" >> "${TARGET_ICONS_PATH}/index.theme"

# 4. Aggiorna la Cache delle Icone (Ricrea la cache pulita)
echo "    🔄 Ricreazione cache per il nuovo set..."
if [ -d "${TARGET_ICONS_PATH}" ]; then
    /usr/bin/gtk-update-icon-cache -f -t "${TARGET_ICONS_PATH}"
    echo "    ✅ Cache ricreata."
else
    echo "    ❌ ERRORE: Cartella icone non trovata."
    exit 1
fi

# 5. Riavvio di xsettingsd (Cruciale)
echo "    🔁 Riavvio xsettingsd..."
pkill xsettingsd
xsettingsd &

echo "✨ Esecuzione completata."

# NOTA IMPORTANTE: Dobbiamo ricaricare l'ambiente i3 e riavviare le applicazioni
i3-msg reload
echo "🚀 i3 ricaricato. Riavvia le singole applicazioni GTK ora."
