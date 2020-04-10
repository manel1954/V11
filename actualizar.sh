#!/bin/bash

cp /home/pi/V105/icons.screen0-1904x1023.rc /home/pi/.config/xfce4/desktop
sleep 2
xfdesktop --reload

estado_dvswitch=$(awk "NR==18" /home/pi/status.ini)
if [ "$estado_dvswitch" = 'DVSWITCH=OFF' ];then
sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service

sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service
else
echo ""
fi

#comprueba si el fichero existe
if [ -f /home/pi/.local/sala.txt ];
then
echo "El fichero ya existe"
else
cp sala.txt /home/pi/.local
fi

# path usuario
usuario="/home/pi"
usuario="$usuario"
SCRIPTS_version="V105"
actualizacion=$(awk "NR==1" /home/pi/.config/autostart/actualizacion)
SCRIPTS_version="V105"
version="V105-"
version=$version$actualizacion
#pone todos los status de inicio en OFF
sed -i "1c D-STAR=OFF" $usuario/status.ini
sed -i "2c BlueDV=OFF" $usuario/status.ini
sed -i "3c YSF=OFF" $usuario/status.ini
sed -i "4c DV4mini=OFF" $usuario/status.ini
sed -i "5c MMDVM=OFF" $usuario/status.ini
sed -i "6c MMDVMPLUS=OFF" $usuario/status.ini
sed -i "7c MMDVMBM=OFF" $usuario/status.ini
sed -i "8c SVXLINK=OFF" $usuario/status.ini
sed -i "9c dstarrepeater=OFF" $usuario/status.ini
sed -i "10c MMDVMLIBRE=OFF" $usuario/status.ini
sed -i "11c AMBE_SERVER=OFF" $usuario/status.ini
sed -i "12c SOLOFUSION=OFF" $usuario/status.ini
sed -i "13c SOLODSTAR=OFF" $usuario/status.ini
sed -i "14c YSF2DMR=OFF" $usuario/status.ini
sed -i "15c DMR2YSF=OFF" $usuario/status.ini
sed -i "16c DMR2NXDN=OFF" $usuario/status.ini
sed -i "17c NXDN=OFF" $usuario/status.ini


#Actualiza Imagen
cd $usuario/$SCRIPTS_version
git pull

sleep 2


#=================================================================================

#Actualiza todos los iconos y Quita todos los iconos verdes que se quedan al cerrar la imagen


#sudo cp $usuario/Desktop/Activar_dvswitch.desktop $usuario/.local #deja el icono en el estado que se reinició
#sudo cp $usuario/Desktop/Activar_NextionDriver.desktop $usuario/.local #deja el icono en el estado que se reinició
#sudo cp $usuario/Desktop/Abrir_ircDDBGateway.desktop $usuario #deja con el terminal en el estado que se reinició
#sudo cp $usuario/Desktop/Abrir_D-STARRepeater.desktop $usuario #deja con el terminal en el estado que se reinició


cd $usuario/$SCRIPTS_version/Desktop
cp * $usuario/Desktop
sudo chmod 777 -R $usuario/Desktop


#sudo cp $usuario/.local/Activar_dvswitch.desktop $usuario/Desktop #deja el icono en el estado que se reinició
#sudo cp $usuario/.local/Activar_NextionDriver.desktop $usuario/Desktop #deja el icono en el estado que se reinició
#sudo cp $usuario/Abrir_ircDDBGateway.desktop $usuario/Desktop #deja con el terminal en el estado que se reinició
#sudo cp $usuario/Abrir_D-STARRepeater.desktop $usuario/Desktop #deja con el terminal en el estado que se reinició

#=================================================================================


#pone todos los datos de DMR+ , Brandameiter, svxlink etc en panel_control.ini
bm=`sed -n '2p'  $usuario/MMDVMHost/MMDVMBM.ini`
plus=`sed -n '2p'  $usuario/MMDVMHost/MMDVMPLUS.ini`
dstar=`sed -n '2p'  $usuario/MMDVMHost/MMDVMDSTAR.ini`
fusion=`sed -n '2p'  $usuario/MMDVMHost/MMDVMFUSION.ini`
frbm=`sed -n '13p'  $usuario/MMDVMHost/MMDVMBM.ini`
frplus=`sed -n '13p'  $usuario/MMDVMHost/MMDVMPLUS.ini`
#BM
indi=$(awk "NR==2" $usuario/MMDVMHost/MMDVMBM.ini)
ide=$(awk "NR==3" $usuario/MMDVMHost/MMDVMBM.ini)
frec=$(awk "NR==13" $usuario/MMDVMHost/MMDVMBM.ini)
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/MMDVMBM.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
masterbm=$(awk "NR==$linea_master" $usuario/MMDVMHost/MMDVMBM.ini)
sed -i "1c $indi" $usuario/info_panel_control.ini
sed -i "2c $ide" $usuario/info_panel_control.ini
sed -i "3c $frec" $usuario/info_panel_control.ini
sed -i "4c $masterbm" $usuario/info_panel_control.ini

