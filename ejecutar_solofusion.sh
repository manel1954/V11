#!/bin/bash

mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMFUSION.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMFUSION.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_SOLOFUSION.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMFUSION.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_SOLOFUSION.desktop

sudo cp /home/pi/RXF_SOLOFUSION.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_SOLOFUSION.desktop

#Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF                        
sed -i "6c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solofusion.desktop /home/pi
sed -i "6c Exec=sudo sh cerrar_solofusion.sh" /home/pi/Abrir_solofusion.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_YSF_ON.png" /home/pi/Abrir_solofusion.desktop
sed -i "11c Name[es_ES]=Cerrar solo FUSION" /home/pi/Abrir_solofusion.desktop
sed -i "12c SOLOFUSION=ON" /home/pi/status.ini
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

sed -i "6c Exec=sh -c 'cd /home/pi/V105/;lxterminal --geometry=80x15 -e sudo sh ejecutar_solofusion.sh'" /home/pi/Abrir_solofusion.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_YSF.png" /home/pi/Abrir_solofusion.desktop
sed -i "11c Name[es_ES]=Abrir solo FUSION" /home/pi/Abrir_solofusion.desktop
sed -i "12c SOLOFUSION=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_solofusion.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solofusion.desktop

