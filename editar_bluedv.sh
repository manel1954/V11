#!/bin/bash
clear
while true
do
clear

# path usuario
usuario=/home/pi
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   ********************************************************************"
echo -n "${CIAN}"
echo "                    Editar fichero .ini de configuración BlueDV    "
echo -n "${ROJO}"
echo "                               $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ********************************************************************"
echo ""
echo "\33[1;36m   1)\33[0m Puerto para DVMEGA pinchado en Raspberri PI (ttyAMA0)\33[1;33m"
echo "\33[1;36m   2)\33[0m Puerto para DVMEGA doble banda pinchado en arduino (ttyACM0)\33[1;33m"
echo "\33[1;36m   3)\33[0m Puerto para DVMEGA doble banda pinchado en arduino (ttyACM1)\33[1;33m"
echo "\33[1;36m   4)\33[0m Puerto para DVMEGA + Bluestack Raspberry Pi(ttyUSB0)\33[1;33m"
echo -n "                                            - "
var1= sed -n '4p'  /home/pi/bluedv/BlueDVconfig.ini
echo ""
echo "\33[1;36m   5)\33[1;33m Abrir fichero .ini para hacer cualquier cambio\33[1;33m"
echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
case $escoger_menu in

1) echo ""
while true
do
           	          
                        act=S 
                        case $act in
		            [sS]* ) echo ""
                        sed -i "4c comport=/dev/ttyAMA0" /home/pi/bluedv/BlueDVconfig.ini
		            break;;
		            [nN]* ) echo ""
		            break;;
esac
done;;
2) echo ""
while true
do
           	          
                        act=S 
                        case $act in
		            [sS]* ) echo ""
                        sed -i "4c comport=/dev/ttyACM0" /home/pi/bluedv/BlueDVconfig.ini
		            break;;
		            [nN]* ) echo ""
		            break;;
esac
done;;
3) echo ""
while true
do          	          
                        act=S 
                        case $act in
		            [sS]* ) echo ""
                        sed -i "4c comport=/dev/ttyACM1" /home/pi/bluedv/BlueDVconfig.ini
		            break;;
		            [nN]* ) echo ""
		            break;;
esac
done;;
4) echo ""
while true
do
                        act=S 
                        case $act in
		            [sS]* ) echo ""
                        sed -i "4c comport=/dev/ttyUSB0" /home/pi/bluedv/BlueDVconfig.ini
		            break;;
		            [nN]* ) echo ""
		            break;;
esac
done;;
5) echo ""
while true
do
                              actualizar=S 
                              case $actualizar in
                                    [sS]* ) echo ""
                              geany /home/pi/bluedv/BlueDVconfig.ini
                                    break;;
                                    [nN]* ) echo ""
                                    break;;
esac
done;;
0) echo ""
clear
echo "   **************************************************"
echo "   *                                                *"
echo "   *     CERRANDO SCRIPT                            *"
echo "   *                                                *"
echo "   **************************************************"
sleep 1
clear
exit;;	
esac
done

