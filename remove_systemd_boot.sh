#!/bin/bash

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

  
# Atualizar GRUB após todas as mudanças
echo "Atualizando GRUB..."
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Instalação concluída! Reinicie o sistema e selecione o Kernel Zen no boot para melhor desempenho."
