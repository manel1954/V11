#!/bin/bash
sudo killall MMDVMBM
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)


sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_bm.sh'" /home/pi/Desktop/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_BM_OFF.png" /home/pi/Desktop/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=abriri BM" /home/pi/Desktop/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=OFF" /home/pi/.local/status.ini

p



