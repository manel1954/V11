#!/bin/bash
clear
ROJO="\033[1;31m"
VERDE="\033[1;32m"
BLANCO="\033[1;37m"
AMARILLO="\033[1;33m"
CIAN="\033[1;36m"
GRIS="\033[0m"
echo "${VERDE}"
echo "   *************************************************************************"
echo "   *                                                                       *"
echo "   *       El editor ircDDb puede tardar varios segundos en abrir          *"
echo "   *           dependiendo de la velocidad de su raspberry pi              *"
echo "   *             Por favor sea paciente y espere que se abra               *"
echo "   *                                                                       *"
echo "   *************************************************************************"
echo "${BLANCO}"
echo "   *************************************************************************"
echo "   *                                                                       *"
echo "   *    Esta ventana se cerrará sola cuando termine de editar el ircDDB    *"
echo "   *                                                                       *"
echo "   * ${ROJO}                  IMPORTANTE!!! NO LA CIERRE ANTES                    ${BLANCO}*"
echo "   * ${BLANCO}                                                                      *"
echo "   *************************************************************************"
echo ""

#abre el editor ircDDB
sudo ircddbgatewayconfig








