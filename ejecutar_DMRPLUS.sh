#!/bin/bash
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMPLUS.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DMRPLUS.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMPLUS.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DMRPLUS.desktop

sudo cp /home/pi/RXF_DMRPLUS.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DMRPLUS.desktop

#Escribe en el fichero INFO_NXDN para poner los datos en los iconos INFO TXF  
sed -i "2c $frecuencia" /home/pi/INFO_RXF

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_ON.png" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "10c Name[es_ES]=Cerrar DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "6c MMDVMPLUS=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

sudo cp -R Desktop /home/pi/.local
sleep 1
sudo rm -R Desktop
sudo cp -R /home/pi/.local/Desktop /home/pi

cd /home/pi/MMDVMHost
echo "\33[1;37m"
echo " ******************************************************************************"
echo " ****************************    ABRIENDO DMR+    *****************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMPLUS MMDVMPLUS.ini

cd /home/pi/Desktop
sudo cp Abrir_MMDVMPLUS.desktop /home/pi
sudo sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;lxterminal --geometry=80x15 -e sudo sh ejecutar_DMRPLUS.sh'" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_DMRPLUS_OFF.png" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "10c Name[es_ES]=Abrir DMR+" /home/pi/Abrir_MMDVMPLUS.desktop
sudo sed -i "6c MMDVMPLUS=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_MMDVMPLUS.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMPLUS.desktop

sudo cp -R Desktop /home/pi/.local
sleep 1
sudo rm -R Desktop
sudo cp -R /home/pi/.local/Desktop /home/pi
