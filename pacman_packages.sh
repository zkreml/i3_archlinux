#!/bin/bash
#Tento skript je určen pro instalaci širokého spektra aplikací, které osobně preferuji pro každodenní použití v Arch Linuxu.
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

# Seznam balíčků k instalaci pomocí pacman
pacman_packages="firefox hplip gutenprint foomatic-db vim git htop darktable geeqie smplayer fzf zsh-syntax-highlighting zsh-autosuggestions vlc thunar pcmanfm thunar-archive-plugin xclip transmission-gtk libreoffice-fresh libreoffice-fresh-cs gnome-calculator pluma p7zip unrar tar rsync cryfs rapid-photo-downloader gthumb gimp wireguard-tools  nextcloud-client  flatpak catfish totem borg borgmatic gnome-disk-utility gparted python-llfuse sshfs simple-scan evince neofetch geany gnome-screenshot filezilla networkmanager-openvpn passff-host  firefox-i18n-cs thunderbird thunderbird-i18n-cs wget yajl bitwarden cronie  noto-fonts-extra  picom pacman-contrib seahorse volumeicon neovim xdg-utils xdg-user-dirs-gtk unzip pavucontrol network-manager-applet noto-fonts ttf-dejavu file-roller"

# Aktualizace systému a instalace balíčků
echo "Aktualizuji systém a instaluji základní balíčky..."
sudo pacman -Syu --needed $pacman_packages --noconfirm

echo "Instalace dokončena!"
