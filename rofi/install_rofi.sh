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
  instalado="$(apt -qq list rofi --installed 2>/dev/null | wc -l > /dev/null)"
  test -f /usr/bin/rofi > /dev/null 2>/dev/null
  instaladoT="$(echo $?)"
  which rofi > /dev/null 2>/dev/null
  instaladoW="$(echo $?)"
  if [[ $instalado == "1" || $instaladoT == "0" || $instaladoW == "0" ]];then
    echo -e "${greenColour}(OK)${endColour}"
  else
    apt install rofi -y > /dev/null 2>/dev/null
    instalado="$(apt -qq list rofi --installed 2>/dev/null | wc -l > /dev/null)"
    test -f /usr/bin/rofi > /dev/null 2>/dev/null
    instaladoT="$(echo $?)"
    which rofi > /dev/null 2>/dev/null
    instaladoW="$(echo $?)"
    if [[ $instalado == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
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

################################################################################
################################################################################
################################################################################
#UNINSTALL ROFI
################################################################################
################################################################################
################################################################################
function uninstall_rofi(){
    grep -q "rofi" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}rofi${endColour}${grayColour} ...${endColour}"
        apt remove rofi -y > /dev/null 2>&1
        apt purge rofi -y > /dev/null 2>&1
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
        instalado="$(apt -qq list rofi --installed 2>/dev/null | wc -l)"
        test -f /usr/bin/rofi
        instaladoT="$(echo $?)"
        which rofi > /dev/null
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
