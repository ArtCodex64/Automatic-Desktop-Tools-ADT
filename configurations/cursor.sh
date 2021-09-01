#!/bin/bash

################################################################################
################################################################################
################################################################################
#CONFIGURATION CURSOR
################################################################################
################################################################################
################################################################################
function config_cursor(){
userName="$(logname)"
echo -en "${greenColour}[*]${endColour} ${grayColour}Configurando cursor ...${endColour}"
grep -q "xsetroot -cursor_name left_ptr &" /home/$userName/.config/bspwm/bspwmrc > /dev/null
if [[ "$(echo $?)" != "0" ]];then
  echo "xsetroot -cursor_name left_ptr &" | tee -a /home/$userName/.config/bspwm/bspwmrc > /dev/null 2>&1
  echo -e "\t${greenColour}(OK)${endColour}"
else
  echo -e "${greenColour}(was configured)${endColour}"
fi
}
