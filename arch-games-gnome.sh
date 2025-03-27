#!/bin/bash

# Verifica se o script está rodando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script precisa ser executado como root!"
    exit 1
fi

# Cores
VERMELHO="\e[31m"
VERDE="\e[32m"
AMARELO="\e[33m"
AZUL="\e[34m"
MAGENTA="\e[35m"
CIANO="\e[36m"
BRANCO="\e[37m"
PADRAO="\e[0m"  # Reseta a cor para o normal

echo -e "${AZUL}Iniciando a instalação do GNOME mínimo no Arch Linux...${AZUL}"
pacman -Syu --noconfirm

echo -e "${AZUL}Instalando GNOME aplicativos padrão...${AZUL}"
pacman -S --noconfirm gnome timeshift gnome-control-center gnome-terminal \
    gnome-backgrounds gnome-tweaks gnome-shell-extensions gnome-themes-extra \
    gnome-calculator xdg-user-dirs-gtk dconf-editor file-roller gvfs gvfs-mtp \
    gvfs-afc totem gnome-music gnome-sound-recorder lm_sensors fwupd \
    gnome-nettool gvfs gvfs-smb gnome-user-share flatpak vlc gnome-firmware \
    gnome-disk-utility gnome-calendar gnome-clocks nautilus-share nautilus-image-converter \
    gnome-shell-extension-appindicator firefox nano htop gnome-browser-connector papirus-icon-theme
    
echo -e "${AZUL}Instalando codecs multimídia...${AZUL}"
pacman -S --noconfirm ffmpeg gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav libdvdcss pipewire pipewire-pulse wireplumber

echo -e "${AZUL}Instalando bibliotecas para o firestorm${AZUL}"
pacman -S --noconfirm lib32-libidn11 lib32-gst-plugins-good lib32-gst-plugins-base

echo -e "${AZUL} Instalando pacotes essenciais para compatibilidade e desempenho de jogos...${AZUL}"
pacman -S --noconfirm steam gamemode mangohud goverlay vulkan-radeon lib32-vulkan-radeon \
    lib32-mesa lib32-mangohud lib32-gamemode gamemode lib32-gnutls \
    vkd3d mesa-utils lib32-mesa-utils power-profiles-daemon gst-libav \
    lib32-libxcrypt lib32-vulkan-icd-loader  lib32-libxrandr lib32-sdl2_ttf \
    lib32-vkd3d lib32-vulkan-mesa-layers corectrl git bash-completion wget \
    amdgpu_top
    
echo -e "${AZUL}Instalando fontes...${AZUL}"
pacman -S --noconfirm ttf-liberation ttf-dejavu ttf-droid ttf-nerd-fonts-symbols powerline-fonts

echo -e "${AZUL}Instalando pacotes para compilação${AZUL}"
pacman -S --noconfirm base-devel fakeroot

echo -e "${AZUL}Ativando o gerenciador de login GDM...${AZUL}"
systemctl enable gdm

echo -e "${AZUL}Configuração concluída! Reinicie o sistema para aplicar as mudanças.${AZUL}"
