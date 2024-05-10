#!/bin/bash
#Tento skript instaluje základní balíčky, které jsou potřebné pro systém a pro správné fungování správce oken i3
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
# Aktualizace systému
echo "Aktualizace systému..."
sudo pacman -Syu --noconfirm

# Kontrola, zda soubor packages-repository.txt existuje
if [ ! -f "packages-repository.txt" ]; then
    echo "Chyba: Soubor 'packages-repository.txt' nebyl nalezen!"
    exit 1
fi

# Čtení každého řádku ze souboru a instalace balíčků
echo "Zahajuji instalaci balíčků..."
while IFS= read -r package; do
    if sudo pacman -S "$package" --noconfirm; then
        echo "Balíček '$package' byl úspěšně nainstalován."
    else
        echo "Chyba při instalaci balíčku '$package'."
    fi
done < "packages-repository.txt"

echo "Instalace všech balíčků dokončena."
