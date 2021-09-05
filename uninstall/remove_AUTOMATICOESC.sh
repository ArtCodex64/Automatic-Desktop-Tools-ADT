#!/bin/bash

#DESINSTALLATION
function delete_automaticoesc_ub_deb_parr(){
userName="$(logname)"
echo -en "${greenColour}[*][*]${endColour} ${grayColour}Deleting directory${endColour} ${cyanColour}AUTOMATICOESC${endColour} ${grayColour}...${endColour}"
rm -r /home/$userName/.config/AUTOMATICOESC
echo -e "${greenColour}(deleted)${endColour}"
}
