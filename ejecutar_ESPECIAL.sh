#!/bin/bash

#Colores 
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMESPECIAL.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMESPECIAL.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_ESPECIAL.desktop /home/pi
#sleep 1
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMESPECIAL.ini)
frecuencia=`expr substr $frecuencia 13 17`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_ESPECIAL.desktop
#sleep 1
sudo cp /home/pi/RXF_ESPECIAL.desktop /home/pi/Desktop
#sleep 1
sudo rm /home/pi/RXF_ESPECIAL.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF                        
sed -i "3c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ESPECIAL_ON.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Cerrar Especial" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c MMDVMESPECIAL=ON" /home/pi/.local

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
#sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop

cd /home/pi/MMDVMHost
echo "${AMARILLO}"
echo " ******************************************************************************"
echo " **************************    ABRIENDO ESPECIAL    ***************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMESPECIAL MMDVMESPECIAL.ini

cd /home/pi/Desktop
sudo cp Abrir_ESPECIAL.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_ESPECIAL.sh'" /home/pi/Abrir_ESPECIAL.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ESPECIAL_OFF.png" /home/pi/Abrir_ESPECIAL.desktop
sed -i "10c Name[es_ES]=Abrir Especial" /home/pi/Abrir_ESPECIAL.desktop

sed -i "10c MMDVMESPECIAL=OFF" /home/pi/.local

cd /home/pi
sudo cp Abrir_ESPECIAL.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ESPECIAL.desktop