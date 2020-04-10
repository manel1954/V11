#!/bin/bash
clear
while true
do
clear
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
# path usuario
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
echo "   ************************************************************************"
echo "   *       ${CIAN}Script Actualizar y Editar AMBE SERVER\33[1;33m       ${ROJO} by EA3EIZ   \33[1;32m     *"
echo "   ************************************************************************"
echo ""
echo -n "\33[1;36m   1)\33[0m Modificar puerto ROUTER  - \33[1;33m"
var1= sed -n '1p'  $usuario/.local/ambe_server.ini

echo -n "\33[1;36m   2)\33[0m Modificar puerto MODEM   - \33[1;33m"
var1= sed -n '2p'  $usuario/.local/ambe_server.ini

echo -n "\33[1;36m   3)\33[0m Modificar Baut rate      - \33[1;33m"
var1= sed -n '3p'  $usuario/.local/ambe_server.ini

echo ""
echo "\33[1;36m   4)${VERDE} Actualizar Ambe Server  \33[1;33m"

echo ""
echo "   ${ROJO}0) Salir"
echo ""

echo -n "${AMARILLO}"
echo "   ${CIAN}Nota: ${AMARILLO}Debes actualizar Ambe Server si es la primera vez que lo utilizas"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu

case $escoger_menu in
1) echo ""
while true
do
                    echo -n "Valor actual del puerto ROUTER: \33[1;33m"
                    var1= sed -n '1p'  $usuario/.local/ambe_server.ini
                    actualizar=S
                    case $actualizar in
                    [sS]* )
           	     read -p 'Introduce el puerto que has abierto en el Router:        ' pruter
                    sed -i "1c $pruter" $usuario/.local/ambe_server.ini
			     break;;
			     [nN]* ) echo ""
			     break;;
esac
done;;
2) echo ""
while true
do
                    echo -n "Valor actual del puerto MODEM: \33[1;33m"
                    var1= sed -n '2p'  $usuario/.local/ambe_server.ini
                    echo "${VERDE}ejp. /dev/ttyUSB0"
                    actualizar=S
                    case $actualizar in
                    [sS]* )
                    echo "${CIAN}"
                    read -p 'Introduce puerto que has abierto en el Modem:        ' pruter
                    sed -i "2c $pruter" $usuario/.local/ambe_server.ini
                    break;;
                    [nN]* ) echo ""
                    break;;
esac
done;;
3) echo ""
while true
do
                    echo -n "Valor actual de la velocidad: \33[1;33m"
                    var1= sed -n '3p'  $usuario/.local/ambe_server.ini
                    echo "${VERDE}ejp. Ambe 3000= 230400  dv stick 30 = 460800"
                    actualizar=S
                    case $actualizar in
                    [sS]* )
                    echo "${CIAN}"
                    read -p 'Introduce puerto la velocidad:        ' pruter
                    sed -i "3c $pruter" $usuario/.local/ambe_server.ini
                    break;;
                    [nN]* ) echo ""
                    break;;
esac
done;;
4) echo ""
while true
do
                         actualizar=S 
                         case $actualizar in
                         [sS]* ) echo ""
                         clear
                         cd $usuario/AMBE_SERVER
                         sudo git pull
                         sudo make clean
                         sudo make

clear
echo "${VERDE}"
echo "\33[1;33m   **************************************************"
echo "   *                                                *"
echo "   *           AMBE SERVER ACTUALIZADO              *"
echo "   *                                                *"
echo "   **************************************************"
sleep 2
                         break;;
                         [nN]* ) echo ""
                         break;;
esac
done;;
0) echo ""
clear
echo "\33[1;33m   **************************************************"
echo "   *                                                *"
echo "   *     CERRANDO SCRIPT                            *"
echo "   *                                                *"
echo "   **************************************************"
sleep 1
clear
exit;;	
esac
done

