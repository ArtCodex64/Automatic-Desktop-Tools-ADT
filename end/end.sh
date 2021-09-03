#!/bin/bash

################################################################################
################################################################################
################################################################################
#END MARK
################################################################################
################################################################################
################################################################################
function end_mark(){
userName="$(logname)"
grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt > /dev/null
if [[ "$(echo $?)" != "0" ]];then
  echo -e "\n#END" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null 2>/dev/null
fi
grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt > /dev/null
if [[ "$(echo $?)" == "0" ]];then
  echo -e "${cyanColour}[*]${endColour} ${grayColour}END MARK${endColour} ${greenColour}(OK)${endColour} ${grayColour}!${endColour}"
fi
}
