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
echo "                Script para cambiar lenguaje/Script to change language      "
echo -n "${ROJO}"
echo "                                  $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************************************"
echo ""
echo  "${CIAN}   1)${AMARILLO} Establecer idioma Español"
echo ""
echo  "${CIAN}   2)${AMARILLO} Set English language"
echo ""
echo "   ${ROJO}0) Salir/Exit"
echo ""
echo -n "\33[1;36m   Elige una opción/Choose an option: " 

read escoger_menu
case $escoger_menu in
1) echo ""
while true
do

clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  ADVERTENCIA!!                               "
echo ""
echo -n "${ROJO}"
echo "                   AL CAMBIAR DE IDIOMA SE REINICIARÁ EL SISTEMA               "
                           
echo "                            PARA GUARDAR LOS CAMBIOS                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	

echo "${CIAN}"
read -p '   Quieres cambiar de idioma? S/N ' actualizar   

                        case $actualizar in
                        [sS]* ) echo ""
                        sed -i "1c Spanish" /home/pi/.local/idioma
                        sudo sed -i "5c Icon=/home/pi/V11/ICONO_SPANISH.png" /home/pi/V11/Desktop/Idioma.desktop
                        sudo sed -i "11c Name=Editar BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo sed -i "13c Name=Editar BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;   
2) echo ""
while true
do

clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  WARNING!!                               "
echo ""
echo -n "${ROJO}"
echo "                   CHANGING THE LANGUAGE WILL RESTART THE SYSTEM               "
                           
echo "                              TO SAVE CHANGES                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	

echo "${CIAN}"
read -p '   You want to change language? Y/N ' actualizar   

                        case $actualizar in
                        [yY]* ) echo ""
                        sed -i "1c English" /home/pi/.local/idioma
                        sudo sed -i "5c Icon=/home/pi/V11/ICONO_ENGLISH.png" /home/pi/V11/Desktop/Idioma.desktop
                        sudo sed -i "11c Name=Edit BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo sed -i "13c Name=Edit BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo sed -i "21c 1" /home/pi/.local/status.ini
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

