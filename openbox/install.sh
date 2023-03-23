#!/usr/bin/bash


###############################################
#Install Openbox and basic apps on Arch Linux #
#or Arch Linux based distros.                 #
###############################################

#Update system
sudo pacman -Syy;

#Install main Openbox files and additional apps
sudo pacman -S openbox xorg-server xorg-xinit xorg-xset alsa-utils pulseaudio-bluetooth bluez bluez-utils blueman git vim kitty obconf lxappearance-obconf menumaker tint2 firefox pcmanfm zip unzip xarchiver feh udisks2 udiskie numlockx wmctrl xdotool;

#Install yay
cd $HOME;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;
cd $HOME/;
sudo rm -r yay;

#Install apps from AUR
yay -S orage;
yay -S ttf-fira-code;

#Change Grub timeout to 0
sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub;
sudo grub-mkconfig -o /boot/grub/grub.cfg;

#Configure bluetooth
sudo sed -i 's/#AutoEnable=true/AutoEnable=true/g' /etc/bluetooth/main.conf;
sudo systemctl enable bluetooth.service;

#Reconfigure Openbox menu
mmaker -vf OpenBox3;

#Create .xinitrc
echo '#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec openbox-session' > ~/.xinitrc;


#Startx automatically
echo '#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc


if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
. startx
logout
fi' > ~/.bash_profile;

#Create config folders
cd $HOME/.config;
sudo mkdir -p wallpapers;
sudo mkdir -p tint2/executors/icons/;
sudo mkdir -p orage;
sudo mkdir -p openbox;
sudo mkdir -p gtk-3.0;
sudo mkdir -p gtk-2.0;
sudo mkdir -p kitty;

#Download config files
cd wallpapers;
sudo wget -O cat-waves.png https://raw.githubusercontent.com/tscabral1/dotfiles/main/wallpapers/cat-waves.png;
cd $HOME/.config/tint2;
sudo wget -O tint2rc https://raw.githubusercontent.com/tscabral1/dotfiles/main/tint2/tint2rc;
cd executors;
sudo wget -O volume https://raw.githubusercontent.com/tscabral1/dotfiles/main/tint2/executors/volume;
sudo chmod 777 volume;
cd icons;
sudo wget -O audio-volume-high.svg https://raw.githubusercontent.com/tscabral1/dotfiles/0a0d4b1f74df83ba8fd501f7111cf79b4307375d/tint2/executors/icons/audio-volume-high.svg;
sudo wget -O audio-volume-low.svg https://raw.githubusercontent.com/tscabral1/dotfiles/0a0d4b1f74df83ba8fd501f7111cf79b4307375d/tint2/executors/icons/audio-volume-low.svg;
sudo wget -O audio-volume-medium.svg https://raw.githubusercontent.com/tscabral1/dotfiles/0a0d4b1f74df83ba8fd501f7111cf79b4307375d/tint2/executors/icons/audio-volume-medium.svg;
sudo wget -O audio-volume-muted.svg https://raw.githubusercontent.com/tscabral1/dotfiles/0a0d4b1f74df83ba8fd501f7111cf79b4307375d/tint2/executors/icons/audio-volume-muted.svg;
sudo wget -O battery.png https://raw.githubusercontent.com/tscabral1/dotfiles/main/tint2/executors/icons/battery.png;
cd $HOME/.config/orage;
sudo wget -O oragerc https://raw.githubusercontent.com/tscabral1/dotfiles/main/orage/oragerc;
cd $HOME/.config/openbox;
sudo wget -O autostart https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/autostart;
sudo wget -O rc.xml https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/rc.xml;
cd $HOME/.config/gtk-3.0;
sudo wget -O settings.ini https://raw.githubusercontent.com/tscabral1/dotfiles/main/gtk-3.0/settings.ini;
cd $HOME/.config/gtk-2.0;
sudo wget -O gtkfilechooser.ini https://raw.githubusercontent.com/tscabral1/dotfiles/main/gtk-2.0/gtkfilechooser.ini;
cd $HOME/.config;
sudo wget -O libinput-gestures.conf https://raw.githubusercontent.com/tscabral1/dotfiles/main/libinput-gestures.conf;
cd $HOME/.config/kitty;
sudo wget -O kitty.conf https://raw.githubusercontent.com/tscabral1/dotfiles/main/kitty/kitty.conf;
cd $HOME;
sudo wget -O .gtkrc-2.0 https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/.gtkrc-2.0;


#Run postinstall.sh
cd $HOME;
wget https://raw.githubusercontent.com/tscabral1/dotfiles/main/openbox/postinstall.sh;
sudo bash postinstall.sh
