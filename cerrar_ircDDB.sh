#!/bin/bash
#cierra ircDDBGateway
sudo killall ircddbgateway
#cierra remotecontrol
sudo killall remotecontrol

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
#cierra Abrir_ircDDBGateway.desktop y quita icono verde de "cerrar ircDDB" 
cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi

sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh ejecutar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_IRCDDB_OFF.png" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=OFF" /home/pi/status.ini

cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_ircDDB.desktop

estado_dvswitch=$(awk "NR==18" /home/pi/status.ini)
if [ "$estado_dvswitch" = 'DVSWITCH=ON' ];then

# Pone Enable=1 en [Dstar Network]
sed -i "62c Enable=1" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/brandmeister_esp.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/dmrplus.ini
sed -i "62c Enable=1" /opt/MMDVM_Bridge/especial.ini

sudo systemctl restart ircddbgateway

else
echo "no hace nada"
fi