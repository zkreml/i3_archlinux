#!/bin/bash
##################################################################################################################
# Written to be used on 64 bits computers
# Author    :    Archos
# Website    :    https://arch-linux.cz
##################################################################################################################
##################################################################################################################
#
# PEČLIVĚ SKRIPT ZKONTROLUJTE. SPUŠTĚNÍ JE NA VAŠE VLASTNÍ RIZIKO.
#
##################################################################################################################
# Dynamické určení cesty k repozitáři a domovského adresáře
REPO_PATH=$(dirname "$0")
HOME_PATH="$HOME"

# Funkce pro kopírování souborů
copy_files() {
    src_dir=$1
    dst_dir=$2
    # Vytvoří cílový adresář, pokud neexistuje
    mkdir -p "$dst_dir"
    # Kopíruje všechny soubory z source do destination
    cp -ar $src_dir/* $dst_dir/
}

# Příklad kopírování konfiguračních souborů
# Předpokládá se struktura složek podobná tomu, co je v repozitáři
copy_files "$REPO_PATH/.config/dunst" "$HOME_PATH/.config/dunst"
copy_files "$REPO_PATH/.config/gtk-3.0" "$HOME_PATH/.config/gtk-3.0"
copy_files "$REPO_PATH/.config/i3" "$HOME_PATH/.config/i3"
copy_files "$REPO_PATH/.config/nano" "$HOME_PATH/.config/nano"
copy_files "$REPO_PATH/.config/rofi" "$HOME_PATH/.config/rofi"
copy_files "$REPO_PATH/.config/xfce4/terminal" "$HOME_PATH/.config/xfce4/terminal"

echo "Konfigurační soubory byly úspěšně přesunuty."

