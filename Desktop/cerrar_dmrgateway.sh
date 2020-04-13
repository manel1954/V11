#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

cd /home/repeater/Desktop
sudo cp Abrir_DMRGateway.desktop /home/repeater/
sleep 1
sed -i "4c Exec=sh -c 'cd /home/repeater/$SCRIPTS_version; lxterminal --geometry=72x15 -e sudo sh ejecutar_DMRGateway_V8.sh'" /home/repeater/Abrir_DMRGateway.desktop
sed -i "5c Icon=/home/repeater/$SCRIPTS_version/DMRGateway_OFF.png" /home/repeater/Abrir_DMRGateway.desktop
sed -i "10c Name[es_ES]=Open DMRGateway" /home/repeater/Abrir_DMRGateway.desktop
sed -i "5c DMRGateway=OFF" /home/repeater/status.ini
sleep 1
cd /home/repeater/
sudo cp Abrir_DMRGateway.desktop /home/repeater/Desktop
sleep 1
sudo rm /home/repeater/Abrir_DMRGateway.desktop
sudo killall MMDVMHost &
sudo killall DMRGateway