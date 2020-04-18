#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
advertencia="WARNING!!"
al_activar="ACTIVATING DVSWITCH WILL RESTART THE SYSTEM"
guardar_cambios="TO SAVE CHANGES"
activado="DVSWITCH HAS BEEN DISABLED"
reinicio="THE SYSTEM WILL RESTART"
quieres="Do you want to Deactivate DVSWITCH? Y/N"

else
icono=ICONO_ABRIR.png
advertencia="ADVERTENCIA!!"
al_activar="AL ACTIVAR DVSWITCH SE REINICIARÁ EL SISTEMA"
guardar_cambios="PARA GUARDAR LOS CAMBIOS"
activado="SE HA DESACACTIVADO DVSWITCH"
reinicio="SE REINICIARÁ EL SISTEMA"
quieres="Quieres Desactivar DVSWITCH? S/N"
fi

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  $advertencia                               "
echo ""
echo -n "${ROJO}"
echo "                   $al_activar               "
                           
echo "                            $guardar_cambios                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	
echo "${CIAN}"
echo -n "   $quieres "
read seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' -o "$seguir" = 'Y' -o "$seguir" = 'y' ];then 

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

sed -i "18c DVSWITCH=OFF" /home/pi/.local/status.ini

clear
echo "${BLANCO}"
echo "\v\v\v\v\v\v\v\v"
echo "   ***************************************************************************"
echo -n "${VERDE}"
echo "                           $activado                            "
echo -n "${ROJO}"                           
echo "                           $reinicio                           "
echo -n "${BLANCO}"
echo "   ***************************************************************************"	
sleep 5
sudo reboot
else
echo "no desactiva"
fi
