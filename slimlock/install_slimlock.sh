#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL SLIMLOCK
################################################################################
################################################################################
################################################################################
function install_slim_lock(){
	install_dependencies_slimlock
	clone_slimlock
	config_slimlock
}

################################################################################
################################################################################
################################################################################
#INSTALL DEPENDENCIES SLIMLOCK
################################################################################
################################################################################
################################################################################
function install_dependencies_slimlock(){
		echo -e "${cyanColour}[*]${endColour} ${grayColour}Comprobando dependencias${endColour} ${cyanColour}SlimLock${endColour} ${grayColour}...${endColour}"
		dependencies=("slim" "libpam0g-dev" "libxrandr-dev" "libfreetype6-dev" "libimlib2-dev" "libxft-dev")
	#PROGRAM SLIMLOCK
        for program in "${dependencies[@]}";do
                #echo -n para quitar el salto de línea
                echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Dependencia:${endColour} ${cyanColour}$program${endColour} ${grayColour}...${endColour}"
 								instalado="$(apt -qq list $program 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
 								test -f /usr/bin/$program
                instaladoT="$(echo $?)"
                which $program > /dev/null
    						instaladoW="$(echo $?)"
                if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
      						echo -e "${greencolour}(OK)${endColour}"
            			if [[ "$(echo $?)" != "0" ]];then
        						echo "$program" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
                	fi
                else
                	echo -e " ${redColour}(not installed)${endColour}"
                 	 programNotSlim+=( "$program" )
                fi
    	#sleep .25
        done
  	#INSTALLATION SLIMLOCK
  	for programN in "${programNotSlim[@]}";do
        echo -en "\t\t${yellowColour}[+] ${endColour}${grayColour}Installing${endColour} ${cyanColour}$programN${endColour}${grayColour} ...${endColour}"
        sleep .25
    		if [[ $programN == "slim" ]];then
						slim 2>/dev/null | apt-get install -y $programN > /dev/null 2>/dev/null
				else
						apt-get install $programN -y > /dev/null 2>/dev/null
				fi
    		instalado="$(apt -qq list $programN 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
    		test -f /usr/bin/$programN
        instaladoT="$(echo $?)"
        which $programN > /dev/null
        instaladoW="$(echo $?)"
        if [[ $instalado == "[instalado]" || $instaladoT == "0" || $instaladoW == "0" ]];then
          echo -e " ${greenColour}(OK)${endColour}"
        else
          echo -e " ${redColour}(not installed)${endColour}"
          exit 0
        fi
    	#sleep 1.25
  	done

}

################################################################################
################################################################################
################################################################################
#CLONE SLIMLOCK
################################################################################
################################################################################
################################################################################
function clone_slimlock(){
	echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}slimlock${endColour} ${grayColour}...${endColour}"
	userName="$(logname)"
	mkdir /home/$userName/slimlock
	git clone https://github.com/joelburget/slimlock.git /home/$userName/slimlock > /dev/null 2>/dev/null
	(cd /home/$userName/slimlock/ ; make > /dev/null 2>/dev/null ; make install > /dev/null 2>/dev/null)
}

################################################################################
################################################################################
################################################################################
#CONFIG SLIMLOCK
################################################################################
################################################################################
################################################################################
function config_slimlock(){
	userName="$(logname)"
	cp -r /home/$userName/Descargas/blue-sky/slim /etc/ > /dev/null 2>/dev/null
	cp /home/$userName/Descargas/blue-sky/slim/slimlock.conf /etc/ > /dev/null 2>/dev/null
	cp -r /home/$userName/Descargas/blue-sky/slim/default/ /usr/share/slim/themes > /dev/null 2>/dev/null
	echo -e "\nsuper + alt + x" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null 2>/dev/null
	echo -e "\tslimlock" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null 2>/dev/null
	sed -i 's/i3lock/slimlock/' /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	chmod 755 /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	chown $userName:$userName /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	echo -e "${greenColour}(OK)${endColour}"
}
