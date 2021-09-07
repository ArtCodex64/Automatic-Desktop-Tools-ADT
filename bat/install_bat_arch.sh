#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL BAT
################################################################################
################################################################################
################################################################################

function install_bat_arch(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Instalando bat ...${endColour}"
  mkdir /home/$userName/.config/AUTOMATICOESC/bat
  cp ./tools/bat_0.18.2_amd64.deb /home/$userName/.config/AUTOMATICOESC/bat > /dev/null 2>&1
  (cd /home/$userName/.config/AUTOMATICOESC/bat/ ; dpkg -i bat_0.18.2_amd64.deb > /dev/null 2>&1)
  echo -e "${greenColour}(OK)${endColour}"
}

################################################################################
################################################################################
################################################################################
#UNINSTALL BAT
################################################################################
################################################################################
################################################################################
function uninstall_bat_arch(){
    grep -q "bat" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}bat${endColour}${grayColour} ...${endColour}"
        yes | pacman -R bat > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
        instalado="$(apt -qq list bat --installed 2>/dev/null | wc -l)"
        test -f /usr/bin/bat
        instaladoT="$(echo $?)"
        which bat > /dev/null
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
