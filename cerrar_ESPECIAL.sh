#!/bin/bash
sudo killall MMDVMESPECIAL
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
#sleep 1
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ESPECIAL_OFF.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=OFF" /home/pi/.local/status.ini
#sleep 1
cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
#sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop

