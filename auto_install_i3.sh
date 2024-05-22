#!/bin/bash

echo "Zahajujeme automatickou instalaci i3 a konfigurace..."

# Definujeme cílový adresář pro klonování
TARGET_DIR="$HOME/Archlinux_I3"

# Klonování repozitáře
echo "Klonování repozitáře do $TARGET_DIR..."
git clone https://git.arch-linux.cz/Archos/Archlinux_I3.git "$TARGET_DIR"

# Přechod do adresáře repozitáře
cd "$TARGET_DIR"

# Spuštění instalace základních balíčků
echo "Instalace základních balíčků..."
./install_packages.sh

# Spuštění instalace AUR balíčků
echo "Instalace AUR balíčků..."
./install_aur_package.sh

# Přesun konfiguračních souborů
echo "Přesouvám konfigurační soubory..."
./move_config_files.sh

# Dotaz na smazání složky s repozitářem
read -p "Chcete smazat složku s repozitářem? (y/n) " response
if [[ "$response" =~ ^[Yy]$ ]]
then
    echo "Mažu složku s repozitářem..."
    cd ..
    rm -rf "$TARGET_DIR"
    echo "Složka byla smazána."
else
    echo "Složka nebyla smazána."
fi

echo "Instalace dokončena! Doporučujeme restartovat systém pro aplikaci všech změn."

