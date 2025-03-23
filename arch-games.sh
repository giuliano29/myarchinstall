#!/bin/bash

# Verifica se o script está rodando como root
if [[ $EUID -ne 0 ]]; then
    echo "Este script precisa ser executado como root!"
    exit 1
fi

echo "\U0001F680 Iniciando a instalação do KDE Plasma 6 mínimo no Arch Linux..."
pacman -Syu --noconfirm

echo "Instalando KDE Plasma 6 e aplicativos padrão..."
pacman -S --noconfirm plasma plasma-desktop systemsettings kwin kscreen kclock sddm sddm-kcm konsole dolphin ark gwenview ufw \
    plasma-firewall plasma-nm okular firefox spectacle xdg-desktop-portal-kde plasma-pa kcodecs fwupd flatpak kcalc \
    plasma-wayland-protocols kate

echo "Instalando codecs multimídia..."
pacman -S --noconfirm ffmpeg gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav libdvdcss pipewire pipewire-pulse wireplumber

echo "Adicionando suporte a Wayland e XWayland..."
pacman -S --noconfirm qt6-wayland xorg-xwayland

echo "Instalando pacotes essenciais para compatibilidade e desempenho de jogos..."
pacman -S steam gamemode mangohud goverlay vulkan-radeon lib32-vulkan-radeon \
    lib32-mesa lib32-mangohud lib32-gamemode gamemode lib32-gnutls \
    vkd3d mesa-utils lib32-mesa-utils power-profiles-daemon gst-libav \
    lib32-libxcrypt lib32-vulkan-icd-loader lib32-libxrandr lib32-sdl2_ttf \
    corectrl git bash-completion wget amdgpu_top

echo "Instalando fontes..."
pacman -S --noconfirm ttf-liberation ttf-dejavu ttf-droid ttf-nerd-fonts-symbols powerline-fonts

echo "Instalando bibliotecas para o firestorm"
pacman -S --noconfirm lib32-libidn11 lib32-gst-plugins-good lib32-gst-plugins-base

echo "Instalando pacotes para compilação"
pacman -S --noconfirm base-devel fakeroot

echo "Ativando o gerenciador de login SDDM..."
systemctl enable sddm

echo "Configuração concluída! Reinicie o sistema para aplicar as mudanças."
