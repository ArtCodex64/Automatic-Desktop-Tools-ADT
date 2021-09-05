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
echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}feh${endColour} ${grayColour}...${endColour}"
test -f /usr/bin/feh > /dev/null 2>&1
if [[ "$(echo $?)" == "0" ]];then
  echo -e "${greenColour}(OK)${endColour}"
else
  apt install feh -y > /dev/null 2>&1
  sleep .25
  test -f /usr/bin/feh > /dev/null 2>&1
  if [[ "$(echo $?)" == "0" ]];then
    echo -e "${greenColour}(OK)${endColour}"
    bg_configuration
  else
    echo -e "${redColour}(not installed)${endColour}"
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
################################################################################
################################################################################
################################################################################
#UNINSTALL FEH
################################################################################
################################################################################
################################################################################
function uninstall_feh(){
    grep -q "feh" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}feh${endColour}${grayColour} ...${endColour}"
        apt remove feh -y > /dev/null 2>&1
        apt purge feh -y > /dev/null 2>&1
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
        instalado="$(apt -qq list feh --installed 2>/dev/null | wc -l)"
        test -f /usr/bin/feh
        instaladoT="$(echo $?)"
        which feh > /dev/null
        instaladoW="$(echo $?)"
        if [[ $instalado == "0" || $instaladoT == "1" || $instaladoW == "1" ]];then
          echo -e " ${greenColour}(uninstalled)${endColour}"
        else
          echo -e "${redColour}(not uninstalled)${endColour}"
          exit 0
        fi
    fi
    sleep .25
}
