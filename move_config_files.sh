#!/bin/bash

##################################################################################################################
# Written to be used on 64 bits computers
# Author    :   Archos
# Website   :   https://arch-linux.cz
##################################################################################################################
# Získání cesty ke skriptu, předpokládáme, že je spuštěn z hlavního adresáře repozitáře
cd $HOME/Archlinux_I3  # Přesun do adresáře s repozitářem, kde předpokládáme umístění konfiguračních souborů

# Kopírování konfiguračních souborů do příslušných adresářů v domovském adresáři
echo "Přesouvám konfigurační soubory..."
cp -r .config/dunst $HOME/.config/
cp -r .config/gtk-3.0 $HOME/.config/
cp -r .config/i3 $HOME/.config/
cp -r .config/nano $HOME/.config/
cp -r .config/rofi $HOME/.config/
cp -r .config/xfce4/terminal $HOME/.config/

echo "Konfigurační soubory byly úspěšně přesunuty."

