#!/bin/bash
sudo killall svxlink
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_SVXLINK_OFF.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Abrir SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=OFF" /home/pi/.local

cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_svxlink.desktop



