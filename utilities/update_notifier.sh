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

# Logování data spuštění
echo "Skript spuštěn v: $(date)" >> /cesta/k/log.txt 

# Získání seznamu aktualizací z oficiálních repozitářů
official_updates=$(checkupdates)
official_count=$(echo "$official_updates" | wc -l)

# Získání seznamu aktualizací z AUR
aur_updates=$(yay -Qua)
aur_count=$(echo "$aur_updates" | wc -l)

# Kontrola a zobrazení notifikací, pokud jsou dostupné aktualizace
if [[ ! -z "$official_updates" ]] || [[ ! -z "$aur_updates" ]]; then
    notify-send "Dostupné aktualizace" "$official_count oficiálních a $aur_count AUR aktualizací je dostupných. Spusťte terminál a zadejte 'yay -Syu' pro instalaci."
else
    echo "Žádné aktualizace nejsou dostupné." >> /cesta/k/log.txt
fi

