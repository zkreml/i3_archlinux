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

#!/bin/bash

# Příprava: Stáhne skript pomocí wget 
# chmod +x auto_install.sh
# ./auto_install.sh

echo "Zahajujeme automatickou instalaci..."
# Krok 3: Klonování repozitáře
git clone https://git.arch-linux.cz/Archos/Archlinux_I3.git ~/Archlinux_I3
cd ~/Archlinux_I3

# Nastavení skriptů jako spustitelných
chmod +x *.sh

# Krok 4: Instalace základních balíčků
./install_packages.sh

# Krok 5: Možnost úpravy seznamu balíčků
echo "Chcete upravit seznam balíčků? (ano/ne)"
read answer
if [[ "$answer" == "ano" ]]; then
    nano pacman_packages.sh
    ./pacman_packages.sh # znovu spustit v případě změn
fi

# Krok 6: Instalace balíčků z pacman
./pacman_packages.sh


# Krok 7: Instalace AUR balíčků
./install_aur_package.sh

# Krok 8: Výběr AUR helperu
echo "Preferujete YAY nebo PARU pro AUR? (yay/paru)"
read aur_helper
if [[ "$aur_helper" == "yay" ]]; then
    # případná instalace yay
    echo "Instalace yay..."
elif [[ "$aur_helper" == "paru" ]]; then
    # případná instalace paru
    echo "Instalace paru..."
fi

# Krok 9: Přesun konfiguračních souborů
./move_config_files.sh

echo "Instalace dokončena! Doporučujeme restartovat systém."

