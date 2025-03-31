#!/bin/bash

# Verifica se o script está rodando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script precisa ser executado como root!"
    exit 1
fi

echo "\U0001F680 Iniciando a instalação do KDE Plasma 6 mínimo no Arch Linux..."
pacman -Syu --noconfirm

echo "Instalando KDE Plasma 6 e aplicativos padrão..."
pacman -S --noconfirm plasma-desktop systemsettings kwin kscreen kclock sddm sddm-kcm konsole \
    dolphin ark gwenview ufw plasma-firewall okular firefox spectacle xdg-desktop-portal-kde kcodecs \
    fwupd flatpak kcalc kate timeshift amdgpu_top git bash-completion wget corectrl steam nano vlc \
    gamemode mangohud steam goverlay lib32-mangohud lib32-gamemode wine wine-gecko winetricks htop \
    wine-mono kde-gtk-config qt6-wayland kio-extras krename partitionmanager kdf plasma-disks geany \
    networkmanager plasma-nm mesa-utils lib32-mesa-utils vulkan-tools p7zip kdeconnect btop plasma-pa \
    lib32-libidn lib32-libidn2 kvantum power-profiles-daemon powerdevil breeze-gtk kde-graphics-meta \
    plasma-systemmonitor jre17-openjdk plasma-browser-integration plasma-workspace-wallpapers \
    kaccounts-integration kaccounts-providers kio-gdrive

echo "Instalando fontes..."
pacman -S --noconfirm ttf-liberation ttf-dejavu ttf-droid ttf-nerd-fonts-symbols powerline-fonts

echo "Instalando pacotes para compilação"
pacman -S --noconfirm base-devel fakeroot

echo "Ativando o gerenciador de login SDDM..."
systemctl enable sddm

echo "Configuração concluída! Reinicie o sistema para aplicar as mudanças."
