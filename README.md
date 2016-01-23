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

sh archiso.sh

arch-chroot /mnt /bin/bash

## Replace "lajto" to your username in the two lines of useradd using: nano chroot.sh
wget -O chroot.sh http://bit.ly/1UephBb #https://raw.githubusercontent.com/Lajto/arch-installation/master/chroot.sh

sh chroot.sh

rm chroot.sh

exit

umount -R /mnt/{boot,}

reboot
```

# Steps for postinstallation

Use your normal user.

```sh
## Replace the username "lajto" in $(USER_NAME): nano Makefile
wget -O Makefile http://bit.ly/1nARoQD #https://raw.githubusercontent.com/Lajto/arch-installation/master/Makefile

make user-things

## Choose your graphic card driver
make nvidia
make nvidia-340
make nvidia-optimus
make nouveau
make ati-radeon
make intel
make virtualbox

## Respond "yes" to conflicts
sudo pacman -S infinality-bundle infinality-bundle-multilib

## Choose your desktop environment
make deepin # not ready (bugs)
make gnome
make mate
make kde # not ready (too much packages)
```

Then, using your favourite desktop environment:

```sh
make apps

make games

make wine-games ## Graphics > Capture the mouse in full screen

rm Makefile

sudo reboot
```

Done!

# Graphical configuration (MATE)

# Graphical configuration (GNOME)
