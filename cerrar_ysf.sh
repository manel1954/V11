#!/bin/bash
sudo killall YSFGateway
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_YSF.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_ysf.sh'" /home/pi/Abrir_YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/C4FM.png" /home/pi/Abrir_YSF.desktop
sed -i "10c Name[es_ES]=Abrir YSF" /home/pi/Abrir_YSF.desktop
sed -i "3c YSF=OFF" /home/pi/status.ini
cd /home/pi
sleep 1
sudo cp Abrir_YSF.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_YSF.desktop