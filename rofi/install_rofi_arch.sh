#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL ROFI
################################################################################
################################################################################
################################################################################

function install_rofi_arch(){
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando ${cyanColour}rofi${endColour} ...${endColour}"
  pacman -Qs rofi > /dev/null 2>&1
  instaladoP="$(echo $?)"
  test -f /usr/bin/rofi > /dev/null 2>&1
  instaladoT="$(echo $?)"
  which rofi > /dev/null 2>&1
  instaladoW="$(echo $?)"
  if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
    echo -e "${greenColour}(OK)${endColour}"
  else
    yes | pacman -Sy rofi --noconfirm > /dev/null 2>/dev/null
    pacman -Qs rofi > /dev/null 2>/dev/null
    instaladoP="$(echo $?)"
    test -f /usr/bin/rofi > /dev/null 2>/dev/null
    instaladoT="$(echo $?)"
    which rofi > /dev/null 2>/dev/null
    instaladoW="$(echo $?)"
    if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
      echo -e "${greenColour}(OK)${endColour}"
    else
      echo -e "${redColour}(not installed)${endColour}"
      exit 0
    fi
  fi
  config_rofi_arch
}
################################################################################
################################################################################
################################################################################
#KEY BINDING ROFI
################################################################################
################################################################################
################################################################################

function config_rofi_arch(){
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
function uninstall_rofi_arch(){
    grep -q "rofi" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}rofi${endColour}${grayColour} ...${endColour}"
        pacman -R rofi > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
        pacman -Qs rofi > /dev/null 2>/dev/null
        instaladoP="$(echo $?)"
        test -f /usr/bin/rofi > /dev/null 2>/dev/null
        instaladoT="$(echo $?)"
        which rofi > /dev/null 2>/dev/null
        instaladoW="$(echo $?)"
        if [[ $instaladoP == "1" || $instaladoT == "1" || $instaladoW == "1" ]];then
          echo -e " ${greenColour}(uninstalled)${endColour}"
        else
          echo -e "${redColour}(not uninstalled)${endColour}"
          exit 0
        fi
    fi
    sleep .25
}
