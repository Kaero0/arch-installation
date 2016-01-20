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
git clone https://github.com/Lajto/arch-installation

cd arch-installation

sh 01_archiso.sh

arch-chroot /mnt /bin/bash

git clone https://github.com/Lajto/arch-installation

cd arch-installation

sh 02_chroot.sh

exit

umount -R /mnt

reboot
```

# Steps for postinstallation

```sh
#
```
