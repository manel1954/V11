#!/bin/bash
sudo killall DMR2YSF
sudo killall YSFGateway
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2YSF.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_DMR2YSF.sh'" /home/pi/Abrir_DMR2YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2YSF_OFF.png" /home/pi/Abrir_DMR2YSF.desktop
sed -i "10c Name[es_ES]=Abrir DMR2YSF" /home/pi/Abrir_DMR2YSF.desktop
sed -i "15c DMR2YSF=OFF" /home/pi/.local

cd /home/pi
sudo cp Abrir_DMR2YSF.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2YSF.desktop