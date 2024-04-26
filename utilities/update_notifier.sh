#!/bin/bash
# Název: Update Notifier
# Popis: Skript pro kontrolu dostupnosti systémových aktualizací na Arch Linuxu a záznam do logu.

# Umístění log souboru
LOG_FILE="$HOME/update_notifier.log"

# Zaznamenání data a času spuštění skriptu
echo "Skript spuštěn v: $(date)" >> $LOG_FILE

# Získání seznamu dostupných aktualizací
updates=$(checkupdates)
update_count=$(echo "$updates" | wc -l)

# Zaznamenání výsledku kontroly
echo "Kontrola aktualizací provedena v: $(date)" >> $LOG_FILE

# Kontrola, zda jsou dostupné nějaké aktualizace
if [[ "$update_count" -gt 0 ]]; then
    echo "$update_count aktualizací je dostupných. Spusťte terminál a zadejte 'sudo pacman -Syu' pro instalaci." >> $LOG_FILE
    # Zobrazení notifikace, pokud jsou aktualizace dostupné
    notify-send "Dostupné aktualizace" "$update_count aktualizací je dostupných. Spusťte terminál a zadejte 'sudo pacman -Syu' pro instalaci."
else
    echo "Žádné aktualizace nejsou dostupné." >> $LOG_FILE
fi

# Výstup pro možné použití v terminálu nebo Conky
echo "$update_count updates available"