#PLUS
indi=$(awk "NR==2" $usuario/MMDVMHost/MMDVMPLUS.ini)
ide=$(awk "NR==3" $usuario/MMDVMHost/MMDVMPLUS.ini)
frec=$(awk "NR==13" $usuario/MMDVMHost/MMDVMPLUS.ini)
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/MMDVMPLUS.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
masterplus=$(awk "NR==$linea_master" $usuario/MMDVMHost/MMDVMPLUS.ini)
sed -i "11c $indi" $usuario/info_panel_control.ini
sed -i "12c $ide" $usuario/info_panel_control.ini
sed -i "13c $frec" $usuario/info_panel_control.ini
sed -i "14c $masterplus" $usuario/info_panel_control.ini

#Radio
indi=$(awk "NR==2" $usuario/MMDVMHost/MMDVM.ini)
ide=$(awk "NR==3" $usuario/MMDVMHost/MMDVM.ini)
frec=$(awk "NR==13" $usuario/MMDVMHost/MMDVM.ini)
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/MMDVM.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
letra=c            
linea_master=$largo$letra
masterradio=$(awk "NR==$linea_master" $usuario/MMDVMHost/MMDVM.ini)
sed -i "6c $indi" $usuario/info_panel_control.ini
sed -i "7c $ide" $usuario/info_panel_control.ini
sed -i "8c $frec" $usuario/info_panel_control.ini
sed -i "9c $masterradio" $usuario/info_panel_control.ini

#YSF
master=$(awk "NR==39" $usuario/YSFClients/YSFGateway/YSFGateway.ini)
sed -i "21c $master" $usuario/info_panel_control.ini
#SVXLINK
svxlink=$(awk "NR==16" /usr/local/etc/svxlink/svxlink.d/ModuleEchoLink.conf)
sed -i "27c $svxlink" $usuario/info_panel_control.ini

#YSF2DMR
frec=$(awk "NR==2" $usuario/YSF2DMR/YSF2DMR.ini)
master=$(awk "NR==33" $usuario/YSF2DMR/YSF2DMR.ini)
tg=$(awk "NR==30" $usuario/YSF2DMR/YSF2DMR.ini)
sed -i "24c $frec" $usuario/info_panel_control.ini
sed -i "25c $master" $usuario/info_panel_control.ini
sed -i "26c $tg" $usuario/info_panel_control.ini

#DMR2YSF busca el Address DMR2YSF
master=`grep -n -m 1 "^Address=" $usuario/MMDVMHost/MMDVMDMR2YSF.ini`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
largo=`expr substr $master 1 $largo1`
masterDMR2YSF=$(awk "NR==$largo" $usuario/MMDVMHost/MMDVMDMR2YSF.ini)

#YSFGateway.ini
master=`grep -n -m 1 "^Startup=" $usuario/YSFClients/YSFGateway/YSFGateway.ini`
#Quita los espacios
master=`echo "$master" | tr -d '[[:space:]]'`
buscar=":"
largo=`expr index $master $buscar`
largo=`expr $largo + 1`
largo1=`expr $largo - 2`
linea_YSFGateway=`expr substr $master 1 $largo1`
masterYSFGateway=$(awk "NR==$linea_YSFGateway" $usuario/YSFClients/YSFGateway/YSFGateway.ini)
#Quita los espacios
masterYSFGateway=`echo "$masterYSFGateway" | tr -d '[[:space:]]'`
#=================================================================================

