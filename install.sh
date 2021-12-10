

echo 'Install type? [kiosk|server|media]'

[//]: # (common installs)
apt install vim
apt install 

[//]: # (if kiosk)
apt-get --no-install-recommends install xserver-xorg xserver-xorg-video-fbdev xinit pciutils xinput xfonts-100dpi xfonts-75dpi xfonts-scalable chromium
