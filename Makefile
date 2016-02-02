
.SILENT: user-things nvidia nvidia-340 nvidia-optimus nouveau ati-radeon intel virtualbox deepin gnome mate kde apps games wine-games
.PHONY: user-things nvidia nvidia-340 nvidia-optimus nouveau ati-radeon intel virtualbox deepin gnome mate kde apps games wine-games



USER_NAME=lajto



user-things:
	# Wifi
	#sudo nmcli dev wifi connect "SSID" password "contraseña"
	# Update
	sudo pacman -Syu --noconfirm
	# Useful things
	sudo pacman -S --noconfirm wget nano make libxml2 git \
	mercurial lm_sensors ntfs-3g android-tools android-udev
	# Compression tools
	sudo pacman -S --noconfirm unrar p7zip zip unzip
	# CD/DVD
	sudo pacman -S --noconfirm lsdvd libdvbpsi libdvdread libdvdnav
	# HP
	sudo pacman -S --noconfirm hplip



nvidia:
	sudo pacman -S --noconfirm nvidia nvidia-libgl nvidia-utils opencl-nvidia \
	libvdpau \
	libva-vdpau-driver\
	xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)

nvidia-340:
	sudo pacman -S --noconfirm nvidia-340xx nvidia-340xx-libgl \
	nvidia-340xx-utils opencl-nvidia-340xx \
	libvdpau \
	libva-vdpau-driver \
	xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)

nvidia-optimus:
	sudo pacman -S --noconfirm bumblebee mesa xf86-video-intel nvidia \
	virtualgl libvdpau \
	libva-vdpau-driver \
	xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	gpasswd -a $(USER_NAME) bumblebee
	sudo systemctl enable bumblebeed.service

nouveau:
	sudo pacman -S --noconfirm xf86-video-nouveau mesa-vdpau \
	mesa-libgl xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)

ati-radeon:
	sudo pacman -S --noconfirm xf86-video-ati mesa-vdpau \
	mesa-libgl xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)

intel:
	sudo pacman -S --noconfirm xf86-video-intel libvdpau-va-gl \
	libva-intel-driver mesa-libgl xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)

virtualbox:
	sudo pacman -S --noconfirm virtualbox-guest-utils xorg-server xorg-xinit xorg-utils \
	xorg-server-utils mesa mesa-demos
	wget https://raw.githubusercontent.com/Kaero0/arch-installation/master/10-keyboard.conf
	sudo rm -f /etc/X11/xorg.conf.d/10-keyboard.conf
	sudo mv 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
	# Fonts and tricks to get HQ fonts
	sudo pacman -S --noconfirm ttf-dejavu font-mathematica ttf-freefont \
	ttf-liberation adobe-source-code-pro-fonts ttf-inconsolata ttf-droid \
	ttf-anonymous-pro ttf-bitstream-vera ttf-linux-libertine \
	ttf-ubuntu-font-family ttf-gentium noto-fonts artwiz-fonts \
	otf-fira-mono otf-fira-sans ttf-fira-mono ttf-fira-sans wqy-zenhei
	mkdir -p /home/$(USER_NAME)/.ttf-ms-fonts-folder
	cd /home/$(USER_NAME)/.ttf-ms-fonts-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/ttf-ms-fonts.tar.gz; tar zxf ttf-ms-fonts.tar.gz; cd ttf-ms-fonts; makepkg -cs; sudo pacman -U --noconfirm ttf-ms-font*.pkg.tar.xz; cd /home/$(USER_NAME)
	sudo ln -s /etc/fonts/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
	# Audio
	sudo pacman -S --noconfirm alsa-firmware pulseaudio pulseaudio-alsa \
	libcanberra-pulse alsa-plugins
	# GStreamer and more codecs
	sudo pacman -S --noconfirm gstreamer0.10 gstreamer0.10-plugins gstreamer \
	gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
	gst-plugins-ugly libmatroska ffmpeg ffmpeg2theora ffmpegthumbnailer \
	ffmpegthumbs xvidcore
	mkdir -p /home/$(USER_NAME)/.libde265-folder
	cd /home/$(USER_NAME)/.libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/libde265.tar.gz; tar zxf libde265.tar.gz; cd libde265; makepkg -cs; sudo pacman -U --noconfirm libde*.pkg.tar.xz; cd /home/$(USER_NAME)
	mkdir -p /home/$(USER_NAME)/.gst-plugin-libde265-folder
	cd /home/$(USER_NAME)/.gst-plugin-libde265-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/gst-plugin-libde265.tar.gz; tar zxf gst-plugin-libde265.tar.gz; cd gst-plugin-libde265; makepkg -cs; sudo pacman -U --noconfirm gst-plugin-libde*.pkg.tar.xz; cd /home/$(USER_NAME)



