#!/bin/bash


sudo su | ps aux | grep dvrptr.exe | grep -v grep | awk '{print $2}' | xargs kill

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
cp Abrir_Dvrptr.desktop /home/pi
sleep 1
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_dvrptr.sh'" /home/pi/Abrir_Dvrptr.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/ICONO_DVRPTR_OFF.png" /home/pi/Abrir_Dvrptr.desktop
sed -i "11c Name[es_ES]=Abrir Dvrptr" /home/pi/Abrir_Dvrptr.desktop
sed -i "20c DVRPTR=OFF" /home/pi/status.ini

sleep 1
cd /home/pi
cp Abrir_Dvrptr.desktop /home/pi/Desktop
sudo killall Main
sleep 1
sudo rm /home/pi/Abrir_Dvrptr.desktop
