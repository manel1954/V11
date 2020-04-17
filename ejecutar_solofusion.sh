#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_CLOSE.png
icono_NO=ICONO_OPEN.png

else
icono=ICONO_CERRAR.png
icono_NO=ICONO_ABRIR.png

fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solofusion.desktop /home/pi
sed -i "6c Exec=sudo sh cerrar_solofusion.sh" /home/pi/Abrir_solofusion.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_solofusion.desktop
sed -i "11c Name[es_ES]=Cerrar solo FUSION" /home/pi/Abrir_solofusion.desktop
sed -i "12c SOLOFUSION=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solofusion.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solofusion.desktop

echo "\33[38;5;138m"
echo " ******************************************************************************"
echo " ************************    ABRIENDO SOLO FUSION    **************************"
echo " ******************************************************************************"
sleep 2
cd /home/pi/YSFClients/YSFGateway
sudo lxterminal --geometry=80x12 -e ./YSFGateway YSFGateway.ini & 
cd /home/pi/MMDVMHost

sudo ./MMDVMFUSION MMDVMFUSION.ini

cd /home/pi/Desktop
sudo cp Abrir_solofusion.desktop /home/pi

sed -i "6c Exec=sh -c 'cd /home/pi/V11/;lxterminal --geometry=80x15 -e sudo sh ejecutar_solofusion.sh'" /home/pi/Abrir_solofusion.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/$icono_NO" /home/pi/Abrir_solofusion.desktop
sed -i "11c Name[es_ES]=Abrir solo FUSION" /home/pi/Abrir_solofusion.desktop
sed -i "12c SOLOFUSION=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solofusion.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solofusion.desktop


