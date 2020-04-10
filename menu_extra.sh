#!/bin/bash

while true
do
clear
usuario="/home/pi"
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
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
echo "${VERDE}"
echo "   ************************************************************************"
echo -n "${CIAN}"
echo "     Script para Actualizar, instalar programas y ejecutar aplicaciones    "
echo -n "${ROJO}"
echo "                              $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   ************************************************************************"
#echo "\33[1;36m   1)\33[1;37m Actualizar imagen"
echo "\33[1;36m   1)${BLANCO} Actualizar Dvswitch"
echo "\33[1;36m   2)${AMARILLO} Actualizar ${AMARILLO}YSF,${AMARILLO} YSF2DMR, DMR2YSF, DMR2NXDN y NXDNClients"
echo ""
echo "\33[1;32m      APARTADO BLUETOOTH"
echo "\33[1;32m      =================="
echo "\33[1;36m   3)\33[1;33m Activar el Bluetooth (en la imagen viene desactivado por defecto)"
echo "\33[1;36m   4)\33[1;33m Desactivar Bluetooth (esto habilita el puerto /dev/ttyAMA0)"
echo "\33[1;36m   5)\33[1;32m PDF con las instrucciones para emparejar el Bluetooth"
echo "\33[1;36m   6)\33[1;37m Anclar el puerto rfcomm0 para conectar el Bluetooth para siempre"
echo "\33[1;36m   7)\33[1;37m Anclar el puerto rfcomm1 para conectar el Bluetooth para siempre"
echo "\33[1;32m      =================="
echo ""
echo "${CIAN}   8)${AMARILLO} Instalar Anydesk"
echo "${CIAN}   9)${BLANCO} Grabar pantalla Nextion"
echo "${CIAN}  10)${VERDE} Menú Actualizar MMDVM_HS Libre kit y ZUMSpot"
echo "${CIAN}  11)${CIAN} Configuración especial de Red"

echo ""
echo "${CIAN}  12)${BLANCO} RESET (RESTAURA IMAGEN DE FABRICA)"
echo ""
echo "   ${ROJO}0) Salir"
echo ""
echo -n "\33[1;36m   Elige una opción: " 
read escoger_menu
echo ""
case $escoger_menu in
a) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        #=================================================================================

#Actualiza todos los iconos y Quita todos los iconos verdes que se quedan al cerrar la imagen


sudo cp $usuario/Desktop/Activar_dvswitch.desktop $usuario/.local #deja el icono en el estado que se reinició
sudo cp $usuario/Desktop/Activar_NextionDriver.desktop $usuario/.local #deja el icono en el estado que se reinició
#sudo cp $usuario/Desktop/Abrir_ircDDBGateway.desktop $usuario #deja con el terminal en el estado que se reinició
#sudo cp $usuario/Desktop/Abrir_D-STARRepeater.desktop $usuario #deja con el terminal en el estado que se reinició


cd $usuario/$SCRIPTS_version/Desktop
cp * $usuario/Desktop
sudo chmod 777 -R $usuario/Desktop


sudo cp $usuario/.local/Activar_dvswitch.desktop $usuario/Desktop #deja el icono en el estado que se reinició
sudo cp $usuario/.local/Activar_NextionDriver.desktop $usuario/Desktop #deja el icono en el estado que se reinició
#sudo cp $usuario/Abrir_ircDDBGateway.desktop $usuario/Desktop #deja con el terminal en el estado que se reinició
#sudo cp $usuario/Abrir_D-STARRepeater.desktop $usuario/Desktop #deja con el terminal en el estado que se reinició

#=================================================================================
sleep 2
exit;                
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
1) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        echo "\v\v\v\v\v\v\v\v\v\v"
                        echo "${ROJO}"
                        echo "   ************************************************************************"
                        echo "   *********************                              *********************" 
                        echo "   *********************    NO HAY ACTUALIZACIONES    *********************"
                        echo "   *********************                              *********************"
                        echo "   ************************************************************************"
                        sleep 5
