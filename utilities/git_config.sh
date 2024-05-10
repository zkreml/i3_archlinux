#!/bin/bash  
#
##################################################################################################################
# Napsáno pro použití na 64bitových počítačích
# Autor: Archos
# Webová stránka: https://arch-linux.cz
##################################################################################################################
##################################################################################################################

# Příkazy pro řešení problémů

# Přečtěte si před použitím.
# https://www.atlassian.com/git/tutorials/undoing-changes/git-reset
# git reset --hard origin/master
# POUZE pokud jste si naprosto jisti a na vašem githubu nepracují vaši kolegové.

# Příkazy, které pomohly v minulosti
# Vynutit git, aby přepsal lokální soubory při pull - bez sloučení
# git fetch all
# git push --set-upstream origin master
# git reset --hard origin/master

# Nastavení Git
git config --global pull.rebase false
git config --global user.name "uživatel"
git config --global user.email "váš email"
sudo git config --system core.editor nano
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=32000'
git config --global push.default simple

echo "################################################################"
echo "###################    K O N E C      ##########################"
echo "################################################################" 
