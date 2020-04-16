#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_CLOSE.png

else
icono=ICONO_CERRAR.png

fi
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=ON" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMBM.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi/MMDVMHost
echo "\33[38;5;138m"
echo " ******************************************************************************"
echo " ************************    ABRIENDO BRANDMEISTER    *************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMBM MMDVMBM.ini

cd /home/pi/Desktop
cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=OFF" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMBM.desktop


