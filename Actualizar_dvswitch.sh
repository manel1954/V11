#!/bin/bash
clear
# path usuario
usuario="/home/pi"
usuario=$(awk "NR==1" $usuario/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *                      ACTUALIZAR DVSWITCH                          *"
echo " *                                                                   *"
echo " *********************************************************************"
echo "${AMARILLO}"
echo -n " Quieres Actualizar Dvswitch S/N ? "
read activar
case "$activar" in
[sS]* )

version=$(awk "NR==10" $usuario//home/pi/.local)

if [ $version = 10 ]
then
clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""

echo "${BLANCO}"
echo " ****************************************************************************"
echo " * ************************************************************************ *"
echo " * *                                                                      * *"
echo " * *${AMARILLO}                       YA TIENES LA ÚLTIMA VERSIÓN ${BLANCO}                   * *"
echo " * *                                                                      * *"
echo " * ************************************************************************ *"
echo " ****************************************************************************"
	sleep 5
else
	echo "Hay una nueva versión y se está actualizando"
	sleep 5
fi
break;;
[nN]*) 
exit ;;
esac


