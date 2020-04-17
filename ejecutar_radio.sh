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
sudo cp Abrir_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Cerrar Radio" /home/pi/Abrir_Radio.desktop
sed -i "5c MMDVM=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_Radio.desktop

cd /home/pi/MMDVMHost
clear
echo "\33[1;36m"
echo " ******************************************************************************"
echo " ***************************    ABRIENDO RADIO    *****************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMHost MMDVM.ini

cd /home/pi/Desktop
sudo cp Abrir_Radio.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_radio.sh'" /home/pi/Abrir_Radio.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono_NO" /home/pi/Abrir_Radio.desktop
sed -i "10c Name[es_ES]=Abrir Radio" /home/pi/Abrir_Radio.desktop
sed -i "5c MMDVM=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_Radio.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_Radio.desktop

