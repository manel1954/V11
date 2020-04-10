#!/bin/bash
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${ROJO}"
echo "                  ******************************************"
echo "                  *        ESTO DESACTIVARÁ D-STAR         *"
echo "                  *              EN DVSWITCH               *"
echo "                  ******************************************"
sleep 3
clear
echo "${VERDE}"
clear
echo "                  ***********************************************"
echo "                  *            ABRIENDO dstarrepeater           * "
echo "                  ***********************************************"
cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_ON.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Cerrar ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDB.desktop

cd /home/pi/Desktop
sudo cp Abrir_dstarrepeater.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dstarrepeater.sh'" /home/pi/Abrir_dstarrepeater.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/REPEATER_ON.png" /home/pi/Abrir_dstarrepeater.desktop
sed -i "10c Name[es_ES]=Cerrar DSTAR Repeater" /home/pi/Abrir_dstarrepeater.desktop
sed -i "9c dstarrepeater=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_dstarrepeater.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dstarrepeater.desktop

# Pone Enable=0 en [Dstar Network]
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/brandmeister_esp.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/dmrplus.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/especial.ini

sudo systemctl stop ircddbgateway
sudo systemctl restart mmdvm_bridge.service

 

