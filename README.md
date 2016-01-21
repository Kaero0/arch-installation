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

wget https://raw.githubusercontent.com/Lajto/arch-installation/master/archiso.sh

sh archiso.sh

rm archiso.sh

arch-chroot /mnt /bin/bash

wget https://raw.githubusercontent.com/Lajto/arch-installation/master/chroot.sh

sh chroot.sh

rm chroot.sh

exit

umount -R /mnt/{boot,}

reboot
```

# Steps for postinstallation

Nos conectamos con el usuario root.

```sh
wget https://raw.githubusercontent.com/Lajto/arch-installation/master/03_post.sh

## Antes hay que sustituir "lajto" en el archivo por tu nombre de usuario
## (el editor nano nos vale: nano 03_post.sh)
sh 03_post.sh

rm 03_post.sh

reboot
```

Nos conectamos con el usuario normal.

```sh
wget https://raw.githubusercontent.com/Lajto/arch-installation/master/Makefile

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
