#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION FEH
################################################################################
################################################################################
################################################################################

source ./configurations/feh_bspwmrc.sh

function feh_installation_arch(){
tput civis
userName="$(logname)"
echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}feh${endColour} ${grayColour}...${endColour}"
test -f /usr/bin/feh > /dev/null 2>&1
if [[ "$(echo $?)" == "0" ]];then
  echo -e "${greenColour}(OK)${endColour}"
else
  yes | pacman -Sy feh --noconfirm > /dev/null 2>&1
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
    grep -q "feh" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}feh${endColour}${grayColour} ...${endColour}"
        apt remove feh -y > /dev/null 2>&1
        apt purge feh -y > /dev/null 2>&1
        rm -r /home/$userName/BGIMAGES > /dev/null
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
