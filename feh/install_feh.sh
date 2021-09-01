#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION FEH
################################################################################
################################################################################
################################################################################

source ./configurations/feh_bspwmrc.sh

function feh_installation(){
tput civis
      userName="$(logname)"
      echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}feh${endColour} ${grayColour}...${endColour}"
      test -f /usr/bin/feh > /dev/null 2>&1
if [[ "$(echo $?)" == "0" ]];then
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}FEH${endColour} ${greenColour}(installed)${endColour}"
      else
  echo -e "\t${redColour}[*]${endColour} ${grayColour}FEH${endColour} ${greenColour}(not installed)${endColour}"
              apt install feh -y > /dev/null 2>&1
  sleep .25
  test -f /usr/bin/feh > /dev/null 2>&1
  if [[ "$(echo $?)" == "0" ]];then
    echo -e "\t\t${cyanColour}[*]${endColour} ${grayColour}FEH${endColour} ${greenColour}(installed)${endColour}"
    bg_configuration
  else
    echo -e "\t\t${redColour}[*]${endColour} ${grayColour}FEH${endColour} ${redColour}(not installed)${endColour}"
    exit 0
  fi
      fi

      tput cnorm
}
################################################################################
################################################################################
################################################################################
#UNINSTALL FEH
################################################################################
################################################################################
################################################################################
function uninstall_feh(){
      tput civis
      userName="$(logname)"
      test -f /usr/bin/feh > /dev/null 2>&1
      if [[ "$(echo $?)" == "0" ]];then
  echo -e "${yellowColour}[*]${endColour} ${grayColour}Uninstalling${endColour} ${cyanColour}feh${endColour} ${grayColour}...${endColour}"
              apt remove feh -y > /dev/null 2>&1
  rm -r /home/$userName/BGIMAGES > /dev/null
              sleep .25
              test -f /usr/bin/feh > /dev/null 2>&1
              if [[ "$(echo $?)" != "0" && ! -d "/home/$userName/BGIMAGES" ]];then
    echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}FEH${endColour} ${greenColour}uninstalled !${endColour}"
    echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}BGIMAGES folder${endColour} ${greenColour}deleted !${endColour}"
              else
                      echo -e "\t\t${redColour}[*]${endColour} ${grayColour}FEH${endColour} ${redColour}not uninstalled${endColour}"
                      exit 0
              fi
      else
              echo -e "\t${greenColour}[*]${endColour} ${grayColour}FEH${endColour} ${greenColour}(not installed)${endColour}"
      fi

      tput cnorm
}
