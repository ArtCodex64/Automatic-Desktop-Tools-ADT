#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL LSD
################################################################################
################################################################################
################################################################################

function install_lsd_arch(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Instalando LSD ...${endColour}"
  mkdir /home/$userName/.config/AUTOMATICOESC/lsd
  cp ./tools/lsd_0.20.1_amd64.deb /home/$userName/.config/AUTOMATICOESC/lsd/ > /dev/null 2>&1
  (cd /home/$userName/.config/AUTOMATICOESC/lsd/ ; dpkg -i lsd_0.20.1_amd64.deb > /dev/null 2>&1)
  echo -e "${greenColour}(OK)${endColour}"
}

################################################################################
################################################################################
################################################################################
#UNINSTALL LSD
################################################################################
################################################################################
################################################################################
function uninstall_lsd_arch(){
    grep -q "lsd" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}lsd${endColour}${grayColour} ...${endColour}"
        yes | pacman -R lsd > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
        instalado="$(apt -qq list lsd --installed 2>/dev/null | wc -l)"
        test -f /usr/bin/lsd
        instaladoT="$(echo $?)"
        which lsd > /dev/null
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
