#!/bin/bash
#Tento skript automatizuje proces instalace potřebných balíčků, nastavení AUR helperu, přesunu konfiguračních souborů do příslušných adresářů a další potřebné kroky.
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	Archos
# Website 	: 	https://arch-linux.cz
##################################################################################################################
##################################################################################################################
#
# PEČLIVĚ SKRIPT ZKONTROLUJTE. SPUŠTĚNÍ JE NA VAŠE VLASTNÍ RIZIKO.
#
##################################################################################################################

echo "Zahajujeme automatickou instalaci i3 a konfigurace..."

# Definujeme cílový adresář pro klonování
TARGET_DIR="$HOME/Archlinux_I3"

# Klonování repozitáře
echo "Klonování repozitáře do $TARGET_DIR..."
git clone https://git.archoslinux.cz/archos/Archlinux_I3.git "$TARGET_DIR"

# Přechod do adresáře repozitáře
cd "$TARGET_DIR"

# Nastaví spustitelná oprávnění pro všechny skripty
echo "Nastavuji spustitelná oprávnění pro skripty..."
chmod +x *.sh

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

