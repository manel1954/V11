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
echo "                    SCRIPT PARA CONFIGURAR IRCDDBGATEWAY      "
echo -n "${ROJO}"
echo "                                  $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************************************"

echo -n "${CIAN}   1)${GRIS} Modificar indicativo  - ${AMARILLO}"
contenido_indicativo=$(awk "NR==2" /etc/ircddbgateway)
indicativo=${contenido_indicativo#*=}

echo "$indicativo"

echo -n "${CIAN}   2)${GRIS} Modificar Ciudad      - ${AMARILLO}"
contenido_ciudad=$(awk "NR==10" /etc/ircddbgateway)
ciudad=${contenido_ciudad#*=}
echo "$ciudad"

echo -n "${CIAN}   3)${GRIS} Modificar Reflector   - ${AMARILLO}"
contenido_reflector=$(awk "NR==18" /etc/ircddbgateway)
sala=${contenido_reflector#*=}
echo "$sala"

echo -n "${CIAN}   4)${GRIS} Modificar Url         - ${AMARILLO}"
contenido_url=$(awk "NR==12" /etc/ircddbgateway)
url=${contenido_url#*=}
echo "$url"

echo -n "${CIAN}   5)${GRIS} Modificar Frecuencia  - ${AMARILLO}"
contenido_frecuencia=$(awk "NR==21" /etc/ircddbgateway)
frecuencia=${contenido_frecuencia#*=}
echo "$frecuencia"

echo -n "${CIAN}   6)${GRIS} Modificar Latitud     - ${AMARILLO}"
contenido_latitud=$(awk "NR==8" /etc/ircddbgateway)
latitud=${contenido_latitud#*=}
echo "$latitud"

echo -n "${CIAN}   7)${GRIS} Modificar Longitud    - ${AMARILLO}"
contenido_longitud=$(awk "NR==9" /etc/ircddbgateway)
longitud=${contenido_longitud#*=}
echo "$longitud"

echo ""
echo "   ${ROJO}0) Volver"
echo ""
echo -n "\33[1;36m   Elige una opción: " 

read escoger_menu
case $escoger_menu in
1) echo ""
while true
do
                        echo "Valor del Indicativo:    ${AMARILLO}${contenido_indicativo#*=}${BLANCO}"
                        read -p 'Introduce tu indicativo: ' indicativo
                        actualizar=S 
                        case $actualizar in
			[sS]* ) echo ""
                        
                        # ========================================================================
                        #Convierte de minúsculas a mayúsculas 
                        indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
                        sudo sed -i "2c gatewayCallsign=$indicativo" /etc/ircddbgateway

                        #Convierte de mayúsculas a minúsculas
                        indicativo=`echo "$indicativo" | tr [:upper:] [:lower:]`
                        sudo sed -i "95c ircddbUsername=$indicativo" /etc/ircddbgateway

                        #Convierte de minúsculas a mayúsculas
                        indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
                        sudo sed -i "117c dplusLogin=$indicativo" /etc/ircddbgateway
                        # ========================================================================

                        # # =========================para la versión ircddb 2016==================
                        # #Convierte de minúsculas a mayúsculas
                        # indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
                        # sed -i "2c gatewayCallsign=$indicativo" /usr/local/etc/opendv/ircddbgateway

                        # #Convierte de mayúsculas a minúsculas 
                        # indicativo=`echo "$indicativo" | tr [:upper:] [:lower:]`
                        # sudo sed -i "95c ircddbUsername=$indicativo" /usr/local/etc/opendv/ircddbgateway

                        # #Convierte de minúsculas a mayúsculas
                        # indicativo=`echo "$indicativo" | tr [:lower:] [:upper:]`
                        # sed -i "116c dplusLogin=$indicativo  " /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
			[nN]* ) echo ""
			break;;
                        esac
done;;
2) echo ""
while true
do
                        echo "Valor de la Ciudad:  ${AMARILLO}${contenido_ciudad#*=}${BLANCO}"
                        read -p 'Introduce tu Ciudad: ' ciudad
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        sudo sed -i "10c description1=$ciudad" /etc/ircddbgateway
                        sudo sed -i "27c description_1=$ciudad" /etc/ircddbgateway
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # ========================================================================
                        # sudo sed -i "10c description1=$ciudad" /usr/local/etc/opendv/ircddbgateway
                        # sudo sed -i "27c description_1=$ciudad" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
3) echo ""
while true
do

                        echo "Valor del Reflector: ${AMARILLO}${contenido_reflector#*=}${BLANCO}"
                        read -p 'Introduce Reflector: ' reflector
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        #Convierte de minúsculas a mayúsculas 
                        reflector=`echo "$reflector" | tr [:lower:] [:upper:]`
                        sudo sed -i "18c reflector1=$reflector" /etc/ircddbgateway                        
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # =======================================================================
                        # #Convierte de minúsculas a mayúsculas
                        # reflector=`echo "$reflector" | tr [:lower:] [:upper:]`
                        # sudo sed -i "18c reflector1=$reflector" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
4) echo ""
while true
do

                        echo "Valor de la Url: ${AMARILLO}${contenido_url#*=}${BLANCO}"
                        read -p 'Introduce Url:   ' web
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        sudo sed -i "12c url=$web" /etc/ircddbgateway
                        sudo sed -i "29c url1=$web" /etc/ircddbgateway
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # ========================================================================
                        # sudo sed -i "12c url=$web" /usr/local/etc/opendv/ircddbgateway
                        # sudo sed -i "29c url1=$web" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
5) echo ""
while true
do
                        echo "Valor de la Frecuencia: ${AMARILLO}${contenido_frecuencia#*=}${BLANCO}"
                        read -p 'Introduce Frecuencia:   ' frecuencia
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        sudo sed -i "21c frequency1=$frecuencia" /etc/ircddbgateway
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # ========================================================================
                        # sudo sed -i "21c frequency1=$frecuencia" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
6) echo ""
while true
do
                        echo "Valor de Latitud:     ${AMARILLO}${contenido_latitud#*=}${BLANCO}"
                        read -p 'Introduce Frecuencia: ' latitud
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        sudo sed -i "8c frequency1=$latitud" /etc/ircddbgateway
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # ========================================================================
                        # sudo sed -i "8c frequency1=$latitud" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
7) echo ""
while true
do
                        echo "Valor de Longitud:    ${AMARILLO}${contenido_longitud#*=}${BLANCO}"
                        read -p 'Introduce Frecuencia: ' longitud
                        actualizar=S 
                        case $actualizar in
                        [sS]* ) echo ""
                        # ========================================================================
                        sudo sed -i "9c frequency1=$longitud" /etc/ircddbgateway
                        # ========================================================================

                        # =========================para la versión ircddb 2016====================
                        # # ========================================================================
                        # sudo sed -i "9c frequency1=$longitud" /usr/local/etc/opendv/ircddbgateway
                        # # ========================================================================
                        break;;
                        [nN]* ) echo ""
                        break;;
                        esac
done;;
0) echo ""
exit;;	
esac
done

