

# Wifi
#sudo nmcli dev wifi connect "SSID" password "contraseña"

# Pacman configuration
sudo echo "" >> /etc/pacman.conf
sudo echo "Color" >> /etc/pacman.conf
sudo echo "" >> /etc/pacman.conf
sudo echo "[multilib]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# Useful things
sudo pacman -S wget nano make libxml2 lib32-libxml2 git mercurial lm_sensors

# Compression tools
sudo pacman -S unrar p7zip zip unzip

# Fonts
sudo pacman -S ttf-dejavu font-mathematica ttf-freefont ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine ttf-ubuntu-font-family ttf-gentium noto-fonts

# Audio
sudo pacman -S alsa-firmware pulseaudio pulseaudio-alsa libcanberra-pulse lib32-libcanberra-pulse

# GStreamer and more codecs
sudo pacman -S gstreamer0.10 gstreamer0.10-plugins gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer ffmpegthumbs xvidcore

# CD/DVD
sudo pacman -S lsdvd libdvbpsi libdvdread libdvdnav

# HP
sudo pacman -S hplip

# Xorg
sudo pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils mesa mesa-demos

# NVIDIA drivers
sudo pacman -S nvidia nvidia-libgl nvidia-utils opencl-nvidia lib32-nvidia-libgl lib32-nvidia-utils lib32-opencl-nvidia libvdpau libva-vdpau-driver lib32-libva-vdpau-driver lib32-libvdpau

# NVIDIA 340 drivers
sudo pacman -S nvidia-340xx nvidia-340xx-libgl nvidia-340xx-utils opencl-nvidia-340xx lib32-nvidia-340xx-libgl lib32-nvidia-340xx-utils lib32-opencl-nvidia-340xx libvdpau libva-vdpau-driver lib32-libva-vdpau-driver lib32-libvdpau

# NVIDIA Optimus (replace "lajto")
sudo pacman -S bumblebee mesa xf86-video-intel nvidia virtualgl lib32-virtualgl lib32-nvidia-utils lib32-mesa-libgl libvdpau libva-vdpau-driver lib32-libva-vdpau-driver lib32-libvdpau
gpasswd -a lajto bumblebee
sudo systemctl enable bumblebeed.service

# ATI (Radeon)
sudo pacman -S xf86-video-ati

# Intel
sudo pacman -S xf86-video-intel


