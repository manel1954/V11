#!/bin/bash
sudo killall MMDVMDMRGATEWAY
sudo killall DMRGateway
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_dmrgateway.desktop /home/pi/
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/V11; lxterminal --geometry=72x20 -e sudo sh ejecutar_dmrgateway.sh'" /home/pi/V11/Abrir_dmrgateway.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ABRIR.png" /home/pi/Abrir_dmrgateway.desktop
sed -i "10c Name[es_ES]=Open DMRGateway" /home/pi/Abrir_dmrgateway.desktop
sed -i "19c DMRGateway=OFF" /home/pi/.local/status.ini
sleep 1
cd /home/pi/
sudo cp Abrir_dmrgateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dmrgateway.desktop
