#!/bin/bash
sudo killall DMR2NXDN
sudo killall NXDNGateway

idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
 
else
icono=ICONO_ABRIR.png
fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2NXDN.desktop /home/pi
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_DMR2NXDN.sh'" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "10c Name[es_ES]=Abrir DMR2NXDN" /home/pi/Abrir_DMR2NXDN.desktop
sed -i "16c DMR2NXDN=OFF" /home/pi/.local/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_DMR2NXDN.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_DMR2NXDN.desktop

