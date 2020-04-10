#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
cp Abrir_Dvrptr.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dvrptr.sh'" /home/pi/Abrir_Dvrptr.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/ICONO_DVRPTR_ON.png" /home/pi/Abrir_Dvrptr.desktop
sed -i "11c Name[es_ES]=cerrar Dvrptr" /home/pi/Abrir_Dvrptr.desktop
sed -i "20c DVRPTR=ON" /home/pi/status.ini

cd /home/pi
cp Abrir_Dvrptr.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_Dvrptr.desktop
cd /home/pi/dvrptr
mono dvrptr.exe
 

