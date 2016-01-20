## We assume:
## - 64 bits
## - BIOS system
## - Spanish language and keyboard
## - Wired Internet
## - sda disk
##     - sda1 as /boot
##     - sda2 as /
##     - sda3 as swap

# Spanish keyboard (not persistent)
loadkeys es

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
pacstrap -i /mnt base base-devel

## Generate a fstab file
genfstab -U /mnt > /mnt/etc/fstab
