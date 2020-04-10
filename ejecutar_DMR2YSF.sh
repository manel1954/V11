#!/bin/bash

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMR2YSF.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDMR2YSF.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMR2YSF.desktop

sudo cp /home/pi/RXF_DMR2YSF.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DMR2YSF.desktop

#Escribe en el fichero INFO_RXF para poner los datos en los iconos INFO TXF
sed -i "14c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_DMR2YSF.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh cerrar_DMR2YSF.sh'" /home/pi/Abrir_DMR2YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2YSF_ON.png" /home/pi/Abrir_DMR2YSF.desktop
sed -i "10c Name[es_ES]=Cerrar DMR2YSF" /home/pi/Abrir_DMR2YSF.desktop
sed -i "15c DMR2YSF=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2YSF.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2YSF.desktop

cd /home/pi/DMR2YSF

sudo lxterminal --geometry=80x12 -e ./DMR2YSF DMR2YSF.ini & 
cd /home/pi/MMDVMHost
sudo lxterminal --geometry=80x12 -e ./DMR2YSF MMDVMDMR2YSF.ini &
cd /home/pi/YSFClients/YSFGateway
sudo ./YSFGateway YSFGateway.ini

cd /home/pi/Desktop
sudo cp Abrir_DMR2YSF.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_DMR2YSF.sh'" /home/pi/Abrir_DMR2YSF.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMR2YSF_OFF.png" /home/pi/Abrir_DMR2YSF.desktop
sed -i "10c Name[es_ES]=Abrir DMR2YSF" /home/pi/Abrir_DMR2YSF.desktop
sed -i "15c DMR2YSF=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_DMR2YSF.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_DMR2YSF.desktop



 
  