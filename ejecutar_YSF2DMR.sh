#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_CLOSE.png
icono_NO=ICONO_OPEN.png

else
icono=ICONO_CERRAR.png
icono_NO=ICONO_ABRIR.png

fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_YSF2DMR.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version/;sudo sh cerrar_YSF2DMR.sh'" /home/pi/Abrir_YSF2DMR.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_YSF2DMR.desktop
sed -i "10c Name[es_ES]=Cerrar YSF2DMR" /home/pi/Abrir_YSF2DMR.desktop
sed -i "14c YSF2DMR=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_YSF2DMR.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_YSF2DMR.desktop

cd /home/pi/YSF2DMR
sudo lxterminal --geometry=80x12 -e ./YSF2DMR YSF2DMR.ini & 
sleep 2
cd /home/pi/MMDVMHost
sudo ./MMDVMFUSION MMDVMFUSION.ini

# Cierra el icono Abrir Solo Dstar si no hay conexión 
cd /home/pi/Desktop
sudo cp Abrir_YSF2DMR.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version/;lxterminal --geometry=80x20 -e sudo sh ejecutar_YSF2DMR.sh'" /home/pi/Abrir_YSF2DMR.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono_NO" /home/pi/Abrir_YSF2DMR.desktop
sed -i "10c Name[es_ES]=Abrir YSF2DMR" /home/pi/Abrir_YSF2DMR.desktop
sed -i "14c YSF2DMR=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_YSF2DMR.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_YSF2DMR.desktop

