# Název Projektu - Rychlé instalace správce oken i3 pro Arch Linux

Tento projekt poskytuje skripty pro rychlou instalaci a konfiguraci základních aplikací a nástrojů nezbytných po instalaci Arch Linuxu. Hlavním cílem je ulehčit nastavení prostředí se správcem oken i3, aby byl váš systém ihned připraven k použití.

## Hlavní rysy

- **Automatizované Skripty**: Skripty pro jednoduchou a rychlou instalaci aplikací a nástrojů.
- **Konfigurace i3**: Přednastavené skripty pro konfiguraci i3, což zajišťuje, že váš spouštěcí systém bude ihned připraven k použití.

## Instalace

Pro stažení a instalaci projektu postupujte podle následujících kroků:

1. Klonujte repozitář:
   ```bash
   git clone https://git.archoslinux.cz/archos/Archlinux_I3.git
    ```
2. Přejděte do adresáře repozitáře:
   ```bash
   cd Archlinux_I3
   ```
3. Nastavte skripty jako spustitelné pomocí následujících příkazů v kořenovém adresáři:
- Pro změnu oprávnění všech souborů s příponou `.sh` ve stávajícím adresáři:
  ```bash
  chmod +x *.sh
  ```
4. 
- Pro změnu oprávnění všech souborů s příponou `.sh` ve stávajícím adresáři i v podadresářích:
  ```bash
  find . -type f -name "*.sh" -exec chmod +x {} \;
 ```

## Popis skriptů a jejich instalace

- **install_packages.sh** - Tento skript instaluje základní balíčky, které jsou potřebné pro systém a pro správné fungování správce oken i3. Seznam balíčků k instalaci je definován v souboru `packages-repository.txt`.

Spustí se příkazem:

```bash
./install_packages.sh
```

- **install_aur_package.sh** - Tento skript je určen pro instalaci balíčků z Arch User Repository (AUR). Nejprve ověří, zda je nainstalován `git` a pomocník pro AUR (`yay`). Pokud nejsou nainstalovány, skript je automaticky nainstaluje. Dále instaluje balíčky specifikované v proměnné `package_name`. Výchozí nastavení zahrnuje instalaci aplikací `autotiling` a `picom`, které slouží k:
  
  - **autotiling** - Nástroj pro automatické přepínání orientace dlaždic v i3 nebo sway podle aktuálního layoutu.
  - **picom** - Kompozitní manažer pro Xorg, vylepšující vizuální výkon a poskytující efekty jako průhlednost a stínování oken.

  Spustí se příkazem:
  ```bash
  ./install_aur_package.sh
  ```
 

- **pacman_packages.sh** - Tento skript je určen pro instalaci širokého spektra aplikací, které osobně preferuji pro každodenní použití v Arch Linuxu. Seznam aplikací obsahuje esenciální nástroje jako Firefox a Vim, multimediální aplikace jako SMPlayer a VLC, nástroje pro správu souborů jako Thunar a PCManFM, kancelářský balík LibreOffice a mnoho dalších. Skript dále aktualizuje systém před instalací balíčků, aby zajistil, že jsou instalovány nejnovější dostupné verze. Skript je nastaven tak, aby nevyžadoval potvrzení během instalace, což zrychluje proces. 

  Skript je konfigurován pro snadnou úpravu, takže můžete přidat nebo odebrat aplikace podle vašich potřeb. Spustí se příkazem:
  ```bash
  ./pacman_packages.sh
   ```
 - **move_config_files.sh** Tento skript, automatizuje přesun konfiguračních souborů z naklonovaného repozitáře do odpovídajících složek v domovském adresáři.
 Upravte cesty: Upravte proměnné REPO_PATH a HOME_PATH tak, aby odpovídaly vašim cestám k naklonovanému repozitáři a vašemu domovskému adresáři.
Spusťte skript: Spusťte skript z terminálu příkazem 

```bash
  ./move_config_files.sh
   ```


## Struktura Konfigurační Složky

Projekt obsahuje následující konfigurační složky, které jsou součástí adresáře `.config`. Každá složka má specifický účel:

### `/dunst`
- **Účel**: Obsahuje konfigurační soubory pro `dunst`, což je démon pro zobrazení notifikací v systému. Umožňuje přizpůsobení vzhledu a chování notifikací.

### `/gtk-3.0`
- **Účel**: Tato složka obsahuje konfigurační soubory pro GTK+ 3 aplikace, což zahrnuje nastavení témat, ikon a dalších grafických prvků.

