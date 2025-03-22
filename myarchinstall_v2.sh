#!/bin/bash

set -e  # Para interromper a execução em caso de erro

echo "\U0001F680 Iniciando a instalação do KDE Plasma 6 mínimo no Arch Linux..."

# Atualizar o sistema antes de instalar qualquer coisa
sudo pacman -Syu --noconfirm

# 1️ Remover systemd-boot (se estiver instalado)
if [ -d /boot/loader ]; then
    echo "Removendo systemd-boot..."
    sudo bootctl remove
    sudo rm -rf /boot/loader /boot/EFI/systemd
fi

# Instalar e configurar o GRUB 2
echo "Instalando e configurando GRUB 2..."
sudo pacman -S --noconfirm grub efibootmgr
sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Instalar Kernel Zen primeiro
echo "Instalando Kernel Zen..."
sudo pacman -S --noconfirm linux-zen linux-zen-headers

# Instalar Drivers Amd
sudo pacman -S --needed mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon \
    vulkan-mesa-layers lib32-vulkan-mesa-layers amd-ucode \
    lib32-libva-mesa-driver libva-mesa-driver \
    xf86-video-amdgpu

# Instalar KDE Plasma 6 mínimo
echo "Instalando KDE Plasma 6 mínimo..."
sudo pacman -S --noconfirm plasma-desktop systemsettings kwin xdg-desktop-portal-kde ufw wget

# Instalar gerenciador de login (SDDM)
echo "Instalando e ativando SDDM..."
sudo pacman -S --noconfirm sddm sddm-kcm
sudo systemctl enable sddm

# Instalar suporte a Wayland e X11
echo "Adicionando suporte a Wayland e XWayland..."
sudo pacman -S --noconfirm qt6-wayland xorg-xwayland

# Instalar bibliotecas multimídia
echo "Instalando bibliotecas multimídia..."
sudo pacman -S --noconfirm \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-plugin-pipewire \
    lib32-gstreamer lib32-gst-plugins-base lib32-gst-plugins-good lib32-gst-plugins-bad lib32-gst-plugins-ugly \
    lib32-gst-libav lib32-libpulse lib32-alsa-plugins lib32-alsa-lib \
    libidn11 lib32-libidn11

# Instalar navegadores e aplicativos essenciais
echo "Instalando navegadores e aplicativos..."
sudo pacman -S --noconfirm firefox falkon gimp steam corectrl

# Instalar pacotes adicionais
echo "Instalando pacotes adicionais..."
sudo pacman -S --noconfirm amdgpu_top bash-completion btop dolphin fakeroot \
    ffmpeg flatpak gamemode gamescope goverlay htop kcalc kcodecs kscreen \
    kvantum mesa-demos mesa-utils networkmanager-qt okular plasma-nm \
    plasma-pa powerdevil powerline-fonts sudo mangohud spectacle base-devel \
    timeshift power-profiles-daemon
# instalar pacotes flatpak
echo "instalando pacotes flatpak..."
flatpak install -y flathub \
  org.keepassxc.KeePassXC \
  com.discordapp.Discord \
  de.danielnoethen.butt \
  org.kde.kdenlive \
  net.davidotek.pupgui2 \
  com.obsproject.Studio
  
# Atualizar GRUB após todas as mudanças
echo "Atualizando GRUB..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Instalação concluída! Reinicie o sistema e selecione o Kernel Zen no boot para melhor desempenho."
