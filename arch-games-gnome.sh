#!/bin/bash

# Verifica se o script está rodando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script precisa ser executado como root!"
    exit 1
fi

echo "\U0001F680 Iniciando a instalação do GNOME mínimo no Arch Linux..."
pacman -Syu --noconfirm

echo "\U0001F680 Instalando GNOME aplicativos padrão..."
pacman -S --noconfirm gnome timeshift gnome-control-center gnome-terminal \
    gnome-backgrounds gnome-tweaks gnome-shell-extensions gnome-themes-extra \
    gnome-calculator xdg-user-dirs-gtk dconf-editor file-roller gvfs gvfs-mtp \
    gvfs-afc totem gnome-music gnome-sound-recorder pitivi lm_sensors \
    gnome-nettool gvfs gvfs-smb gnome-user-share flatpak vlc fwupd \
    gnome-disk-utility gnome-calendar gnome-clocks nautilus-share nautilus-image-converter
    
echo "\U0001F680 Instalando codecs multimídia..."
pacman -S --noconfirm ffmpeg gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav libdvdcss pipewire pipewire-pulse wireplumber

echo "\U0001F680 Instalando pacotes essenciais para compatibilidade e desempenho de jogos..."
pacman -S --noconfirm steam gamemode mangohud goverlay vulkan-radeon lib32-vulkan-radeon \
    lib32-mesa lib32-mangohud lib32-gamemode gamemode lib32-gnutls \
    vkd3d mesa-utils lib32-mesa-utils power-profiles-daemon gst-libav \
    lib32-libxcrypt lib32-vulkan-icd-loader lib32-libxrandr lib32-sdl2_ttf \
    corectrl git bash-completion wget amdgpu_top

echo "\U0001F680 Instalando fontes..."
pacman -S --noconfirm ttf-liberation ttf-dejavu ttf-droid ttf-nerd-fonts-symbols powerline-fonts

echo "\U0001F680 Instalando bibliotecas para o firestorm"
pacman -S --noconfirm lib32-libidn11 lib32-gst-plugins-good lib32-gst-plugins-base

echo "\U0001F680 Instalando pacotes para compilação"
pacman -S --noconfirm base-devel fakeroot

echo "\U0001F680 Ativando o gerenciador de login GDM..."
systemctl enable gdm

echo "\U0001F680 Configuração concluída! Reinicie o sistema para aplicar as mudanças."
