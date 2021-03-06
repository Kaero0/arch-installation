# arch-installation
Scripts to automate the installation and postinstallation of Arch Linux using my preferences.

We assume:
- 32 bits Intel CPU
- BIOS system
- Spanish language and keyboard
- sda disk
    - sda1 as /boot
    - sda2 as /
    - sda3 as swap

# Steps for installation

```sh
loadkeys es

wget -O archiso.sh https://bit.ly/1Q9QO2T #https://raw.githubusercontent.com/Kaero0/arch-installation/master/archiso.sh

## Replace "sda" to your case using: nano archiso.sh
sh archiso.sh

arch-chroot /mnt /bin/bash

## Replace "lajto" to your username in the two lines of useradd using: nano chroot.sh
wget -O chroot.sh https://bit.ly/1o2Lvfe #https://raw.githubusercontent.com/Kaero0/arch-installation/master/chroot.sh

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
wget -O Makefile https://bit.ly/1QXJZ9w #https://raw.githubusercontent.com/Kaero0/arch-installation/master/Makefile

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
sudo pacman -S infinality-bundle

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

# Graphical configuration (MATE apps)

Primero recuperamos todos nuestros antiguos de la copia de seguridad.

Centro de control:
- Configuración de la interfaz GTK+ de LigthDM >
    - Apariencia >
        - Tema: Blue-Submarine
        - Iconos: MATE
        - Tipo de letra: Noto Sans Regular 11
        - Activar "Imagen" y seleccionar: /usr/share/backgrounds/mate/desktop/Ubuntu-Mate-Cold-no-logo.png
        - Imagen predeterminada del usuario: /usr/share/icons/arch-icon-mini.png
    - Otros > Tiempo de espera hasta que se apague la pantalla: Nunca
- Combinaciones de teclas >
    - Añadir "Abrir terminal" con el comando "mate-terminal" y "Ctrl+Alt+T"
    - Añadir "Abrir Pluma" con el comando "pluma" y "Ctrl+Alt+P"
    - Añadir "Abrir Atom" con el comando "atom" y "Ctrl+Alt+A"
    - Añadir "Abrir Clementine" con el comando "clementine" y "Ctrl+Alt+C"
    - Añadir "Abrir Firefox" con el comando "firefox" y "Ctrl+Alt+F"
    - Añadir "Abrir Skype" con el comando "skype" y "Ctrl+Alt+S"
    - Añadir "Abrir Caja" con el comando "caja --no-desktop --browser /home/lajto" (cambiar "lajto") y "Ctrl+Alt+K"
    - Añadir "Abrir Telegram" con el comando "/home/lajto/.telegram-folder/Telegram" (cambiar "lajto") y "Ctrl+Alt+O"
    - Añadir "Abrir monitor del sistema" con el comando "mate-system-monitor" y "Ctrl+Alt+M"
- Gestor de energía > Poner la pantalla en reposo si está inactivo durante: Nunca
- Administrador de Opciones CompizConfig >
    - Activar "MATE Compatibility"
    - Opciones generales > Tamaño de escritorio: 3 en horizontal y 3 en vertical
    - Desktop Wall > Viewport Switch Preview > Switch Target Preview Visibility Time > 
    - Animations: Poner "Fade" de 100s en abrir y cerrar ventanas
    - Colocar ventanas > General > Modo de Posicionamiento: Centrado
- Apariencia >
    - Tema > Activar "Blue-Submarine" > Personalizar... > Puntero: Adwaita
    - Fondo > Establecer uno
    - Tipografías >
        - Cambiar todas a Noto Sans, salvo la última a Source Code Pro Regular
        - Cambiar todos los tamaños de 10 a 11
- Salvapantallas >
    - Desactivar "Activar el salvapantallas cuando el equipo esté activo"
    - Desactivar "Bloquear pantalla cuando el salvapantallas esté activo"
- Acerca de mí > Establecer avatar
- Aplicaciones preferidas >
    - Multimedia >
        - Visor de imágenes: Eye of MATE
        - Reproductor multimedia: MPV
    - Sistema >
        - Editor de textos: Pluma
        - Gestor de ficheros: Caja

Interfaz:
- Click derecho en el panel de abajo > Eliminar este panel
- Click derecho en el panel de arriba > Panel nuevo
- Click derecho en el panel de abajo > Propiedades > Tamaño: 38px
- Click derecho a la izquierda del todo del panel de abajo > Añadir al panel... > Barra de menú (bloquear al panel)
    - Inmediatamente a la derecha de "Barra de menú", añadir "Dock" (bloquear al panel)
        - Activar "display an indicator for each open window"
        - Establecer permanentemente: Firefox, Telegram, Skype, Clementine, Atom, Pluma, Caja
- Click derecho a la derecha del todo del panel de abajo > Añadir al panel... > Reloj (bloquear al panel)
    - Inmediatamente a la izquierda de "Reloj", añadir "Ojos" (bloquear al panel)
    - Inmediatamente a la izquierda de "Ojos", añadir "Selector de áreas de trabajo" (bloquear al panel)
    - Inmediatamente a la izquierda de "Selector de áreas de trabajo", añadir "Hardware Sensors Monitor" (bloquear al panel)
        - Establecer los sensores deseados; yo prefiero los núcleos del procesador, la tarjeta gráfica y el disco duro
    - Inmediatamente a la izquierda de "Hardware Sensors Monitor", añadir "Área de notificación" (bloquear al panel)
        - Preferencias de sonido >
            - Efectos de sonido > Tema de sonido: Default
            - Configurar entrada y salida
- Click derecho en el panel de arriba > Eliminar este panel

Pluma:
- Ver > Activar todo
- Editor >
    - Ancho del tabulador: 4
    - Activar "Insertar espacios en lugar de tabuladores"
    - Activar "Activar sangría automática"
- Complementos: Desactivar "Corrector ortográfico"

Caja:
- Preferencias > Vistas > Nivel de ampliación para la vista de iconos: 150% (hacerlo también desde la interfaz)

Terminal de MATE:
- Preferencias del perfil > General > Desactivar "Mostrar la barra de menús en las terminales nuevas por omisión"

Transmission:
- Descargas > Guardar en la ubicación: Descargas/Torrents

Clementine:
- Preferencias >
    - Comportamiento >
        - Desactivar "Mostrar icono en el área de notificación"
        - Desactivar "Seguir ejecutando el programa en el fondo al cerrar la ventana"
    - Colección musical > Añadir la carpeta de música
    - Apariencia > Activar "Carátula del álbum"
    - Notificaciones > Activar "Desactivado"
- Click derecho en la lista lateral izquierda > Opciones de visualización > Agrupar por > Género/Álbum

# Graphical configuration (GNOME apps)

GNOME:
- Buscar > Desactivar todo
- Fondo > Poner el deseado
- Privacidad > Bloqueo de pantalla: Apagado; Uso e histórico > Desactivar "Usados recientemente"
- Región e idioma > Todo en español
- Energía > Apagar la pantalla: Nunca
- Teclado > Atajos >
    - Escritura > Tecla de composición: Ctrl derecho
    - Combinación personalizada > Añadir terminal (comando: gnome-terminal) con Ctrl+Alt+T
- Compartir > Nombre del equipo: fedora-pc
- Detalles > Elegir las aplicaciones predeterminadas deseadas
- Fecha y hora: Todo automático
- Usuarios > Poner avatar

Herramienta de retoques:
- Apariencia > Activar "Tema oscuro global"
- Barra superior > Activar "Mostrar la fecha"
- Teclado y ratón > Desactivar "Pegar al pulsar con el botón central"
- Tipografías > Monoespaciada: Source Code Pro Regular; Hinting: Slight; Alisado: Rgba
- Áreas de trabajo > Creación de áreas de trabajo: Estática; Número de áreas de trabajo: 7

Instalar desde Firefox las siguientes extensiones:
- https://extensions.gnome.org/extension/55/media-player-indicator/
- https://extensions.gnome.org/extension/495/topicons/
- https://extensions.gnome.org/extension/841/freon/

Nautilus > Preferencias:
- Vistas > Activar "Colocar las carpetas antes que los archivos"
- Comportamiento > Activar "Preguntar cada vez"

GNOME Terminal:
- Preferencias > General > Desactivar "Mostrar la barra de menús en las terminales nuevas por omisión"

Meteorología:
- Añadir: Madrid, España (o donde vivas)
- Unidad de temperatura > Activar "Celsius"

Gedit:
- Preferencias >
    - Ver > Activar todo menos "Mostrar mapa de vista previa" y "Resaltar parejas de corchetes"
    - Editor > Anchura del tabulador: 4; activar "Insertar espacios en lugar de tabuladores" y "Activar sangría automática"
    - Tipografías y colores >
        - Source Code Pro Regular 12
        - Oblivion
    - Complementos: Desactivar "Corrector ortográfico" y activar "Selector de color"
- Maximizar la ventana
- Ver > Activar "Panel lateral"
- Ajustar panel lateral para que el código quede en el centro

Rhythmbox >
- Complementos > Dejar activado sólo: Búsqueda de arte de portada, Interfaz de MediaServer2 D-Bus, Interfaz de MPRIS D-Bus y Visualización
- Preferencias >
    - General > Activar "Géneros, artistas y álbumes"
    - Música > Activar "Vigilar mi fonoteca en busca de archivos nuevos"

# Rest of the apps

LibreOffice Writer >
- Activar "Vista de página individual"
- Herramientas > Desactivar "Revisión ortográfica automática"
- Herramientas > Opciones... > LibreOffice Writer > Fuentes básicas (occidentales) > Poner todo en Noto Sans

Telegram:
- Cambiar a español
- Desactivar "Mostrar la vista previa del mensaje"
- Desactivar "Mostrar el icono"
- Desactivar "Reemplazar emojis"

Skype:
- Mensajería instantánea > Desactivar "Mostrar emoticonos"
- Dispositivos de sonido > Desactivar "Permitir que Skype ajuste automáticamente mis niveles de mezclado"
