#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"

estado_dvswitch=$(awk "NR==18" /home/pi/.local/status.ini)
if [ "$estado_dvswitch" = 'DVSWITCH=ON' ];then

echo "${ROJO}"
echo "                  ******************************************"
echo "                  *        ESTO DESACTIVARÁ DSTAR          *"
echo "                  *              EN DVSWITCH               *"
echo "                  ******************************************"
sleep 3
clear
echo "${VERDE}"
echo " ******************************************************************************"
echo " **************************   ABRIENDO SOLO DSTAR    **************************"
echo " ******************************************************************************"
sleep 2
#Escribe en el fichero INFO_RXF para poner los datos del icono INFO TXF
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMDSTAR.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DSTAR.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DSTAR.desktop

sudo cp /home/pi/RXF_DSTAR.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DSTAR.desktop                       
sed -i "5c $frecuencia" /home/pi/INFO_RXF
# FIN Escribe en el fichero INFO_RXF para poner los datos del icono INFO TXF 

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR_ON.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Cerrar solo DSTAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solodstar.desktop

cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_ON.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Cerrar ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ircDDB.desktop

# Pone Enable=0 en [Dstar Network]
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/brandmeister_esp.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/dmrplus.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/especial.ini

sudo systemctl stop ircddbgateway.service

# Ejecuta Solo D-STAR
cd /home/pi/MMDVMHost
sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini

# Cierra el icono Abrir Solo Dstar si no hay conexión 
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Abrir solo DSTAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solodstar.desktop


cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_OFF.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=OFF" /home/pi/.local/status.ini
sleep 1
cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop

else
clear
echo "${VERDE}"
echo " ******************************************************************************"
echo " **************************   ABRIENDO SOLO DSTAR    **************************"
echo " ******************************************************************************"
sleep 2
#Escribe en el fichero INFO_RXF para poner los datos del icono INFO TXF
mode=`grep -n -m 1 "^Port=" /home/pi/MMDVMHost/MMDVMDSTAR.ini`
buscar=":"
caracteres=`expr index $mode $buscar`
caracteres_linea=`expr $caracteres - 1`
numero_linea_port=`expr substr $mode 1 $caracteres_linea`
mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
puerto=`expr substr $mode 11 9`
puerto="  "$puerto
cd /home/pi/Desktop
sudo cp RXF_DSTAR.desktop /home/pi
frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMDSTAR.ini)
frecuencia=`expr substr $frecuencia 13 9`
frecuencia=$frecuencia$puerto
sed -i "11c Name=$frecuencia" /home/pi/RXF_DSTAR.desktop

sudo cp /home/pi/RXF_DSTAR.desktop /home/pi/Desktop

sudo rm /home/pi/RXF_DSTAR.desktop                       
sed -i "5c $frecuencia" /home/pi/INFO_RXF
# FIN Escribe en el fichero INFO_RXF para poner los datos del icono INFO TXF 

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR_ON.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Cerrar solo DSTAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solodstar.desktop

cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_ON.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Cerrar ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=ON" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ircDDB.desktop


# Pone Enable=0 en [Dstar Network]
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/brandmeister_esp.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/dmrplus.ini
sed -i "62c Enable=0" /opt/MMDVM_Bridge/especial.ini

sudo systemctl stop ircddbgateway.service


# Ejecuta Solo D-STAR
cd /home/pi/MMDVMHost
sudo ircddbgateway -gui & sudo ./MMDVMDSTAR MMDVMDSTAR.ini

# Cierra el icono Abrir Solo Dstar si no hay conexión 
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop
sed -i "7c Icon=/home/pi/$SCRIPTS_version/SOLO_D-STAR.png" /home/pi/Abrir_solodstar.desktop
sed -i "11c Name[es_ES]=Abrir solo DSTAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_solodstar.desktop

cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sleep 1
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_OFF.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=OFF" /home/pi/.local/status.ini
sleep 1




cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop




fi



