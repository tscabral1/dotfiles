#!/usr/bin/bash


###############################################
#Install Openbox and basic apps on Arch Linux #
#or Arch Linux based distros.                 #
###############################################

#Configure touchpad tap
sudo echo 'Section "InputClass"
Identifier "touchpad"
Driver "libinput"
  MatchIsTouchpad "on"
  Option "Tapping" "on"
  Option "ClickMethod" "buttonareas"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf;

#Autologin
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d;
sudo echo '[Service]
Type=simple
ExecStart=
ExecStart=-/sbin/agetty --autologin thiago --noclear %I 38400 linux' > /etc/systemd/system/getty@tty1.service.d/override.conf;

#Install theme
cd /usr/share/themes;
sudo wget https://github.com/tscabral1/dotfiles/releases/download/catppuccin-theme-openbox/catppuccin-theme.tar.gz;
sudo tar -xzvf catppuccin-theme.tar.gz;
sudo rm -r catppuccin-theme.tar.gz;

#Install icon set
cd /usr/share/icons;
sudo wget https://github.com/tscabral1/dotfiles/releases/download/catppuccin-papirus-icons-openbox/catppuccin-papirus-icons.tar.gz;
sudo tar -xzvf catppuccin-papirus-icons.tar.gz;
sudo rm -r catppuccin-papirus-icons.tar.gz
