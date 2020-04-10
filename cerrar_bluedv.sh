#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_bluedv.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BLUEDV_OFF.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Abrir BlueDV" /home/pi/Abrir_BlueDV.desktop
sed -i "2c BlueDV=OFF" /home/pi/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_BlueDV.desktop

sudo su | ps aux | grep BlueDV.exe | grep -v grep | awk '{print $2}' | xargs kill

 
