#!/bin/bash

while true
do
clear
usuario="/home/pi"
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
echo "${VERDE}"
echo "   ************************************************************************"
echo -n "${CIAN}"
echo "                      Script para Configuración de red    "
echo -n "${ROJO}"
echo "                              $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ************************************************************************"
#echo "\33[1;36m   1)\33[1;37m Actualizar imagen"
echo "\33[1;36m   1)${BLANCO} Configurar ip fija por cable"
echo ""
echo "\33[1;36m   ${AMARILLO}   Para configurar ip fija por Wifi se debe de utilizar el icono"
echo "      superior derecho y elegir Editar conexiones...."
echo ""

echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
1) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear

                        echo "${VERDE}"
                        echo "   ************************************************************************" 
                        echo "                   SCRIPT PARA ESTABLECER IP FIJA POR CABLE               "
                        echo "   ************************************************************************"
                        
                        echo "${CIAN}"
                        echo "   Introduce la ip que quires fijar: ${AMARILLO}Ejp.192.168.1.15 ${BLANCO}"
                        echo -n "   "
                        read ip

                        echo "${CIAN}"
                        echo "   Introduce la ip del router: ${AMARILLO}Ejp.192.168.1.1 ${BLANCO}"
                        echo -n "   "
                        read gateway
                        
                        echo "${BLANCO}"
                        echo "   REVISA SI SON CORRECTOS LOS DATOS INTRODUCIDOS"
                        echo "   =============================================="

                        echo "${CIAN}"
                        read -p '   Quieres grabar los datos? S/N ' seguir   
                        if [ "$seguir" = 'S' -o "$seguir" = 's' ];then 
                        
                        sudo sed -i "10c iface eth0 inet static" /etc/network/interfaces
                        sudo sed -i "11c address $ip" /etc/network/interfaces
                        sudo sed -i "12c netmask 255.255.255.0" /etc/network/interfaces
                        sudo sed -i "13c gateway $gateway" /etc/network/interfaces
                        sudo sed -i "14c #" /etc/network/interfaces
                        sudo sed -i "15c #" /etc/network/interfaces

                        clear
                        echo "\v\v\v\v\v\v\v\v\v\v\v"
                        echo "${VERDE}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************       GRABANDO IP FIJA       *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
                        else
                        clear
                        echo "\v\v\v\v\v\v\v\v\v\v\v"
                        echo "${ROJO}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************   NO SE GRABARON LOS DATOS   *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
                        fi
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
0) 
clear
echo "\v\v\v\v\v\v\v\v\v\v\v"
echo "${AMARILLO}"
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "   *                          CERRANDO SCRIPT                             *"
echo "   *                                                                      *"
echo "   ************************************************************************"
sleep 2
clear
exit;;	
esac
done
