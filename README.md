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

wget https://raw.githubusercontent.com/Lajto/arch-installation/master/01_archiso.sh

sh 01_archiso.sh

rm 01_archiso.sh

arch-chroot /mnt /bin/bash

sudo pacman -S wget

wget https://raw.githubusercontent.com/Lajto/arch-installation/master/02_chroot.sh

sh 02_chroot.sh

rm 02_chroot.sh

exit

umount -R /mnt/{boot,}

reboot
```

# Steps for postinstallation

Nos conectamos con el usuario root.

```sh
wget https://raw.githubusercontent.com/Lajto/arch-installation/master/03_chroot.sh

sh 03_chroot.sh

rm 03_chroot.sh
```
