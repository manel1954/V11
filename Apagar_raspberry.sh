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
MARRON="\33[38;5;138m"
echo "${AMARILLO}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *                       APAGAR RASPBERRY PI                         *"
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${CIAN}"
echo -n " Quieres Apagarla S/N ? "
read activar
case "$activar" in
[sS]* )
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " * <<<<<<<<<<<<<<<<<<  APAGANDO RASPBERRY PI  >>>>>>>>>>>>>>>>>>>>>> *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3

sudo shutdown -h now

break;;
[nN]*) 
exit ;;
esac


