#!/bin/bash

################################################################################
################################################################################
################################################################################
#BACKGROUND CONFIGURATION FEH-BSPWMRC
################################################################################
################################################################################
################################################################################
function bg_configuration(){
echo -e "\t${cyanColour}[*]${endColour} ${grayColour}Background configuration ...${endColour}"
userName="$(logname)"
#Creamos la carpeta ImagesBackground si no existe
if [[ ! -d "/home/$userName/BGIMAGES" ]];then
  echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Creando directorio${endColour} ${cyanColour}/home/$userName/ImagesBackground${endColour} ${grayColour}...${endColour}"
  mkdir /home/$userName/BGIMAGES
  if [[ -d "/home/$userName/BGIMAGES" ]];then
    echo -e "\t\t\t ${greenColour}[*]${endColour} ${grayColour}Directorio creado !${endColour}"
  fi
  grep -q "#FEH BACKGROUND CONFIGURATION" /home/$userName/.config/bspwm/bspwmrc
  if [[ "$(echo $?)" != "0" ]];then
    cp ./BGIMAGES/fondo.jpg /home/$userName/BGIMAGES/
    echo -e "\n#FEH BACKGROUND CONFIGURATION" | tee -a /home/$userName/.config/bspwm/bspwmrc > /dev/null
    echo "feh --bg-fill /home/$userName/BGIMAGES/fondo.jpg" | tee -a /home/$userName/.config/bspwm/bspwmrc > /dev/null
    echo -e "\t\t\t\t${greenColour}[*]${endColour} ${grayColour}Fondo de pantalla seteado !${endColour}"
  fi
fi
}