sleep 2
exit;                
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
2) echo ""
while true
do
clear                     
                        instalarsi=S
                        case $instalarsi in
                        [sS]* ) echo ""
                        clear
                        cd /home/pi/$SCRIPTS_version/
                        sh actualiza_YSF_YSF2DMR_DMR2YSF_DMR2NXDN_NXDNClients.sh                  
                        break;;
                        [nN]* ) echo ""
                        clear
                        exit;
                        break;;
esac
done;;
3) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ****************************************************"
echo "   *            SI SE ACTIVA EL BLUETOOTH             *"
echo "   * EL DVMEGA PINCHADO EN LA RASPBERRY NO FUNCIONARÁ *"
echo "   * SE REINICIARÁ EL SISTEMA PARA APLICAR EL CAMBIO  *"
echo "   ****************************************************"
echo ""
echo "${VERDE}"                                               
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
	                        case $seguir in
			            [sS]* ) echo ""
					echo "ACTIVANDO BLUETOOTH"
					sed -i "57c #dtoverlay=pi3-disable-bt" /boot/config.txt
			            sudo reboot
                              break;;
		                  [nN]* ) echo ""
clear
break;;
esac
done;;
4) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ***************************************************"
echo "   *         SI SE DESACTIVA EL BLUETOOTH            *"
echo "   * SE REINICIAR EL SISTEMA PARA APLICAR EL CAMBIO  *"
echo "   ***************************************************"
echo "" 
echo "${VERDE}"                                              
read -p ' QUIERES SEGUIR CON EL CAMBIO S/N: ' seguir
                        case $seguir in
                        [sS]* ) echo ""
                        echo "DESACTIVANDO BLUETOOTH"
                        sed -i "57c dtoverlay=pi3-disable-bt" /boot/config.txt
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
clear
break;;
esac
done;;
5) echo ""
while true
do
clear

	                	ejecutar1=S
		    			case $ejecutar1 in
						[sS]* ) echo ""
						echo ">>>>>>>>> EMPAREJAR BLUETOOTH >>>>>>>>"
                        cd /home/pi/SCRIPTS_version
                        evince ./EMPAREJAR_BLUETOOTH.pdf
                        clear
                        exit;
						break;;
						[nN]* ) echo ""
						clear
						exit;
						break;;
esac
done;;
6) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
						#sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar.sh;sudo rfcomm bind /dev/rfcomm0 $mac'" /home/pi/.config/autostart/actualizar.desktop
						sudo sed -i "2c sudo rfcomm bind /dev/rfcomm0 $mac" /home/pi/.local/bluetooth.sh

                        clear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm0   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo " "
clear
exit;
break;;
esac
done;;
7) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
		                [sS]* ) echo "\33[1;32m<<<< ESCANEANDO DISPOSITIVOS BLUETOOTH >>>>"
						echo ""
						echo "\33[1;36m" # color Cian
						sudo hcitool scan
						echo "\33[1;32m" #color verde
						echo "Copia la mac del modulo Bluetooth HC-05 para pegarla en el siguiente paso"
						echo ""
						echo "\33[1;33m" #amarillo
			            echo "PEGA LA MAC DE TU BLUETOOTH aquí y pulsa Enter"	          		            
			            read mac
					    #sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version;sudo sh actualizar_02_07_06.sh;sudo rfcomm bind /dev/rfcomm1 $mac'" /home/pi/.config/autostart/actualizar.desktop
                        sudo sed -i "3c sudo rfcomm bind /dev/rfcomm1 $mac" /home/pi/.local/bluetooth.shclear
						echo ""
						echo ""
						echo ""
						echo "\33[1;31m" #color rojo
						echo "********************************************************************"
						echo "* SE NECESITA REINICIAR EL SISTEMA PARA ANCLAR EL PUERTO rfcomm1   *"
						echo "********************************************************************"
						echo "\33[1;37m" #color
						echo "Pulsa Enter para salir"
			            read a
			            break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
