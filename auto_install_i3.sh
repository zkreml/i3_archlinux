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
echo "Zahajujeme instalaci a konfiguraci vašeho i3 desktopu."

# Kontrola oprávnění
if [ "$(id -u)" -ne 0 ]; then
  echo "Tento skript vyžaduje superuživatelská práva."
  exit 1
fi

# Nastavení skriptů jako spustitelných
echo "Nastavování skriptů jako spustitelných..."
chmod +x *.sh

# Instalace základních balíčků
echo "Instalace základních balíčků..."
./install_packages.sh

# Instalace AUR balíčků
echo "Instalace AUR balíčků..."
./install_aur_package.sh

# Přesun konfiguračních souborů
echo "Aplikace konfiguračních souborů..."
./move_config_files.sh

echo "Instalace dokončena! Restartujte svůj systém pro aplikaci všech změn."
