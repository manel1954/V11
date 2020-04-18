#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
advertencia="If you activate NextionDriver, the Hotspot by GPIO will not work"
activo="ACTIVATING NextionDriver"
quieres="Do you want to activate NextionDriver? Y/N"
ojo="EYE!! Once activated the Raspberry will restart"
sudo sed -i "10c Name[es_ES]=Deactivated NextionDriver" $usuario/Activar_NextionDriver.desktop
else
icono=ICONO_ABRIR.png
advertencia="Si activas NextionDriver no funcionaran los Hotspot por GPIO"
activo="ACTIVANDO NextionDriver"
quieres="Quieres Activar NextionDriber? S/N"
ojo="OJO!! Una vez activado se reiniciará la Raspberry pi"
sudo sed -i "10c Name[es_ES]=Desactivar NextionDriver" $usuario/Activar_NextionDriver.desktop
fi
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
echo "                                                                    "
echo "     $advertencia  "
echo "                                                                   "
echo " *********************************************************************"
echo ""
echo "${ROJO}"
echo " *********************************************************************"
echo "                                                                    "
echo "         $ojo"
echo "                                                                    "
echo " *********************************************************************"
echo "${CIAN}"
echo -n "   $quieres "
read seguir   
if [ "$seguir" = 'S' -o "$seguir" = 's' -o "$seguir" = 'Y' -o "$seguir" = 'y' ];then
clear
echo "${VERDE}"
echo " *********************************************************************"
echo " *                                                                   *"
echo " * <<<<<<<<<<<<<<<<<< $activo >>>>>>>>>>>>>>>>>>>>> *"
echo " *                                                                   *"
echo " *********************************************************************"
sleep 3

sudo cp $usuario/Desktop/Activar_NextionDriver.desktop $usuario
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh Desactivar_NextionDriver.sh'" $usuario/Activar_NextionDriver.desktop
sudo sed -i "5c Icon=/$usuario/$SCRIPTS_version/ICONO_NEXTIONDRIVER_ON.png" $usuario/Activar_NextionDriver.desktop

cd $usuario
sudo cp Activar_NextionDriver.desktop $usuario/Desktop
sleep 2
sudo rm Activar_NextionDriver.desktop

sudo sed -i "4c Exec=sh -c 'cd $usuario/NextionDriver/;sudo ./NextionDriver -c $usuario/MMDVMHost/MMDVM.ini'" $usuario/.config/autostart/nextiondriver.desktop

sudo reboot

else
echo ""
fi

