#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

#Colores 
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh cerrar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_SVXLINK_ON.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Cerrar SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=ON" /home/pi/.local
cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_svxlink.desktop

echo "${BLANCO}"
echo " ******************************************************************************"
echo " ***************************    ABRIENDO SVXLINK    ***************************"
echo " ******************************************************************************"
sleep 2



sudo svxlink

cd /home/pi/Desktop
sudo cp Abrir_svxlink.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_svxlink.sh'" /home/pi/Abrir_svxlink.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_SVXLINK_OFF.png" /home/pi/Abrir_svxlink.desktop
sed -i "10c Name[es_ES]=Abrir SVXLINK" /home/pi/Abrir_svxlink.desktop
sed -i "8c SVXLINK=OFF" /home/pi/.local
cd /home/pi
sudo cp Abrir_svxlink.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_svxlink.desktop