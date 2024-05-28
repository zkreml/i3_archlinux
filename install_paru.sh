#!/bin/bash

# Název balíčku, který chcete nainstalovat pomocí AUR pomocníka
package_name="autotiling picom papirus-icon-theme-git"

# Kontrola, zda je git nainstalován
if ! command -v git &>/dev/null; then
    echo "Instaluji git..."
    sudo pacman -S git --needed --noconfirm
fi

# Kontrola, zda je nainstalován AUR helper (např. paru)
if ! command -v paru &>/dev/null; then
    echo "Instaluji Paru (AUR helper)..."
    # Klonování repozitáře paru z AUR
    git clone https://aur.archlinux.org/paru.git
    cd paru
    # Sestavení a instalace balíčku paru
    makepkg -si --noconfirm
    cd ..
    # Odstranění dočasného adresáře paru po instalaci
    rm -rf paru
fi

# Instalace požadovaných balíčků pomocí paru
paru -S $package_name --noconfirm