#ACTUALIZA EL  PANEL DE CONTROL"
cp $usuario/$SCRIPTS_version/panel_control.php /var/www/html/panel_control
bm=`sed -n '2p'  $usuario/MMDVMHost/MMDVMBM.ini`
plus=`sed -n '2p'  $usuario/MMDVMHost/MMDVMPLUS.ini`
dstar=`sed -n '2p'  $usuario/MMDVMHost/MMDVMDSTAR.ini`
fusion=`sed -n '2p'  $usuario/MMDVMHost/MMDVMFUSION.ini`
frbm=`sed -n '13p'  $usuario/MMDVMHost/MMDVMBM.ini`
frplus=`sed -n '13p'  $usuario/MMDVMHost/MMDVMPLUS.ini`
sudo wget -post-data http://associacioader.com/prueba1.php?callBM=$bm'&'callPLUS=$plus'&'masterBM=$masterbm'&'masterPLUS=$masterplus'&'radio=$masterradio'&'version=$version'&'DMR2YSF=$masterDMR2YSF'&'YSFGateway=$masterYSFGateway
#Lee el fichero INFO_NXDN para poner los datos en los iconos INFO TXF                        
frecuencia=$(awk "NR==1" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_BM.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_BM.desktop
cd $usuario
cp RXF_BM.desktop $usuario/Desktop
rm $usuario/RXF_BM.desktop

frecuencia=$(awk "NR==2" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_DMRPLUS.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop
cd $usuario
cp RXF_DMRPLUS.desktop $usuario/Desktop
rm $usuario/RXF_DMRPLUS.desktop

frecuencia=$(awk "NR==3" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_LIBRE.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_LIBRE.desktop
cd $usuario
cp RXF_LIBRE.desktop $usuario/Desktop
rm $usuario/RXF_LIBRE.desktop

frecuencia=$(awk "NR==4" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_RADIO.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_RADIO.desktop
cd $usuario
cp RXF_RADIO.desktop $usuario/Desktop
rm $usuario/RXF_RADIO.desktop

frecuencia=$(awk "NR==6" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_SOLOFUSION.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_SOLOFUSION.desktop
cd $usuario
cp RXF_SOLOFUSION.desktop $usuario/Desktop
rm $usuario/RXF_SOLOFUSION.desktop

frecuencia=$(awk "NR==5" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_DSTAR.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DSTAR.desktop
cd $usuario
cp RXF_DSTAR.desktop $usuario/Desktop
rm $usuario/RXF_DSTAR.desktop

frecuencia=$(awk "NR==6" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_C4FM.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_C4FM.desktop
cd $usuario
cp RXF_C4FM.desktop $usuario/Desktop
rm $usuario/RXF_C4FM.desktop

frecuencia=$(awk "NR==13" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_YSF2DMR.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_YSF2DMR.desktop
cd $usuario
cp RXF_YSF2DMR.desktop $usuario/Desktop
rm $usuario/RXF_YSF2DMR.desktop

frecuencia=$(awk "NR==14" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_DMR2YSF.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2YSF.desktop
cd $usuario
cp RXF_DMR2YSF.desktop $usuario/Desktop
rm $usuario/RXF_DMR2YSF.desktop

frecuencia=$(awk "NR==15" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_DMR2NXDN.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2NXDN.desktop
cd $usuario
cp RXF_DMR2NXDN.desktop $usuario/Desktop
rm $usuario/RXF_DMR2NXDN.desktop

frecuencia=$(awk "NR==17" $usuario/INFO_RXF)
cd $usuario/Desktop/
cp RXF_NXDN.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_NXDN.desktop
cd $usuario
cp RXF_NXDN.desktop $usuario/Desktop
rm $usuario/RXF_NXDN.desktop
#=================================================================================

sudo chmod 777 -R $usuario/Desktop

sleep 2
estado_dvswitch=$(awk "NR==18" /home/pi/status.ini)
if [ "$estado_dvswitch" = 'DVSWITCH=OFF' ];then
sudo systemctl stop ysfgateway.service
sudo systemctl stop dmr2ysf.service

sudo systemctl stop analog_bridge.service
sudo systemctl stop ircddbgateway.service
sudo systemctl stop md380-emu.service
sudo systemctl stop mmdvm_bridge.service
sudo systemctl stop nxdngateway.service
else
echo ""
fi
sudo rm -R /home/pi/V105/associacioader.com
sudo rm -R /home/pi/V105/Desktop/associacioader.com
sudo rm /home/pi/V105/Desktop/st-data
sudo rm /home/pi/Desktop/st-data










