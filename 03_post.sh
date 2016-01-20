

# Internet
systemctl start NetworkManager.service
systemctl enable NetworkManager.service

# User settings (replace "lajto" with your user name)
useradd -m -g users -G audio,lp,optical,storage,video,wheel,games,power,scanner -s /bin/bash lajto
passwd lajto
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

reboot
