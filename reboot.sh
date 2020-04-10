#!/bin/bash
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
echo "${AMARILLO}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *                      REINICIAR RASPBERRY PI                       *"
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${CIAN}"
echo -n " Quieres Reiniciar S/N ? "
read activar
case "$activar" in
[sS]* )
clear

sudo reboot
break;;
[nN]*) 
exit ;;
esac