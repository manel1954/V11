#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
cd /home/pi/Desktop
sudo cp Abrir_dmrgateway.desktop /home/pi/
sleep 1
sed -i "4c Exec=sh -c 'cd /home/pi/V11; lxterminal --geometry=72x20 -e sudo sh cerrar_dmrgateway.sh'" /home/pi/V11/Abrir_dmrgateway.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_CERRAR.png" /home/pi/Abrir_dmrgateway.desktop
sed -i "10c Name[es_ES]=DMR Gateway" /home/pi/Abrir_dmrgateway.desktop
sed -i "19c DMRGateway=OFF" /home/pi/.local/status.ini
sleep 1
cd /home/pi/
sudo cp Abrir_dmrgateway.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_dmrgateway.desktop

echo "${VERDE}"
echo "***********************************************"
echo "*             Opening DMRGateway             *"
echo "***********************************************"
echo ""
echo "                   And                         "
echo

echo "${AMARILLO}"
echo "***********************************************"
echo "*             Opening MMDVM                  *"
echo "***********************************************"

sleep 4

echo "${GRIS}"

cd /home/pi/DMRGateway
sudo ./DMRGateway DMRGateway.ini &

sleep 2

cd /home/pi/MMDVMHost
sudo ./MMDVMDMRGATEWAY DMRGateway.ini 
