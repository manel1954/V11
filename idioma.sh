#!/bin/bash
clear
while true
do
clear

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)

#Colores
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
MARRON="\33[38;5;138m"

echo "${VERDE}"
echo "   **************************************************************************"
echo -n "${CIAN}"
echo "                Script para cambiar lenguaje/Script to change language      "
echo -n "${ROJO}"
echo "                                  $SCRIPTS_version by EA3EIZ"
echo -n "${VERDE}"
echo "   **************************************************************************"
echo ""
echo  "${CIAN}   1)${AMARILLO} Establecer idioma Español"
echo ""
echo  "${CIAN}   2)${AMARILLO} Set English language"
echo ""
echo "   ${ROJO}0) Salir/Exit"
echo ""
echo -n "\33[1;36m   Elige una opción/Choose an option: " 

read escoger_menu
case $escoger_menu in
1) echo ""
while true
do

clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  ADVERTENCIA!!                               "
echo ""
echo -n "${ROJO}"
echo "                   AL CAMBIAR DE IDIOMA SE REINICIARÁ EL SISTEMA               "
                           
echo "                            PARA GUARDAR LOS CAMBIOS                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	

echo "${CIAN}"
read -p '   Quieres cambiar de idioma? S/N ' actualizar   

                        case $actualizar in
                        [sS]* ) echo ""
                        sed -i "1c Spanish" /home/pi/.local/idioma
                        sudo sed -i "5c Icon=/home/pi/V11/ICONO_SPANISH.png" /home/pi/V11/Desktop/Idioma.desktop
                        sudo sed -i "11c Name=Editar BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo sed -i "11c Name[es_ES]=SOLO FUSION" /home/pi/V11/Desktop/Abrir_solofusion.desktop
                        sudo sed -i "11c Name[es_ES]=SOLO  DSTAR" /home/pi/V11/Desktop/Abrir_solodstar.desktop

                        sudo reboot
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;   
2) echo ""
while true
do

clear
echo "${BLANCO}"
echo "   ***************************************************************************"
echo "${VERDE}"
echo "                                  WARNING!!                               "
echo ""
echo -n "${ROJO}"
echo "                   CHANGING THE LANGUAGE WILL RESTART THE SYSTEM               "
                           
echo "                              TO SAVE CHANGES                          "
echo "${BLANCO}"
echo "   ***************************************************************************"	

echo "${CIAN}"
read -p '   You want to change language? Y/N ' actualizar   

                        case $actualizar in
                        [yY]* ) echo ""
                        sed -i "1c English" /home/pi/.local/idioma
                        sudo sed -i "5c Icon=/home/pi/V11/ICONO_ENGLISH.png" /home/pi/V11/Desktop/Idioma.desktop
                        sudo sed -i "11c Name=Edit BM" /home/pi/V11/Desktop/Editar_MMDVMBM.desktop
                        sudo sed -i "11c Name[es_ES]=ONLY FUSION" /home/pi/V11/Desktop/Abrir_solofusion.desktop
                        sudo sed -i "11c Name[es_ES]=ONLY  DSTAR" /home/pi/V11/Desktop/Abrir_solodstar.desktop
                        sudo sed -i "10c Name[es_ES]=Update IMAGE" /home/pi/V11/Desktop/Actualiza_imagen.desktop
                        sudo sed -i "10c Name[es_ES]=Restart IMAGE" /home/pi/V11/Desktop/Reinciar_Imagen.desktop
                        sudo sed -i "10c Name[es_ES]=Turn Off IMAGE" /home/pi/V11/Desktop/Apagar_Imagen.desktop
                        sudo sed -i "10c Name[es_ES]=EXTRA MENU" /home/pi/V11/Desktop/Menu_extra.desktop
                        sudo sed -i "10c Name[es_ES]=Update MMDVM" /home/pi/V11/Desktop/Actualizar_MMDVMHost.desktop
                        sudo sed -i "10c Name[es_ES]=Update IDS" /home/pi/V11/Desktop/Actualizar_IDS.desktop
                        sudo sed -i "10c Name[es_ES]=COPY RESTORE" /home/pi/V11/Desktop/Copiar_Restaurar.desktop
                        sudo sed -i "11c Name[es_ES]=AUTO START" /home/pi/V11/Desktop/Menu_Autoarranque.desktop
                        sudo sed -i "7c Name[es_ES]=Delete  LOGS" /home/pi/V11/Desktop/Borrar_Logs.desktop
                        sudo sed -i "11c Name[es_ES]=Edit DMR+" /home/pi/V11/Desktop/Editar_DMRPLUS.desktop
                        sudo sed -i "10c Name[es_ES]=Edit Radio" /home/pi/V11/Desktop/Editar_Radio.desktop
                        sudo sed -i "11c Name[es_ES]=Edit Especial" /home/pi/V11/Desktop/Editar_ESPECIAL.desktop
                        sudo sed -i "11c Name[es_ES]=Edit Only FUSION" /home/pi/V11/Desktop/Editar_solofusion.desktop
                        sudo sed -i "4c Name[es_ES]=Edit only DSTAR" /home/pi/V11/Desktop/Editar_solodstar.desktop
                        sudo sed -i "8c Name[es_ES]=Edit YSF FCS & YCS" /home/pi/V11/Desktop/Editar_C4FM.desktop
                        sudo sed -i "10c Name[es_ES]=Update Rooms YSF" /home/pi/V11/Desktop/Actualizar_salas_YSF.desktop
                        sudo sed -i "11c Name[es_ES]=Update DV4mini" /home/pi/V11/Desktop/Actualizar_DV4mini.desktop
                        sudo sed -i "10c Name[es_ES]=Edit DExtra" /home/pi/V11/Desktop/Editar_DExtra_Bluedv.desktop
                        sudo sed -i "11c Name[es_ES]=Update BlueDV" /home/pi/V11/Desktop/Actualizar_BlueDV.DESKTOP
                        sudo sed -i "10c Name[es_ES]=Edit BlueDV" /home/pi/V11/Desktop/Editar_DMRPLUS.desktop
                        sudo sed -i "11c Name[es_ES]=Edit DMR+" /home/pi/V11/Desktop/Editar_BLUEDV.desktop
                        sudo sed -i "7c Name[es_ES]=Edit ircDDB" /home/pi/V11/Desktop/Configuraar_ircddb.desktop
                        sudo sed -i "11c Name[es_ES]=Edit REPEATER" /home/pi/V11/Desktop/Editar_D-STAR_Repeater.desktop
                        #sudo sed -i "11c Name[es_ES]=Edit DMR+" /home/pi/V11/Desktop/Editar_DMRPLUS.desktop
                        #sudo sed -i "11c Name[es_ES]=Edit DMR+" /home/pi/V11/Desktop/Editar_DMRPLUS.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        #sudo sed -i "10c Name[es_ES]=Update IMAGEN" /home/pi/V11/Desktop/Actualizar_imagen.desktop
                        sudo reboot
                        break;;
                        [nN]* ) echo ""
                        break;;
esac
done;;
0) echo ""
exit;;	
esac
done

