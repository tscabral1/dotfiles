#Install trackpad gestures
cd;
git clone https://github.com/bulletmark/libinput-gestures.git;
cd libinput-gestures;
sudo ./libinput-gestures-setup install;
cd;
sudo rm -r libinput-gestures;
sudo gpasswd -a $USER input;
newgrp input;
libinput-gestures-setup desktop autostart start status
