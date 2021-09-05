#!/bin/bash

################################################################################
################################################################################
################################################################################
#ESCRITORIO-AUTOMATICO
################################################################################
################################################################################
################################################################################
function mkdir_escritorio_automatico(){
userName="$(logname)"
tput civis
      if [[ ! -d "/home/$userName/.config/AUTOMATICOESC" ]];then
              echo -e "${cyanColour}[*]${endColour} ${grayColour}Creando directorio${endColour} ${cyanColour}ESCRITORIO-AUTOMATICO${endColour}"
              mkdir /home/$userName/.config/AUTOMATICOESC
  mkdir /home/$userName/.config/AUTOMATICOESC/recovery
  touch /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
  echo -e "#INSTALLED PROGRAMS" >> /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
              if [[ -d "/home/$userName/.config/AUTOMATICOESC" && -d "/home/$userName/.config/AUTOMATICOESC/recovery" && -f "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" ]];then
                      echo -e "\t${yellowColour}[*]${endColour} ${cyanColour}AUTOMATICOESC${endColour} ${grayColour}creado en${endColour} ${cyanColour}/home/$userName/.config/${endColour}"
              else
                      echo -e "\t${redColour}[*]${endColour} ${cyanColour}AUTOMATICOESC${endColour} ${grayColour}no creado en${endColour} ${cyanColour}/home/$userName/.config/${endColour}"
                      exit 0
              fi
      else
              echo -e "${cyanColour}[*]${endColour} ${grayColour}Directorio${endColour} ${cyanColour}AUTOMATICOESC${endColour} ${greenColour}(OK)${endColour}"
      fi
      tput cnorm
}
