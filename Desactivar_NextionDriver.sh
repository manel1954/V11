#!/bin/bash
# path usuario
usuario="/home/pi"
usuario="$usuario"
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
echo " * Si Desactivas NextionDriver funcionará la China pinchada en Raspi *"
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${ROJO}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *        OJO!! Una vez desactivado se reiniciará la Raspberry       *"
echo " *                                                                   *"
echo " *********************************************************************"
echo "${CIAN}"
echo -n " Quieres Desactivar NextionDriver S/N ? "
read desactivar
case "$desactivar" in
[sS]* )
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *     <<<<<<<<      DESACTIVANDO NextionDriver      >>>>>>>>>       *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3

sudo cp $usuario/Desktop/Activar_NextionDriver.desktop $usuario
sudo sed -i "4c Exec=sh -c 'cd $usuario/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh Activar_NextionDriver.sh'" $usuario/Activar_NextionDriver.desktop
sudo sed -i "5c Icon=$usuario/$SCRIPTS_version/ICONO_NEXTIONDRIVER_OFF.png" $usuario/Activar_NextionDriver.desktop
sudo sed -i "10c Name[es_ES]=Activar NextionDriver" $usuario/Activar_NextionDriver.desktop
cd $usuario
sudo cp Activar_NextionDriver.desktop $usuario/Desktop
sleep 2
sudo rm Activar_NextionDriver.desktop

sudo sed -i "4c #Exec=sh -c 'cd $usuario/NextionDriver/;sudo ./NextionDriver -c $usuario/MMDVMHost/MMDVM.ini'" $usuario/.config/autostart/nextiondriver.desktop

sudo reboot

break;;
[nN]*) 
exit ;;
esac