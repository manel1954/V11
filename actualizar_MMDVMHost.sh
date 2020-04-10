E567U-   452#!/bin/bash
# -*- ENCODING: UTF-8 -*-
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

                    echo "${ROJO}"
                    echo " *********************************************************************"
                    echo " * Si actualizas MMDVMhost desde esta opción, perderás todas las     *"
                    echo " * configuraciones y tendrás que volver a configurar los .ini        *"
                    echo " *********************************************************************"
                    
                    echo "${BLANCO}"
                    echo " *********************************************************************"
                    echo " * Haz antes una copia de seguridad desde el icono COPIAR RESTAURAR   *"
                    echo " * O desde un navegador poniendo la ip de la raspberry pi y luego     *"
                    echo " * utiLiza el icono HACER COPIA SEGURIDAD el cual te creará           *"
                    echo " * el archivo [copia.tar.gz] en la carpeta Downloads de tu ordenador  *"
                    echo " *********************************************************************"                    

                    echo "${VERDE}"
                    read -p '  Quieres hacer la actualización? S/N: ' ejecutar1
                    case $ejecutar1 in
                    [sS]* ) echo ""
                    echo "ok >>>>>"
                    cd /home/pi 
                    sudo rm -r /home/pi/MMDVMHost
                    git clone https://github.com/g4klx/MMDVMHost
                    #git clone https://github.com/ea3eiz/MMDVMHost
                    cd /home/pi/MMDVMHost

                    HOY=$(date +%Y%m%d)
                    FIJA="const char* VERSION = "\"
                    PI="ADER104"\"
                    HOY1=$HOY$PI
                    PUNTO=";"   
                    
                    sed -i "22c $FIJA$HOY1$PUNTO" /home/pi/MMDVMHost/Version.h



                    cp /home/pi/$SCRIPTS_version/YSFControl.cpp /home/pi/MMDVMHost



                    make clean
                    make

                    #Instala la secion [NextionDriver] en todos los .ini y todas sus memorias
                    cd /home/pi/NextionDriverInstaller
                    sudo ./NextionDriver_ConvertConfig /home/pi/MMDVMHost/MMDVM.ini
                    sleep 2                  
                    
                    # Crea los ejecutables para estas aplicaciones 
                    cd /home/pi/MMDVMHost
                    cp MMDVMHost MMDVMBM
                    cp MMDVMHost MMDVMPLUS
                    cp MMDVMHost MMDVMDSTAR
                    cp MMDVMHost MMDVMFUSION
                    cp MMDVMHost DMR2NXDN
                    cp MMDVMHost DMR2YSF
                    cp MMDVMHost MMDVMNXDN
                    cp MMDVMHost MMDVMESPECIAL
                    #=================================================

                    # Rutina solo para el LIBRE ======================
                    #cd /home/pi/$SCRIPTS_version
                    #cp MMDVMHostLIBRE /home/pi/MMDVMHost
                    #cp MMDVMLIBRE.ini /home/pi/MMDVMHost
                    #cd /home/pi/MMDVMHost
                    #sudo chmod +x MMDVMHostLIBRE
                    #=================================================

                    
                    # Crea el fichero para que arranque NextionDriver ==================
                    cp MMDVM.ini MMDVM.ini_NextionDriver

                    # Crea los ficheros .ini y Memorias ==================
                    cp MMDVM.ini MMDVM.ini_original
                    cp MMDVM.ini MMDVM.ini_copia
                    cp MMDVM.ini MMDVM.ini_copia2
                    cp MMDVM.ini MMDVM.ini_copia3

                    cp MMDVM.ini MMDVMBM.ini
                    cp MMDVM.ini MMDVMBM.ini_copia
                    cp MMDVM.ini MMDVMBM.ini_copia2
                    cp MMDVM.ini MMDVMBM.ini_copia3

                    cp MMDVM.ini MMDVMPLUS.ini
                    cp MMDVM.ini MMDVMPLUS.ini_copia
                    cp MMDVM.ini MMDVMPLUS.ini_copia2
                    cp MMDVM.ini MMDVMPLUS.ini_copia3

                    cp MMDVM.ini MMDVMDSTAR.ini
                    cp MMDVM.ini MMDVMDSTAR.ini_copia
                    cp MMDVM.ini MMDVMDSTAR.ini_copia2
                    cp MMDVM.ini MMDVMDSTAR.ini_copia3

                    cp MMDVM.ini MMDVMFUSION.ini
                    cp MMDVM.ini MMDVMFUSION.ini_copia
                    cp MMDVM.ini MMDVMFUSION.ini_copia2
                    cp MMDVM.ini MMDVMFUSION.ini_copia3  

                    cp MMDVM.ini MMDVMESPECIAL.ini
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia2
                    cp MMDVM.ini MMDVMESPECIAL.ini_copia3                

                    cp MMDVM.ini TODOS_LOS_INIS.ini

                    cp MMDVM.ini MMDVMDMR2YSF.ini
                    
                    cp MMDVM.ini MMDVMDMR2NXDN.ini

                    cp MMDVM.ini MMDVMNXDN.ini

                    #=================================================

                    sudo chmod +x -R /home/pi/MMDVMHost
                    
                    echo""
                    clear
                    exit;
                    echo ""
                    echo "Ok, se ha ejecutado correctamente"
                    echo ""
                    ;;
                    [nN]* ) echo ""
                    ;;
                    esac
                    sleep 1
                    clear
                    exit;
