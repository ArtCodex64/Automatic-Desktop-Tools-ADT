#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL ROFI
################################################################################
################################################################################
################################################################################

function install_rofi(){
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando ${cyanColour}rofi${endColour} ...${endColour}"
  apt install rofi -y > /dev/null 2>/dev/null
  instalado="$(apt -qq list rofi 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
  test -f /usr/bin/rofi > /dev/null 2>/dev/null
  instaladoT="$(echo $?)"
  which rofi > /dev/null 2>/dev/null
  instaladoW="$(echo $?)"
  if [[ "$instalado" == "[instalado]" || "$instalado" == "[instalado, automático]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
    echo -e "${greenColour}(OK)${endColour}"
  else
    apt install rofi -y > /dev/null 2>/dev/null
    instalado="$(apt -qq list rofi 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
    test -f /usr/bin/rofi > /dev/null 2>/dev/null
    instaladoT="$(echo $?)"
    which rofi > /dev/null 2>/dev/null
    instaladoW="$(echo $?)"
    if [[ "$instalado" == "[instalado]" || "$instalado" == "[instalado, automático]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
      echo -e "${greenColour}(OK)${endColour}"
    else
      echo -e "${redColour}(not installed)${endColour}"
      exit 0
    fi
  fi
  config_rofi
}
################################################################################
################################################################################
################################################################################
#KEY BINDING ROFI
################################################################################
################################################################################
################################################################################

function config_rofi(){
  userName="$(logname)"
  sed -i 's/super + @space/super + d/' /home/$userName/.config/sxhkd/sxhkdrc
  sed -i 's/dmenu_run/rofi -show run/' /home/$userName/.config/sxhkd/sxhkdrc
}