## Bug: Spanish keyboard does not work
## Not done yet
deepin:
	sudo pacman -S --noconfirm deepin deepin-movie deepin-music \
	deepin-screenshot deepin-terminal lightdm xdg-user-dirs transmission-gtk
	xdg-user-dirs-update
	## sudo echo can't be done in normal user
	sudo echo "" >> /etc/lightdm/lightdm.conf
	sudo echo "[SeatDefaults]" >> /etc/lightdm/lightdm.conf
	sudo echo "greeter-session=lightdm-deepin-greeter" >> /etc/lightdm/lightdm.conf
	sudo systemctl enable lightdm.service
	# Reboot
	sudo reboot

## Last version used: 3.18
gnome:
	sudo pacman -S --noconfirm gdm gnome-session gnome-shell gvfs-smb \
	gnome-shell-extensions adwaita-icon-theme dconf-editor eog eog-plugins \
	gnome-backgrounds gnome-calculator gnome-control-center gnome-desktop \
	gnome-disk-utility gnome-font-viewer gnome-screenshot gnome-terminal \
	gnome-settings-daemon gnome-system-log gnome-system-monitor gvfs-nfs \
	gnome-themes-standard gvfs gvfs-afc gvfs-goa gvfs-gphoto2 gvfs-mtp \
	mutter nautilus xdg-user-dirs-gtk simple-scan evince transmission-gtk \
	rhythmbox brasero file-roller gnome-packagekit gedit gedit-plugins \
	gedit-code-assistance gnome-calendar gnome-characters gnome-clocks \
	gnome-code-assistance gnome-chess gnome-color-manager gnome-logs \
	gnome-maps gnome-nettool gnome-sound-recorder gnome-sudoku \
	gnome-tweak-tool gnome-weather gnome-power-manager
	# Enable GDM (login screen)
	sudo systemctl enable gdm.service
	# Games folder
	gsettings set org.gnome.desktop.app-folders folder-children "['Utilities', 'Sundry', 'Games']"
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Games/ name 'Games'
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Games/ translate true
	gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/Games/ categories "['Game']"
	# Disable screen blocker
	gsettings set org.gnome.desktop.session idle-delay 0
	# Reboot
	sudo reboot

mate:
	sudo pacman -S --noconfirm xdg-user-dirs
	xdg-user-dirs-update
	sudo pacman -S --noconfirm mate mate-extra gnome-main-menu \
	mate-applet-lockkeys mate-applet-streamer mate-color-manager \
	mate-disk-utility lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
	sudo systemctl enable lightdm.service
	# Enable compositing
	dconf write /org/mate/marco/general/compositing-manager true
	mkdir -p /home/$(USER_NAME)/.compiz-folder
	cd /home/$(USER_NAME)/.compiz-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/compiz.tar.gz; tar zxf compiz.tar.gz; cd compiz; makepkg -cs; sudo pacman -U --noconfirm compi*.pkg.tar.xz; cd /home/$(USER_NAME)
	dconf write /org/mate/desktop/session/required-components/windowmanager "'compiz'"
	# Single-icon windows in panel
	mkdir -p /home/$(USER_NAME)/.mate-applet-dock-folder
	cd /home/$(USER_NAME)/.mate-applet-dock-folder; wget https://aur.archlinux.org/cgit/aur.git/snapshot/mate-applet-dock-git.tar.gz; tar zxf mate-applet-dock-git.tar.gz; cd mate-applet-dock-git; makepkg -cs; sudo pacman -U --noconfirm mate-applet-dock-*.pkg.tar.xz; cd /home/$(USER_NAME)
	# Hide desktop icons
	dconf write /org/mate/desktop/background/show-desktop-icons false
	# Use an elegant icon
	mkdir -p /home/$(USER_NAME)/.local/share/icons/
	wget -O arch-linux-good.svg http://cinderwick.ca/files/archlinux/artwork-official/symbol.svg
	mv arch-linux-good.svg /home/$(USER_NAME)/.local/share/icons/
	sudo cp /home/$(USER_NAME)/.local/share/icons/arch-linux-good.svg /usr/share/icons/
	dconf write /org/mate/panel/menubar/icon-name "'arch-linux-good'"
	# Arch icon to LightDM avatar
	wget -O arch-icon-mini.png http://vignette2.wikia.nocookie.net/en.linux/images/7/75/Arch-icon.png/revision/latest?cb=20100620154301
	sudo mv arch-icon-mini.png /usr/share/icons/
	# More apps for Mate
	sudo pacman -S --noconfirm clementine transmission-gtk xfburn
	# Reboot
	sudo reboot

## Not done yet
kde:
	sudo pacman -S --noconfirm kde kde-meta kde-l10n-es apper \
	kdeplasma-applets-plasma-nm
	sudo pacman -S --noconfirm transmission-qt
	sudo systemctl enable kdm.service
	# Reboot
	sudo reboot



apps:
	sudo pacman -S --noconfirm midori \
	flashplugin skype libreoffice-fresh libreoffice-fresh-es \
	pinta gparted mpv
	# Sensors
	sudo sensors-detect
	# Telegram
	wget -O telegram.tar.xz https://tdesktop.com/linux
	tar Jxvf telegram.tar.xz
	rm telegram.tar.xz
	mv Telegram ~/.telegram-folder
	~/.telegram-folder/Telegram