### `/i3`
- **Účel**: Hlavní konfigurační soubory pro správce oken i3. Zde naleznete soubory pro nastavení klávesových zkratek, vzhledu a dalších funkcí i3.

### `/i3/scripts`
- **Účel**: Skripty specifické pro i3, které mohou zahrnovat utility pro správu okenních uspořádání, automatické spouštění aplikací a další.

### `/nano`
- **Účel**: Konfigurační soubory pro textový editor Nano, včetně nastavení syntaxového zvýraznění a dalších editorových preferencí.

### `/rofi`
- **Účel**: Složka pro `rofi`, moderní zástupce tradičního dialogového okna pro spouštění programů. Obsahuje konfigurace, které definují vzhled a chování tohoto nástroje.

### `/xfce4/terminal`
- **Účel**: Nastavení pro terminál Xfce4, které umožňují přizpůsobení schémat barev, písma a dalších aspektů vzhledu terminálu.

## Použití


## Složka <a href="https://git.arch-linux.cz/Archos/Archlinux_I3/src/branch/main/utilities" target="_blank">utilities</a>

Tato složka obsahuje pomocné skripty, které rozšiřují funkcionalitu systému. Zde je přehled skriptů a jejich funkcí:

- **check_updates.sh**: Skript pro kontrolu dostupných aktualizací systému. Informuje uživatele o dostupných aktualizacích prostřednictvím terminálu. Skript můžete integrovat do Conky nebo i3blocks pro pravidelné zobrazování aktualizací.
Tento skript využívá nástroj checkupdates, který je součástí balíčku pacman-contrib v Arch Linuxu. Ujisti se, že je tento balíček nainstalován:

 ```bash
sudo pacman -S pacman-contrib
 ```

- **git_config.sh**: Nastavuje globální konfigurace Gitu, včetně jména uživatele, emailu a výchozího editoru, což usnadňuje správu verzí a práci s repozitáři.

- **system_updates.sh** - Tento skript slouží k pravidelnému aktualizování systému a aplikací v Arch Linuxu. Skript zkontroluje dostupné aktualizace a provede je bez uživatelského zásahu. Pro zajištění, že uživatel bude informován o průběhu aktualizace, skript může zobrazovat notifikace pomocí desktopového notifikačního systému.


### Integrace `check_updates.sh`

#### Conky

&#x2022; Pro zobrazení výstupu skriptu `check_updates.sh` v Conky, přidejte následující řádek do vašeho `.conkyrc` souboru:

 ```bash
${execi 600 /cesta/k/check_updates.sh}
 ```
#### i3blocks

&#x2022;Pro integraci výstupu skriptu update_check.sh do i3blocks, přidejte následující blok do vašeho konfiguračního souboru i3blocks:
 ```bash
[updates]
command=/cesta/k/skripty/check_updates
interval=600
 ```

 - **update_notifier.sh** - Tento skript slouží k pravidelnému aktualizování systému a aplikací v Arch Linuxu. Skript zkontroluje dostupné aktualizace a provede je bez uživatelského zásahu. Pro zajištění, že uživatel bude informován o průběhu aktualizace, skript může zobrazovat notifikace pomocí desktopového notifikačního systému.

 ### Nastavení periodických aktualizací pomocí crontab

 1. Otevřete `crontab` pro úpravy:
    ```bash
    crontab -e
    ```

2. Přidejte následující řádek pro spouštění system_updates.sh každou hodinu.

  ```bash
/59 * * * * /cesta/k/update_notifier.sh
  ```

### Přidání notifikací do i3 config

&#x2022; Chcete-li získat vizuální zpětnou vazbu prostřednictvím systémových notifikací, ujistěte se, že máte nainstalovaný a nakonfigurovaný nástroj pro notifikace, například dunst. Přidání spuštění dunst do i3 config může vypadat takto:

  ```bash
  exec_always --no-startup-id dunst

  ```

&#x2022;  Pro i3 window manager, můžete zahrnout skript pro automatické spuštění při startu i3, přidejte následující řádek do vaší konfiguračního souboru i3:

  ```bash
exec_always --no-startup-id /path/to/update_notifier.sh
  ```

&#x2022; Pro snadné spouštění aktualizací můžete přidat klávesovou zkratku do vašeho i3 konfiguračního souboru:

  ```bash
bindsym $mod+Shift+u exec i3-sensible-terminal -e "sudo pacman -Syu"
  ```
  

