#!/bin/bash
idioma=$(awk "NR==1" /home/pi/.local/idioma)
if [ $idioma = English ]; then
icono=ICONO_INFO.png
OPTION="Chose an Option"
PUERTO="Port for DVMEGA punctured in Raspberry PI"
INDICATIVO="Enter your call sign"
VALORINDICATIVO="Current value call sign"
SALIR="Exit"
RESTAURAORIGINAL="You want to restore the original file"
SINO="Y/N"
P_RESTAURAORIGINAL="Recover the original file"
MODIFICAR="Modify   "
 
else
OPTION="Elije una opción"
PUERTO="Puerto para DVMEGA pinchado en Raspberri PI"
INDICATIVO="Introduce tu indicativo"
VALORINDICATIVO="Valor actual Indicativo"
SALIR="Salir"
RESTAURAORIGINAL="Quieres restaurar el fichero original"
SINO="S/N"
P_RESTAURAORIGINAL=" Recuperar fichero original"
MODIFICAR="Modificar"
fi
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/$icono" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=ON" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMBM.desktop /home/pi/Desktop

sudo rm /home/pi/Abrir_MMDVMBM.desktop

cd /home/pi/MMDVMHost
echo "\33[38;5;138m"
echo " ******************************************************************************"
echo " ************************    ABRIENDO BRANDMEISTER    *************************"
echo " ******************************************************************************"
sleep 2
sudo ./MMDVMBM MMDVMBM.ini

cd /home/pi/Desktop
cp Abrir_MMDVMBM.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; lxterminal --geometry=80x15 -e sudo sh ejecutar_bm.sh'" /home/pi/Abrir_MMDVMBM.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_ABRIR.png" /home/pi/Abrir_MMDVMBM.desktop
sed -i "10c Name[es_ES]=BM" /home/pi/Abrir_MMDVMBM.desktop
sed -i "7c MMDVMBM=OFF" /home/pi/.local/status.ini
cd /home/pi
cp Abrir_MMDVMBM.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_MMDVMBM.desktop


