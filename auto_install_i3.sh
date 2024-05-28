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
git clone https://git.arch-linux.cz/Archos/Archlinux_I3.git
REPO_PATH=$(pwd)/Archlinux_I3
echo "Repositář byl klonován do: $REPO_PATH"

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

# Po dokončení instalací a konfigurací
echo "Instalace a konfigurace byly dokončeny."

# Dotaz na odstranění klonovaného repozitáře
read -p "Chcete odstranit klonovaný repozitář a dočasné soubory pro uvolnění prostoru na disku? (y/n) " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    if [ -d "$REPO_PATH" ]; then
        echo "Odstraňuji dočasné soubory a repozitář v $REPO_PATH..."
        rm -rf "$REPO_PATH"
        echo "Klonovaný repozitář a dočasné soubory byly odstraněny."
    else
        echo "Nenalezen repozitář k odstranění v $REPO_PATH"
    fi
else
    echo "Klonovaný repozitář a dočasné soubory byly ponechány."
fi

echo "Restartujte prosím systém, aby byly změny aplikovány."



