#!/bin/bash
##################################################################################################################
# Written to be used on 64 bits computers
# Author    :   Archos
# Website   :   https://arch-linux.cz
##################################################################################################################

# Nastavení proměnných pro zobrazení notifikací
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Získání seznamu aktualizací z oficiálních repozitářů
official_updates=$(checkupdates)
official_count=$(echo "$official_updates" | grep -c "^\S")

# Získání seznamu aktualizací z AUR
aur_updates=$(yay -Qua)
aur_count=$(echo "$aur_updates" | grep -c "^\S")

# Kontrola a zobrazení notifikací, pokud jsou dostupné aktualizace
if [[ $official_count -gt 0 ]] || [[ $aur_count -gt 0 ]]; then
    notify-send "Dostupné aktualizace" "$official_count oficiálních a $aur_count AUR aktualizací je dostupných. Spusťte terminál a zadejte 'yay -Syu' pro instalaci."
else
    notify-send "Žádné aktualizace" "Žádné aktualizace nejsou dostupné."
fi