8) echo ""
while true
do
clear
                        echo "${VERDE}"
                        echo "*************************************************"
                        echo "*  ${ROJO}ADVERTENCIA!!!${VERDE}                               *"
                        echo "*  ${ROJO}AL INSTALAR ANYDESK SE REINICIARÁ EL SISTEMA${VERDE} *"
                        echo "*************************************************"
                        echo "${CIAN}" 
                        read -p 'Quieres instalar Anydesk ? S/N ' actualizar                                              
                        case $actualizar in
                        [sS]* ) echo ""
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*           INSTALANDO ANYDESK            *"
                        echo "*******************************************"
                        sleep 2  
                        sudo rm -R /home/pi/.anydesk
                        mkdir /home/pi/.temp
                        cd /home/pi/.temp
                        wget http://download.anydesk.com/rpi/anydesk_2.9.4-1_armhf.deb
                        sudo dpkg -i anydesk_2.9.4-1_armhf.deb
                        sudo apt-get install -f
                        sudo rm /home/pi/.local/RESTAURAR/Downloads/anydesk_2.9.4-1_armhf.deb
                        clear
                        echo "${VERDE}"
                        echo "*******************************************"
                        echo "*        SE HA INSTALADO ANYDESK          *"
                        echo "*******************************************"
                        sleep 2
                        clear
                        # echo "${ROJO}"
                        # echo "*******************************************"
                        # echo "*        SE REINICIARÁ EL SISTEMA         *"
                        # echo "*******************************************"
                        # sleep 2
                        # clear
                        # echo "${AMARILLO}"
                        # echo "*******************************************"
                        # echo "*        SE REINICIARÁ EL SISTEMA         *"
                        # echo "*******************************************"
                        # sleep 2
                        # clear
                        # echo "${ROJO}"
                        # echo "*******************************************"
                        # echo "*        SE REINICIARÁ EL SISTEMA         *"
                        # echo "*******************************************"
                        #sudo reboot
                        break;;
                        [nN]* ) 
                        echo ""
clear
exit;
break;;
esac
done;;
9) echo ""
while true
do
clear
	                    ejecutar1=S
		                case $ejecutar1 in
			            [sS]* ) echo ""
			            echo ">>>>>>>>> GRABAR NEXTION ORIGINAL >>>>>>>>"
                        sudo sh grabar_nextion_05.sh
                        exit;
		                break;;
		                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
10) echo ""
while true
do
clear
                                ejecutar1=S
                                case $ejecutar1 in
                                [sS]* ) echo ""

echo "${AMARILLO}"
echo "   *********************************************************************"
echo "   * Haz clik en el icono donde tengas conectado el pincho             *"
echo "   * una vez se abra la consola mostrando que se conectó correctamente *"
echo "   * cierra dicha consola y utiliza el MENÚ que te aparecerá           *"
echo "   *********************************************************************"
echo "${VERDE}"
echo -n "    Pulsa una tecla para seguir "
read a
                                sh flash_mmdvm_hs.sh
                                echo ""
                                break;;
                                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
11) echo ""
while true
do
clear
                                ejecutar1=S
                                case $ejecutar1 in
                                [sS]* ) echo ""
                                sh Configuracion_especial_red.sh
                                echo ""
                                break;;
                                [nN]* ) echo ""
clear
exit;
break;;
esac
done;;
12) echo ""
while true
do
clear
echo "${ROJO}"
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "   *                     RESTAURAR IMAGEN DE FABRICA                      *"
echo "   *                     TAL CUAL GRABASTES EN SU DÍA                     *"
echo "   *                                                                      *"
echo "   ************************************************************************"
echo ""
                    echo "${VERDE}"                                               
                    read -p '   QUIERES SEGUIR S/N: ' seguir
                    case $seguir in
                    [sS]* ) echo ""
                    cp -R /home/pi/.local/RESTAURAR/Downloads /home/pi
                    cp /home/pi/.local/RESTAURAR/INFO_RXF /home/pi
                    cp /home/pi/.local/RESTAURAR/info_panel_control.ini /home/pi
                    cp /home/pi/.local/RESTAURAR/status.ini /home/pi
                    cp /home/pi/.local/RESTAURAR/autoarranque.ini /home/pi
                    cp /home/pi/.local/RESTAURAR/tg_ysf.txt /home/pi
                    cp /home/pi/.local/RESTAURAR/nombre_salas_ysf.txt /home/pi                       
                        
                        cd /home/pi/.config/autostart
                        sudo rm IRCDDB.desktop
                        sudo rm BM.desktop
                        sudo rm BLUEDV.desktop
                        sudo rm YSF.desktop
                        sudo rm DV4MINI.desktop
                        sudo rm RADIO.desktop
                        sudo rm DMRPLUS.desktop
                        sudo rm LIBRE.desktop
                        sudo rm SVXLINK.desktop
                        sudo rm DSTARSOLO_05.desktop
                        sudo rm FUSIONSOLO.desktop
                        sudo rm DVRPTR.desktop
                        sudo rm YSF2DMR.desktop
                        sudo rm dstarrepeater.desktop
                        sudo rm AMBE_SERVER.desktop
                        sudo rm DMR2YSF.desktop
                        sudo rm DMR2NXDN.desktop
                        sudo rm NXDN.desktop
