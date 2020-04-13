#!/bin/bash
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

# SCRIPTS_version=$(awk "NR==1" /home/repeater/.config/autostart/version)

# cd /home/repeater/Desktop
# sudo cp Abrir_DMRGateway.desktop /home/repeater
# sed -i "4c Exec=sh -c 'cd /home/repeater/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh cerrar_DMRGateway_V8.sh'" /home/repeater/Abrir_DMRGateway.desktop
# sed -i "5c Icon=/home/repeater/$SCRIPTS_version/DMRGateway_ON.png" /home/repeater/Abrir_DMRGateway.desktop
# sed -i "10c Name[es_ES]=Close DMRGateway" /home/repeater/Abrir_DMRGateway.desktop
# sed -i "5c DMRGateway=ON" /home/repeater/status.ini
# cd /home/repeater
# sudo cp Abrir_DMRGateway.desktop /home/repeater/Desktop
# sleep 1
# sudo rm /home/repeater/Abrir_DMRGateway.desktop

# cd /home/repeater/V8/
# sudo sh cerrar_MMDVM_V8.sh

#sed -i "149c Address=127.0.0.1" /home/repeater/MMDVMHost/MMDVM.ini
#sed -i "150c Port=62031" /home/repeater/MMDVMHost/MMDVM.ini
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
sudo ./MMDVMHost MMDVMBM.ini 
