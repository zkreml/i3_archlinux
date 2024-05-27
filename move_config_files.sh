#!/bin/bash

##################################################################################################################
# Written to be used on 64 bits computers
# Author    :   Archos
# Website   :   https://arch-linux.cz
##################################################################################################################
# Definice cesty k repozitáři a domovského adresáře
# Získání cesty ke skriptu, předpokládáme, že je spuštěn z hlavního adresáře repozitáře
REPO_DIR="$HOME/Archlinux_I3"
HOME_DIR="$HOME"

# Funkce pro kopírování souborů
copy_files() {
    local src_dir=$1
    local dst_dir=$2
    echo "Kopírování souborů z $src_dir do $dst_dir"
    mkdir -p "$dst_dir"  # Vytvoří cílový adresář, pokud neexistuje
    cp -ar "$src_dir/"* "$dst_dir/"  # Kopíruje všechny soubory
    # Nastavení spustitelných práv pro skripty
    find "$dst_dir" -name "*.sh" -exec chmod +x {} +
}

# Příklad kopírování konfiguračních souborů
echo "Přesouvám konfigurační soubory..."
copy_files "$REPO_DIR/.config/dunst" "$HOME_DIR/.config/dunst"
copy_files "$REPO_DIR/.config/gtk-3.0" "$HOME_DIR/.config/gtk-3.0"
copy_files "$REPO_DIR/.config/i3" "$HOME_DIR/.config/i3"
copy_files "$REPO_DIR/.config/nano" "$HOME_DIR/.config/nano"
copy_files "$REPO_DIR/.config/rofi" "$HOME_DIR/.config/rofi"
copy_files "$REPO_DIR/.config/xfce4/terminal" "$HOME_DIR/.config/xfce4/terminal"

echo "Konfigurační soubory byly úspěšně přesunuty."

