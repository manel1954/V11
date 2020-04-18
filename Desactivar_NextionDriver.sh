#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
advertencia="If you deactivate NextionDriver will work the China punctured in Raspi"
desactivo="DEACTIVATING NextionDriver"
quieres="Do you want to deactivate NextionDriver? Y/N"
ojo="EYE!! Once deactivated the Raspberry will restart"
else
icono=ICONO_ABRIR.png
advertencia="Si Desactivas NextionDriver no funcionaran los Hotspot por GPIO"
desactivo="DESACTIVANDO NextionDriver"
quieres="Quieres Desactivar NextionDriber? S/N"
ojo="OJO!! Una vez desactivado se reiniciará la Raspberry"
fi
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
echo "  $advertencia "
echo " *                                                                   *"
echo " *********************************************************************"
echo ""
echo "${ROJO}"
echo " *********************************************************************"
echo " *                                                                   *"
echo "         $ojo       "
echo " *                                                                   *"
echo " *********************************************************************"
echo "${CIAN}"
echo -n "   $quieres "
read seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' -o "$seguir" = 'Y' -o "$seguir" = 'y' ];then 
read seguir

clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " *     <<<<<<<<      $desactivo      >>>>>>>>>       *"
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

else
echo "no desactiva"
fi

