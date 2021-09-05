#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL BAT
################################################################################
################################################################################
################################################################################

function install_bat(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Instalando bat ...${endColour}"
  mkdir /home/$userName/.config/AUTOMATICOESC/bat
  cp ./tools/bat_0.18.2_amd64.deb /home/$userName/.config/AUTOMATICOESC/bat > /dev/null 2>&1
  (cd /home/$userName/.config/AUTOMATICOESC/bat/ ; dpkg -i bat_0.18.2_amd64.deb > /dev/null 2>&1)
  echo -e "${greenColour}(OK)${endColour}"
}
