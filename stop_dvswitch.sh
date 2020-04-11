﻿#!/bin/bash

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
echo "                AL DESACTIVAR DVSWITCH SE REINICIARÁ EL SISTEMA               "
                           
echo "                            PARA GUARDAR LOS CAMBIOS                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	
echo "${CIAN}"
read -p '   Quieres Desactivar DVSWITCH? S/N ' seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' ];then 

cd /home/pi/Desktop
sudo cp Activar_dvswitch.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal -e sudo sh ejecutar_dvswitch.sh'" /home/pi/Activar_dvswitch.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DVSWITCH_OFF.png" /home/pi/Activar_dvswitch.desktop
sed -i "10c Name[es_ES]=Activar Dvswitch" /home/pi/Activar_dvswitch.desktop
cd /home/pi
sudo cp Activar_dvswitch.desktop /home/pi/Desktop
sudo rm /home/pi/Activar_dvswitch.desktop

sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service

sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service

sed -i "18c DVSWITCH=OFF" /home/pi/status.ini

echo "${BLANCO}"
echo "\v\v\v\v\v\v\v\v"
echo "   ***************************************************************************"
echo -n "${VERDE}"
echo "                           SE HA DESACTIVADO DVSWITCH                         "
echo -n "${ROJO}"                           
echo "                            SE REINICIARÁ EL SISTEMA                          "
echo -n "${BLANCO}"
echo "   ***************************************************************************"	
sleep 5
sudo reboot
else
echo "no desactiva"
fi
