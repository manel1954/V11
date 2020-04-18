#!/bin/bash
sudo killall MMDVMDSTAR
sudo killall ircddbgateway
sudo killall MMDVMBM

idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_OPEN.png
sed -i "7c Icon=/home/pi/V12/ICONO_OPEN" /home/pi/Abrir_solodstar.desktop 
else
icono=ICONO_ABRIR.png
sed -i "7c Icon=/home/pi/V13/ICONO_ABRIR" /home/pi/Abrir_solodstar.desktop
fi

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

 
cd /home/pi/Desktop
sudo cp Abrir_solodstar.desktop /home/pi
sed -i "6c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_solodstar.sh'" /home/pi/Abrir_solodstar.desktop

sed -i "11c Name[es_ES]=Abrir solo DSTAR" /home/pi/Abrir_solodstar.desktop
sed -i "13c SOLODSTAR=OFF" /home/pi/.local/status.ini

cd /home/pi
sudo cp Abrir_solodstar.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_solodstar.desktop


# Cierra el icono Abrir ircDDB si no hay conexión
cd /home/pi/Desktop
sudo cp Abrir_ircDDB.desktop /home/pi
sed -i "4cExec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh ejecutar_ircDDB.sh'" /home/pi/Abrir_ircDDB.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_ircDDB.desktop
sed -i "10c Name[es_ES]=Abrir ircDDB" /home/pi/Abrir_ircDDB.desktop
sed -i "1c D-STAR=OFF" /home/pi/.local/status.ini
cd /home/pi
sudo cp Abrir_ircDDB.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_ircDDB.desktop





estado_dvswitch=$(awk "NR==18" /home/pi/.local/status.ini)
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