clear
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo ""
echo "   ************************************************************************"
echo "                  SE ESTÁ REALIZANDO LA RESTAURACIÓN   "
echo "   ************************************************************************"
sleep 3
            cd /home/pi/.local/RESTAURAR/Downloads
            cp -f TODOS_LOS_INIS.ini /home/pi/MMDVMHost

            cp -f MMDVM.ini /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVM.ini_copia3 /home/pi/MMDVMHost
            cp -f MMDVM.ini_original /home/pi/MMDVMHost

            cp -f MMDVMBM.ini /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMBM.ini_copia3 /home/pi/MMDVMHost

            cp -f MMDVMPLUS.ini /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMPLUS.ini_copia3 /home/pi/MMDVMHost

            cp -f MMDVMESPECIAL.ini /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia2 /home/pi/MMDVMHost
            cp -f MMDVMESPECIAL.ini_copia3 /home/pi/MMDVMHost

            #solo Dstar y solo Fusion
            cp -f MMDVMDSTAR.ini /home/pi/MMDVMHost
            cp -f MMDVMFUSION.ini /home/pi/MMDVMHost
            #fin  Dstar y solo Fusion

            cp -f YSF2DMR.ini /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_01 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_02 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_03 /home/pi/YSF2DMR
            cp -f YSF2DMR.ini_copia_04 /home/pi/YSF2DMR
            
            cp -f TG-YSFList.txt /home/pi/DMR2YSF

            cp -f MMDVMDMR2NXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMNXDN.ini /home/pi/MMDVMHost
            cp -f MMDVMDMR2YSF.ini /home/pi/MMDVMHost

            cp -f DMR2NXDN.ini  /home/pi/DMR2NXDN
            cp -f NXDNGateway.ini /home/pi/NXDNClients/NXDNGateway
            cp -f DMR2YSF.ini /home/pi/DMR2YSF

            sudo cp -f YSFGateway.ini /home/pi/YSFClients/YSFGateway

            sudo cp -f BlueDVconfig.ini /home/pi/bluedv

            sudo cp -f svxlink.conf /usr/local/etc/svxlink
            
            sudo cp -f ModuleEchoLink.conf /usr/local/etc/svxlink/svxlink.d

            sudo cp ircddbgateway /usr/local/etc/opendv
            sudo cp dstarrepeater /usr/local/etc/opendv

            cp info_panel_control.ini /home/pi

# Restaura todos los datos de Dvswitch
indicativo=$(awk "NR==1" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)          
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "2c Callsign=$indicativo" /opt/NXDNGateway.ini
sudo sed -i "2c gatewayCallsign=$indicativo" /etc/ircddbgateway
sudo sed -i "95c ircddbUsername=$indicativo" /etc/ircddbgateway
sudo sed -i "117c dplusLogin=$indicativo" /etc/ircddbgateway
sudo sed -i "2c Callsign=$indicativo" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

