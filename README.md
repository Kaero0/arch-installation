# arch-installation
Scripts to automate the installation and postinstallation of Arch Linux using my preferences.

We assume:
- 64 bits Intel CPU
- BIOS system
- Spanish language and keyboard
- sda disk
    - sda1 as /boot
    - sda2 as /
    - sda3 as swap

# Steps for installation

```sh
loadkeys es

wget -O archiso.sh http://bit.ly/1nq2Yy8 #https://raw.githubusercontent.com/Lajto/arch-installation/master/archiso.sh

## When nano opens chroot.sh, replace "lajto" to your username in the two lines of useradd
sh archiso.sh

arch-chroot /mnt /bin/bash

wget -O archiso.sh http://bit.ly/1UephBb #https://raw.githubusercontent.com/Lajto/arch-installation/master/chroot.sh

sh archiso.sh

rm archiso.sh

exit

umount -R /mnt/{boot,}

reboot
```

# Steps for postinstallation

Use your normal user.

```sh
## Replace the username "lajto" in the Makefile
wget -O Makefile http://bit.ly/1nARoQD #https://raw.githubusercontent.com/Lajto/arch-installation/master/Makefile

make user-things

## Choose your graphic card driver
make nvidia
make nvidia-340
make nvidia-optimus
make nouveau
make ati-radeon
make intel

## Respond "yes" to conflicts
sudo pacman -S infinality-bundle infinality-bundle-multilib

## Choose your desktop environment
make deepin # not ready yet
make gnome
make mate
make kde # not ready yet
```

Then, using a your favourite desktop environment:

```sh
make apps

make games

make wine-games ## Graphics > Capture the mouse in full screen

rm Makefile
```

Done!
