#!/bin/bash
sudo killall NXDNGateway

idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
 
else
icono=ICONO_ABRIR.png
fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_NXDN.desktop /home/pi

sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_NXDN.sh'" /home/pi/Abrir_NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_NXDN.desktop
sed -i "10c Name[es_ES]=Abrir NXDN" /home/pi/Abrir_NXDN.desktop
sed -i "17c NXDN=OFF" /home/pi/.local/status.ini

cd /home/pi
sudo cp Abrir_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_NXDN.desktop

