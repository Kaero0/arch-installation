

# Configure locales
echo "es_ES.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=es_ES.UTF-8" >> /etc/locale.conf

# Configure keyboard language and console font
echo "KEYMAP=es" >> /etc/vconsole.conf
echo "FONT=lat9w-16" >> /etc/vconsole.conf

# Configure timezone
ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Sync hardware clock datetime
hwclock --systohc --utc

# mkinitcpio
mkinitcpio -p linux

# Pacman configuration
sudo echo "" >> /etc/pacman.conf
sudo echo "Color" >> /etc/pacman.conf
sudo echo "" >> /etc/pacman.conf
sudo echo "[multilib]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# GRUB
pacman -S os-prober intel-ucode
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Network
echo "arch-pc" >> /etc/hostname

# Internet
systemctl enable NetworkManager.service

# User settings (replace "lajto" with your user name)
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash lajto
passwd lajto
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Root password
passwd
