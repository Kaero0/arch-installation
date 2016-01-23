

# Better font to console
setfont lat9w-16

# Sync datetime
timedatectl set-ntp true

## Format partitions
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

## Swap things
mkswap /dev/sda3
mkswap /dev/sda3

## Mounting
mount /dev/sda2 /mnt
mkdir -p /mnt/boot
mount /dev/sda1 /mnt/boot

## Install base and base-devel packages
pacstrap /mnt base base-devel
pacstrap /mnt grub-bios
pacstrap /mnt networkmanager
pacstrap /mnt xf86-input-synaptics
pacstrap /mnt wget

## Generate a fstab file
genfstab -U /mnt > /mnt/etc/fstab

# chroot
wget -O chroot.sh https://raw.githubusercontent.com/Lajto/arch-installation/master/chroot.sh
nano chroot.sh ## Replace "lajto" to your username
arch-chroot /mnt /bin/bash chroot.sh
rm chroot.sh

# Umount
umount -R /mnt/{boot,}

# Reboot
reboot
