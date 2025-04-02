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

package_name="autotiling picom imagewriter ttf-openlogos-archupdate nerd-fonts-complete"

# Kontrola, zda je git nainstalován
if ! command -v git &>/dev/null; then
  echo "Instaluji git..."
  sudo pacman -S git --needed --noconfirm
fi

# Kontrola, zda je nainstalován pomocník pro AUR (např. yay)
if ! command -v yay &>/dev/null; then
  echo "Instaluji Yay (AUR helper)..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Instalace balíčku z AUR pomocí Yay
echo "Instaluji $package_name z AUR..."
yay -S $package_name --noconfirm
