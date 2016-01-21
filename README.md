# arch-installation
Scripts to automate the installation and postinstallation of Arch Linux using my preferences.

We assume:
- 64 bits Intel CPU
- BIOS system
- Spanish language and keyboard
- Wired Internet (enp0s3)
- sda disk
    - sda1 as /boot
    - sda2 as /
    - sda3 as swap

# Steps for installation

```sh
loadkeys es

wget -O archiso.sh http://bit.ly/1nq2Yy8 #https://raw.githubusercontent.com/Lajto/arch-installation/master/archiso.sh

sh archiso.sh

arch-chroot /mnt /bin/bash

wget -O chroot.sh http://bit.ly/1UephBb #https://raw.githubusercontent.com/Lajto/arch-installation/master/chroot.sh

sh chroot.sh

rm chroot.sh

exit

umount -R /mnt/{boot,}

reboot
```

# Steps for postinstallation

Nos conectamos con el usuario root.

```sh
# Internet
systemctl start NetworkManager.service
systemctl enable NetworkManager.service

# User settings (replace "lajto" with your user name)
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash lajto
passwd lajto
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

reboot
```

Nos conectamos con el usuario normal.

```sh
wget -O Makefile http://bit.ly/1nARoQD #https://raw.githubusercontent.com/Lajto/arch-installation/master/Makefile

wget -O 10-keyboard.conf http://bit.ly/1P8yECo #https://raw.githubusercontent.com/Lajto/arch-installation/master/10-keyboard.conf

make user-things

## Choose your graphic card driver
make nvidia
make nvidia-340
make nvidia-optimus
make nouveau
make ati-radeon
make intel

## Choose your desktop environment
make deepin
make gnome
```

Done!
