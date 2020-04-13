#!/bin/bash

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  ADVERTENCIA!!                               "
echo ""
echo -n "${ROJO}"
echo "                   AL ACTIVAR DVSWITCH SE REINICIARÁ EL SISTEMA               "
                           
echo "                            PARA GUARDAR LOS CAMBIOS                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	

echo "${CIAN}"
read -p '   Quieres activar DVSWITCH? S/N ' seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' ];then 

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal -e sudo sh stop_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_ON.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Desactivar Dvswitch" /home/pi/Activar_dvswitch.desktop


sed -i "18c DVSWITCH=ON" /home/pi/.local/status.ini

cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl restart ysfgateway.service
sudo systemctl restart dmr2ysf.service

sudo systemctl restart analog_bridge.service
sudo systemctl restart ircddbgateway.service
sudo systemctl restart md380-emu.service
sudo systemctl restart mmdvm_bridge.service
sudo systemctl restart nxdngateway.service

clear
echo "${BLANCO}"
echo "\v\v\v\v\v\v\v\v"
echo "   ***************************************************************************"
echo -n "${VERDE}"
echo "                           SE HA ACTIVADO DVSWITCH                            "
echo -n "${ROJO}"                           
echo "                           SE REINICIARÁ EL SISTEMA                           "
echo -n "${BLANCO}"
echo "   ***************************************************************************"	
sleep 5
sed -i "18c DVSWITCH=ON" /home/pi/.local/status.ini
sudo reboot	
else
echo "no lo activa"
fi
				