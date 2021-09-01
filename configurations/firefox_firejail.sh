#!/bin/bash

################################################################################
################################################################################
################################################################################
#BACKGROUND CONFIGURATION FEH-BSPWMRC
################################################################################
################################################################################
################################################################################
function firefox_firejail_configuration(){
        echo -e "${cyanColour}[*]${endColour} ${grayColour}Launch FIREFOX && FIREJAIL configuration ...${endColour}"
        userName="$(logname)"
        #IF NOT EXIST
	grep -q "#OPEN FIREFOX FIREJAIL" /home/$userName/.config/sxhkd/sxhkdrc
        if [[ "$(echo $?)" != "0" ]];then
                echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Añadiendo configuración de${endColour} ${cyanColour}FIREFOX && FIREJAIL${endColour} ${grayColour}...${endColour}"
		echo "#OPEN FIREFOX FIREJAIL" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		echo "super + shift + f" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		echo -e "\tfirejail firefox" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
		grep -q "#OPEN FIREFOX FIREJAIL" /home/$userName/.config/sxhkd/sxhkdrc > /dev/null
                if [[ "$(echo $?)" == "0" ]];then
                        echo -e "\t\t ${greenColour}[*]${endColour} ${grayColour}Configuración${endColour} ${cyanColour}FIREFOX && FIREJAIL${endColour} ${grayColour}añadida !${endColour}"
                else
			echo -e "\t\t ${redColour}[*]${endColour} ${grayColour}Configuración${endColour} ${cyanColour}FIREFOX && FIREJAIL${endColour} ${grayColour}no añadida !${endColour}"
			tput cnorm
			exit 0
		fi
	else
		echo -e "\t${greenColour}[*]${endColour} ${grayColour}Configuración correcta !${endColour}"
        fi
	tput cnorm
}
