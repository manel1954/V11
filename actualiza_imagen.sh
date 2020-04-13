#!/bin/bash
# path usuario
usuario=$(awk "NR==1" /home/pi/.config/autostart/usuario)
SCRIPTS_version=$(awk "NR==1" $usuario/.config/autostart/version)
version=`expr substr $SCRIPTS_version 2 2`
AUTOARRANQUE="AUTOARRANQUE"
AUTOARRANQUE=$AUTOARRANQUE$SCRIPTS_version
#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${CIAN}"
echo "********************************************************************************"
echo -n "${BLANCO}"
echo "                         ACTUALIZANDO POSIBLES CAMBIOS                             "
echo -n "${VERDE}"
echo "                             EN LA IMAGEN ADER ${AMARILLO}$SCRIPTS_version${VERDE} "
echo -n "${CIAN}"
echo "********************************************************************************"
echo "${GRIS}"
sleep 2

			# 01-04-2020 arregla no escribe port en FCS.ini
			#sudo cp $usuario/V11/cambia_configuracion_port.php /var/www/html/

                        # 03-04-2012020 añade el options manual para DMR+
                        #sudo cp $usuario/V11/sistema_plus.php /var/www/html/
                        #sudo cp $usuario/V11/cambia_reflector_dmrplus.php /var/www/html/
                        #sudo cp $usuario/V11/cambia_options_dmrplus.php /var/www/html/
                        #sudo cp $usuario/V11/panel_configuracion.php /var/www/html/


                        # 09-04-2020 copia YSFGateway.ini
                        #comprueba=$(awk "NR==21" $usuario/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini)
                        #if [ "$comprueba" = 'YSFGateway_OK' ];then 
                        #eho "No copia el fichero YSFGateway.ini"                       
                        #else
                        #cp $usuario/V11/YSFGateway.ini /$usuario/YSFClients/YSFGateway/
                        #sudo sed -i "21c YSFGateway_OK" $usuario/.local/versiones_YSF2DMR_DMR2YSF_DMR2NXDN.ini                        
                        #fi

#Actualiza IMAGEN
                        cd $usuario/$SCRIPTS_version
                        git pull
                        sleep 1

#Actualiza AUTORRANQUEV104
                        cd $usuario/AUTOARRANQUEV104
                        git pull
                        sleep 1

#Lee el fichero INFO_RXF para poner los datos en los iconos INFO TXF 
frecuencia=$(awk "NR==1" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_BM.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_BM.desktop
cd $usuario
sudo cp RXF_BM.desktop $usuario/Desktop
sudo rm $usuario/RXF_BM.desktop

frecuencia=$(awk "NR==2" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_DMRPLUS.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMRPLUS.desktop
cd $usuario
sudo cp RXF_DMRPLUS.desktop $usuario/Desktop
sudo rm $usuario/RXF_DMRPLUS.desktop

frecuencia=$(awk "NR==14" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_DMR2YSF.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_DMR2YSF.desktop
cd $usuario
sudo cp RXF_DMR2YSF.desktop $usuario/Desktop
sudo rm $usuario/RXF_DMR2YSF.desktop

frecuencia=$(awk "NR==17" $usuario/INFO_RXF)
cd $usuario/Desktop/
sudo cp RXF_NXDN.desktop $usuario/
sed -i "11c Name=$frecuencia" $usuario/RXF_NXDN.desktop
cd $usuario
sudo cp RXF_NXDN.desktop $usuario/Desktop
sudo rm $usuario/RXF_NXDN.desktop

clear
echo "${VERDE}"
echo "\v\v\v\v\v"
echo "   *************************************************************************"
echo "   *************************************************************************"
echo "   **************************  ${BLANCO}IMAGEN ACTUALIZADA ${VERDE}**************************"
echo "   *************************************************************************"
echo "   *************************************************************************"
sleep 1
clear
echo "${BLANCO}"
echo "\v\v\v\v\v"
echo "   *************************************************************************"
echo "   *************************************************************************"
echo "   **************************  ${VERDE}IMAGEN ACTUALIZADA ${BLANCO}**************************"
echo "   *************************************************************************"
echo "   *************************************************************************"
sleep 1
clear
echo "${VERDE}"
echo "\v\v\v\v\v"
echo "   *************************************************************************"
echo "   *************************************************************************"
echo "   **************************  ${BLANCO}IMAGEN ACTUALIZADA ${VERDE}**************************"
echo "   *************************************************************************"
echo "   *************************************************************************"
sleep 3