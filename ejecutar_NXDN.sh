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
sudo cp Abrir_NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh cerrar_NXDN.sh'" /home/pi/Abrir_NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_NXDN.desktop
sed -i "10c Name[es_ES]=Cerrar NXDN" /home/pi/Abrir_NXDN.desktop
sed -i "17c NXDN=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_NXDN.desktop


cd /home/pi/MMDVMHost
sudo lxterminal --geometry=80x12 -e ./MMDVMNXDN MMDVMNXDN.ini &

cd /home/pi/NXDNClients/NXDNGateway
sudo ./NXDNGateway NXDNGateway.ini

# Cierra el icono Abrir Solo Dstar si no hay conexión 
cd /home/pi/Desktop
sudo cp Abrir_NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_NXDN.sh'" /home/pi/Abrir_NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono_NO" /home/pi/Abrir_NXDN.desktop
sed -i "10c Name[es_ES]=Abrir NXDN" /home/pi/Abrir_NXDN.desktop
sed -i "17c NXDN=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_NXDN.desktop