id=$(awk "NR==3" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
id_nxdn=`expr substr $id 3 5`
sudo sed -i "30c ID = $id" /opt/MMDVM_Bridge/DVSwitch.ini
sudo sed -i "40c FallbackID = $id" /opt/MMDVM_Bridge/DVSwitch.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/dmr.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/dstar.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/especial.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "43c ;; FallbackID = $id_nxdn" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "44c ;; NXDNFallbackID = $id_nxdn" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/ysf.ini
sudo sed -i "43c ;; FallbackID = $id" /opt/Analog_Bridge/ysf.ini
sudo sed -i "38c gatewayDmrId = $id" /opt/Analog_Bridge/FCS.ini

id2=$(awk "NR==4" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/dmr.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/dstar.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/especial.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/ysf.ini
sudo sed -i "39c repeaterID = $id2" /opt/Analog_Bridge/FCS.ini
sudo sed -i "3c Id=$id2" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

Latitude=$(awk "NR==5" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "11c Latitude=$Latitude" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

Longitude=$(awk "NR==6" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "12c Longitude=$Longitude" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

port=$(awk "NR==7" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/dmr.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/dstar.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/especial.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "55c txPort = $port" /opt/Analog_Bridge/ysf.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/Analog_Bridge.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/dmr.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/dstar.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/especial.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/nxdn.ini
sudo sed -i "56c rxPort = $port" /opt/Analog_Bridge/ysf.ini


location=$(awk "NR==8" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "14c $location" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/especial.ini
#sudo sed -i "17c $location" /opt/NXDNGateway.ini
sudo sed -i "14c $location" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

url=$(awk "NR==9" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/MMDVM_Bridge.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/brandmeister_esp.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/dmrplus.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/especial.ini
sudo sed -i "16c URL=$url" /opt/MMDVM_Bridge/MMDVM_Bridge_FCS.ini

address_especial=$(awk "NR==2" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "70c $address_especial" /opt/MMDVM_Bridge/especial.ini

password_especial=$(awk "NR==10" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "74c $password_especial" /opt/MMDVM_Bridge/especial.ini

port_especial=$(awk "NR==11" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "71c $port_especial" /opt/MMDVM_Bridge/especial.ini

sala_fcs=$(awk "NR==12" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "40c txTg = $sala_fcs" /opt/Analog_Bridge/FCS.ini
sudo sed -i "42c Startup=$sala_fcs" /home/pi/YSFClients/YSFGateway/YSFGateway.ini


sala_nxdn=$(awk "NR==13" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "10c $sala_nxdn" /opt/NXDNClients/NXDNGateway/private/NXDNHosts.txt

selfcare=$(awk "NR==14" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "74c $selfcare" /opt/MMDVM_Bridge/brandmeister_esp.ini

reflector_dstar=$(awk "NR==15" /home/pi/.local/RESTAURAR/Downloads/datos_dvswitch)
sudo sed -i "18c $reflector_dstar" /etc/ircddbgateway

sudo sed -i "4c #Exec=sh -c 'cd $usuario/NextionDriver/;sudo ./NextionDriver -c $usuario/MMDVMHost/MMDVM.ini'" $usuario/.config/autostart/nextiondriver.desktop

echo ""
echo "${CIAN}"
echo "   ************************************************************************"
echo "                        SE ESTÁ DESINSTALANDO ANYDESK                      "
echo "   ************************************************************************"
sleep 3

sudo apt purge anydesk

cd $usuario/$SCRIPTS_version/Desktop
cp * $usuario/Desktop

cd $usuario/$SCRIPTS_version
git pull

cd /home/pi
sh colocar_iconos.sh

sudo rm -rf /home/pi/.local/share/Trash/*

sudo rm /var/www/html/upload/files/copia.tar.gz

sudo rm .bash_history

clear
echo ""
echo "${AMARILLO}"
echo "   ************************************************************************"
echo "${ROJO}"
echo "                        REINICIANDO EL SISTEMA   "
echo "${AMARILLO}"
echo "   ************************************************************************"

sleep 3

 sudo reboot
                    break;;
                    [nN]* ) 
                    echo ""

clear
break;;
esac
done;;
0) echo ""
clear
echo "${AMARILLO}"
echo "   ************************************************************************"
echo "   *                                                                      *"
echo "   *                          CERRANDO SCRIPT                             *"
echo "   *                                                                      *"
echo "   ************************************************************************"
sleep 2
clear
exit;;	
esac
done
