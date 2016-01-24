

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
sed -i 's/#Color/Color/' /etc/pacman.conf
sed -i 's/#\[multilib\]/\[multilib\]\nInclude = \/etc\/pacman.d\/mirrorlist/' /etc/pacman.conf
echo "" >> /etc/pacman.conf
echo "[infinality-bundle]" >> /etc/pacman.conf
echo "Server = http://bohoomil.com/repo/\$arch" >> /etc/pacman.conf
echo "" >> /etc/pacman.conf
echo "[infinality-bundle-multilib]" >> /etc/pacman.conf
echo "Server = http://bohoomil.com/repo/multilib/\$arch" >> /etc/pacman.conf
pacman-key -r 962DDE58
pacman-key --lsign-key 962DDE58
pacman -Syu --noconfirm

# GRUB
pacman -S --noconfirm os-prober intel-ucode
grub-install --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Network
echo "arch-pc" >> /etc/hostname

# Internet
systemctl enable NetworkManager.service

# User settings (replace "lajto" with your user name)
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash -c "Lajto" lajto
passwd lajto
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# More things
if [ ! -f /etc/rc.conf ]; then
    echo 'HARDWARECLOCK=UTC' >> /etc/rc.conf
    echo 'TIMEZONE=Europe/Madrid' >> /etc/rc.conf
    echo 'KEYMAP=es' >> /etc/rc.conf
    echo 'LOCALE=es_ES.UTF-8' >> /etc/rc.conf
    echo 'USECOLOR=yes' >> /etc/rc.conf
fi

# Root password
passwd
