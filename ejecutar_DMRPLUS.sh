#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
cp Abrir_MMDVMPLUS.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_CERRAR.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "6c MMDVMPLUS=ON" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

cd /home/pi/MMDVMHost
echo "\33[1;37m"
echo " ******************************************************************************"
echo " ****************************    ABRIENDO DMR+    *****************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMPLUS MMDVMPLUS.ini

cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ABRIR.png" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "10c Name[es_ES]=DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sed -i "6c MMDVMPLUS=OFF" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMPLUS.desktop
