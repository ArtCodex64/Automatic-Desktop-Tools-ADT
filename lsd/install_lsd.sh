#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL LSD
################################################################################
################################################################################
################################################################################

function install_lsd(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Instalando LSD ...${endColour}"
  mkdir /home/$userName/.config/AUTOMATICOESC/lsd
  cp ./tools/lsd_0.20.1_amd64.deb /home/$userName/.config/AUTOMATICOESC/lsd/ > /dev/null 2>&1
  (cd /home/$userName/.config/AUTOMATICOESC/lsd/ ; dpkg -i lsd_0.20.1_amd64.deb > /dev/null 2>&1)
  echo -e "${greenColour}(OK)${endColour}"
}
