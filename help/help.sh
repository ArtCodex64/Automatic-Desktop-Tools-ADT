#!/bin/bash

################################################################################
################################################################################
################################################################################
#HELP PANEL
################################################################################
################################################################################
################################################################################
function help_panel(){
echo -e "${greenColour}[*]${endColour} ${grayColour}Bienvenido !${endColour}"
echo -e "\t${cyanColour}[+]${endColour} ${grayColour}Para instalar el escritorio profesional pasa el parámetro${endColour} ${purpleColour}-i${endColour} ${grayColour}al script.${endColour}"
echo -e "\t\t${yellowColour}[-]${endColour} ${grayColour}Ejemplo:${endColour} ${greenColour}sudo ./script-bash-auto.sh -i${endColour}"
echo -e "\t${cyanColour}[+]${endColour} ${grayColour}Para desinstalar el escritorio profesional pasa el parámetro${endColour} ${purpleColour}-d${endColour} ${grayColour}al script.${endColour}"
echo -e "\t\t${yellowColour}[-]${endColour} ${grayColour}Ejemplo:${endColour} ${greenColour}sudo ./script-bash-auto.sh -d${endColour}"
exit 0
}
