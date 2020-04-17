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
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Cerrar Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=ON" /home/pi/.local/status.ini

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
#sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop

cd /home/pi/MMDVMHost
#Colores 
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${AMARILLO}"
echo " ******************************************************************************"
echo " **************************    ABRIENDO ESPECIAL    ***************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMESPECIAL MMDVMESPECIAL.ini

cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono_NO" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop

sed -i "10c MMDVMESPECIAL=OFF" /home/pi/.local/status.ini

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop
