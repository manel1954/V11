#!/bin/bash
sudo killall MMDVMESPECIAL

idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
 
else
icono=ICONO_ABRIR.png
fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=OFF" /home/pi/.local/status.ini

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ESPECIAL.desktop


