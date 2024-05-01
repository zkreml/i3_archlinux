#!/bin/bash

##################################################################################################################
# Written to be used on 64 bits computers
# Author    :   Archos
# Website   :   https://arch-linux.cz
##################################################################################################################
##################################################################################################################
# Nastaví DISPLAY pro GUI aplikace spouštěné z cronu
# Nastaví proměnnou prostředí DBUS_SESSION_BUS_ADDRESS, aby bylo možné z cronu spouštět GUI aplikace.
# Toto je nutné, protože cron nezná kontext uživatelského desktopového prostředí a bez této proměnné,by aplikace typu notify-send nemohly zobrazovat notifikace na ploše.
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

echo "Skript spuštěn v: $(date)" >> #/cest/k/log.txt 

# Získání seznamu aktualizací
updates=$(checkupdates)

# Zkontroluj, jestli jsou dostupné nějaké aktualizace
if [[ ! -z "$updates" ]]; then
    # Počet dostupných aktualizací
    count=$(echo "$updates" | wc -l)

    # Zobrazení notifikace
    notify-send "Dostupné aktualizace" "$count aktualizací je dostupných. Spusťte terminál a zadejte 'sudo pacman -Syu' pro instalaci."
fi

