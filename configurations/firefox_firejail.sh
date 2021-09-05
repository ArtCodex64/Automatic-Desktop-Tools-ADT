#!/bin/bash

################################################################################
################################################################################
################################################################################
#BACKGROUND CONFIGURATION FEH-BSPWMRC
################################################################################
################################################################################
################################################################################
function firefox_firejail_configuration(){
        echo -en "${cyanColour}[*]${endColour} ${grayColour}Launch${endColour} ${cyanColour}FIREFOX${endColour} ${grayColour}&&${endColour} ${cyanColour}FIREJAIL${endColour} ${grayColour}configuration ...${endColour}"
        userName="$(logname)"
        #IF NOT EXIST
	      grep -q "#OPEN FIREFOX FIREJAIL" /home/$userName/.config/sxhkd/sxhkdrc
        if [[ "$(echo $?)" != "0" ]];then
		            echo "#OPEN FIREFOX FIREJAIL" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		            echo "super + shift + f" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		            echo -e "\tfirejail firefox" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		            grep -q "#OPEN FIREFOX FIREJAIL" /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
                if [[ "$(echo $?)" == "0" ]];then
                        echo -e "${greenColour}(OK)${endColour}"
                else
			               echo -e "${redColour}(not installed)${endColour}"
			               tput cnorm
			               exit 0
		            fi
	      else
		         echo -e "${greenColour}(OK)${endColour}"
        fi
	      tput cnorm
}
