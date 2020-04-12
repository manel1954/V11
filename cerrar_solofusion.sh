#!/bin/bash
sudo killall MMDVMFUSION
sudo killall YSFGateway
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solofusion.desktop /home/pi

sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version/;lxterminal --geometry=80x15 -e sudo sh ejecutar_solofusion.sh'" /home/pi/Abrir_solofusion.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_YSF.png" /home/pi/Abrir_solofusion.desktop
sed -i "11c Name[es_ES]=Abrir solo FUSION" /home/pi/Abrir_solofusion.desktop
sed -i "12c SOLOFUSION=OFF" /home/pi/.local

cd /home/pi
sudo cp Abrir_solofusion.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solofusion.desktop


