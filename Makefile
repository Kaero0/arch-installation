
.SILENT:
.PHONY:



USER_NAME=lajto



###############################################################################
#                           AFTER USER IS CREATED                             #
###############################################################################

user-things:
	# Wifi
	#sudo nmcli dev wifi connect "SSID" password "contraseña"
	# Pacman configuration
	sudo echo "" >> /etc/pacman.conf
	sudo echo "Color" >> /etc/pacman.conf
	sudo echo "" >> /etc/pacman.conf
	sudo echo "[multilib]" >> /etc/pacman.conf
	sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
	# Update
	sudo pacman -Syu
	# Useful things
	sudo pacman -S wget nano make libxml2 lib32-libxml2 git mercurial \
	lm_sensors
	# Compression tools
	sudo pacman -S unrar p7zip zip unzip
	# Fonts
	sudo pacman -S ttf-dejavu font-mathematica ttf-freefont ttf-liberation \
	adobe-source-code-pro-fonts ttf-inconsolata ttf-droid ttf-anonymous-pro \
	ttf-bitstream-vera ttf-linux-libertine ttf-ubuntu-font-family ttf-gentium \
	noto-fonts artwiz-fonts
	# Audio
	sudo pacman -S alsa-firmware pulseaudio pulseaudio-alsa libcanberra-pulse \
	lib32-libcanberra-pulse
	# GStreamer and more codecs
	sudo pacman -S gstreamer0.10 gstreamer0.10-plugins gstreamer gst-libav \
	gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly \
	libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer ffmpegthumbs xvidcore
	# CD/DVD
	sudo pacman -S lsdvd libdvbpsi libdvdread libdvdnav
	# HP
	sudo pacman -S hplip
	# Xorg
	sudo pacman -S xorg-server xorg-xinit xorg-utils xorg-server-utils mesa \
	mesa-demos
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf



nvidia:
	sudo pacman -S nvidia nvidia-libgl nvidia-utils opencl-nvidia \
	lib32-nvidia-libgl lib32-nvidia-utils lib32-opencl-nvidia libvdpau \
	libva-vdpau-driver lib32-libva-vdpau-driver lib32-libvdpau

nvidia-340:
	sudo pacman -S nvidia-340xx nvidia-340xx-libgl nvidia-340xx-utils \
	opencl-nvidia-340xx lib32-nvidia-340xx-libgl lib32-nvidia-340xx-utils \
	lib32-opencl-nvidia-340xx libvdpau libva-vdpau-driver \
	lib32-libva-vdpau-driver lib32-libvdpau

nvidia-optimus:
	sudo pacman -S bumblebee mesa xf86-video-intel nvidia virtualgl \
	lib32-virtualgl lib32-nvidia-utils lib32-mesa-libgl libvdpau \
	libva-vdpau-driver lib32-libva-vdpau-driver lib32-libvdpau
	gpasswd -a $(USER_NAME) bumblebee
	sudo systemctl enable bumblebeed.service

nouveau:
	sudo pacman -S xf86-video-nouveau mesa-vdpau

ati-radeon:
	sudo pacman -S xf86-video-ati mesa-vdpau

intel:
	sudo pacman -S xf86-video-intel libvdpau-va-gl libva-intel-driver



deepin:
	sudo pacman -S deepin deepin-movie deepin-music deepin-screenshot \
	deepin-terminal lightdm
	echo "" >> /etc/lightdm/lightdm.conf
	echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
	echo "greeter-session=lightdm-deepin-greeter" >> /etc/lightdm/lightdm.conf
