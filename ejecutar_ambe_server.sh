#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_ambe_server.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ambe_server.sh'" /home/pi/Abrir_ambe_server.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AMBE_SERVER_ON.png" /home/pi/Abrir_ambe_server.desktop
sed -i "10c Name[es_ES]=Cerrar AMBE SERVER" /home/pi/Abrir_ambe_server.desktop
sed -i "11c AMBE_SERVER=ON" /home/pi/.local

puerto_router=$(awk "NR==1" /home/pi/.local/ambe_server.ini) 
puerto_modem=$(awk "NR==2" /home/pi/.local/ambe_server.ini)
baut_rate=$(awk "NR==3" /home/pi/.local/ambe_server.ini)
cd /home/pi
sudo cp Abrir_ambe_server.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Abrir_ambe_server.desktop

cd /home/pi/AMBE_SERVER

sudo killall AMBEserver
sleep 1
./AMBEserver -p $puerto_router -i $puerto_modem -s $baut_rate


cd /home/pi/Desktop
sudo cp Abrir_ambe_server.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=72x15 -e sudo sh ejecutar_ambe_server.sh'" /home/pi/Abrir_ambe_server.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AMBE_SERVER_OFF.png" /home/pi/Abrir_ambe_server.desktop
sed -i "10c Name[es_ES]=Abrir AMBE SERVER" /home/pi/Abrir_ambe_server.desktop
sed -i "11c AMBE_SERVER=OFF" /home/pi/.local
cd /home/pi
sudo cp Abrir_ambe_server.desktop /home/pi/Desktop
sleep 2
sudo rm /home/pi/Abrir_ambe_server.desktop				
						
						