#!/bin/bash

set -e  # Para interromper a execução em caso de erro

echo "\\U0001F680 Iniciando a instalação do KDE Plasma 6 mínimo no Arch Linux..."

# Atualizar o sistema antes de instalar qualquer coisa
sudo pacman -Syu --noconfirm

# 1️ Remover systemd-boot (se estiver instalado)
if [ -d /boot/loader ]; then
    echo "Removendo systemd-boot..."
    sudo bootctl remove
    sudo rm -rf /boot/loader /boot/EFI/systemd
fi

# 2️ Instalar e configurar o GRUB 2
echo "Instalando e configurando GRUB 2..."
sudo pacman -S --noconfirm grub efibootmgr
sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sudo grub-mkconfig -o /boot/grub/grub.cfg

# 3️ Instalar Kernel Zen primeiro
echo "Instalando Kernel Zen..."
sudo pacman -S --noconfirm linux-zen linux-zen-headers

# 4️ Instalar KDE Plasma 6 mínimo
echo "Instalando KDE Plasma 6 mínimo..."
sudo pacman -S --noconfirm plasma-desktop systemsettings kwin

# 5️ Instalar gerenciador de login (SDDM)
echo "Instalando e ativando SDDM..."
sudo pacman -S --noconfirm sddm
sudo systemctl enable sddm

# 6️ Instalar suporte a Wayland e X11
echo "Adicionando suporte a Wayland e XWayland..."
sudo pacman -S --noconfirm qt6-wayland xorg-xwayland

# 7️ Instalar bibliotecas multimídia
echo "Instalando bibliotecas multimídia..."
sudo pacman -S --noconfirm \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-plugin-pipewire \
    lib32-gstreamer lib32-gst-plugins-base lib32-gst-plugins-good lib32-gst-plugins-bad lib32-gst-plugins-ugly \
    lib32-gst-libav lib32-libpulse lib32-alsa-plugins lib32-alsa-lib \
    libidn11 lib32-libidn11

# 8️ Instalar navegadores e aplicativos essenciais
echo "Instalando navegadores e aplicativos..."
sudo pacman -S --noconfirm firefox falkon gimp steam

# 9 Instalar navegadores e aplicativos essenciais
echo "instalando fontes necessárias"
sudo pacman -S --noconfirm ttf-liberation ttf-dejavu noto-fonts noto-fonts-cjk noto-fonts-emoji

# 10 Instalar pacotes adicionais
echo "Instalando pacotes adicionais..."
sudo pacman -S --noconfirm amdgpu_top bash-completion btop dolphin fakeroot \
    ffmpeg flatpak gamemode gamescope goverlay htop kcalc kcodecs kscreen \
    kvantum mesa-demos mesa-utils networkmanager-qt okular plasma-nm \
    plasma-pa powerdevil powerline-fonts sudo mangohud spectacle base-devel

# Atualizar GRUB após todas as mudanças
echo "Atualizando GRUB..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Instalação concluída! Reinicie o sistema e selecione o Kernel Zen no boot para melhor desempenho."
