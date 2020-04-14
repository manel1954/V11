#!/bin/bash
clear
while true
do
clear

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   **************************************************************************"
echo -n "${CIAN}"
echo "                              SCRIPT IRCDDBGATEWAY      "
echo -n "${ROJO}"
echo "                                  $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************************************"
echo ""
echo  "${CIAN}   1)${AMARILLO} Establecer idioma Español"
echo ""
echo  "${CIAN}   2)${AMARILLO} Set English language"
echo "\v\v"
echo "   ${ROJO}0) Salir/Exit"
echo "\v\v"
echo -n "\33[1;36m   Elige una opción/Choose an option: " 

read escoger_menu
case $escoger_menu in
1) echo ""
while true
do

                      
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        sed -i "1c Spanish" /home/pi/.local/status.ini
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;   
2) echo ""
while true
do

                      
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        sed -i "1c English" /home/pi/.local/status.ini
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;
0) echo ""
exit;;	
esac
done

