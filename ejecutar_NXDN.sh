#!/bin/bash

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMNXDN.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMNXDN.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_NXDN.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMNXDN.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_NXDN.desktop

sudo cp /home/pi/RXF_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_NXDN.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF 
sed -i "17c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh cerrar_NXDN.sh'" /home/pi/Abrir_NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_NXDN_ON.png" /home/pi/Abrir_NXDN.desktop
sed -i "10c Name[es_ES]=Cerrar NXDN" /home/pi/Abrir_NXDN.desktop
sed -i "17c NXDN=ON" /home/pi/.local
cd /home/pi
sudo cp Abrir_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_NXDN.desktop


cd /home/pi/MMDVMHost
sudo lxterminal --geometry=80x12 -e ./MMDVMNXDN MMDVMNXDN.ini &

cd /home/pi/NXDNClients/NXDNGateway
sudo ./NXDNGateway NXDNGateway.ini

cd /home/pi/Desktop
sudo cp Abrir_NXDN.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_NXDN.sh'" /home/pi/Abrir_NXDN.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_NXDN_OFF.png" /home/pi/Abrir_NXDN.desktop
sed -i "10c Name[es_ES]=Abrir NXDN" /home/pi/Abrir_NXDN.desktop
sed -i "17c NXDN=OFF" /home/pi/.local
cd /home/pi
sudo cp Abrir_NXDN.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_NXDN.desktop



