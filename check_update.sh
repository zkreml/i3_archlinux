#!/bin/bash

#echo "Skript spuštěn v: $(date)" >> /home/archos/log.txt 

# Získání seznamu aktualizací
updates=$(checkupdates)

# Zkontroluj, jestli jsou dostupné nějaké aktualizace
if [[ ! -z "$updates" ]]; then
    # Počet dostupných aktualizací
    count=$(echo "$updates" | wc -l)

    # Zobrazení notifikace
    notify-send "Dostupné aktualizace" "$count aktualizací je dostupných. Spusťte terminál a zadejte 'sudo pacman -Syu' pro instalaci."
fi
