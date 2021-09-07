#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL SLIMLOCK
################################################################################
################################################################################
################################################################################
function install_slim_lock_arch(){
	install_dependencies_slimlock_arch
	clone_slimlock_arch
	config_slimlock_arch
}

################################################################################
################################################################################
################################################################################
#INSTALL DEPENDENCIES SLIMLOCK
################################################################################
################################################################################
################################################################################
function install_dependencies_slimlock_arch(){
		echo -e "${cyanColour}[*]${endColour} ${grayColour}Comprobando dependencias${endColour} ${cyanColour}SlimLock${endColour} ${grayColour}...${endColour}"
		dependencies=("slim" "libjpeg" "libpng" "libxft" "libxrandr" "pam" "libxmu")
	#PROGRAM SLIMLOCK
        for program in "${dependencies[@]}";do
                #echo -n para quitar el salto de línea
                echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Dependencia:${endColour} ${cyanColour}$program${endColour} ${grayColour}...${endColour}"
								pacman -Qs $program > /dev/null 2>/dev/null
							  instaladoP="$(echo $?)"
							  test -f /usr/bin/$program > /dev/null 2>/dev/null
							  instaladoT="$(echo $?)"
							  which $program > /dev/null 2>/dev/null
							  instaladoW="$(echo $?)"
							  if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
      						echo -e "${greenColour}(OK)${endColour}"
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
  	for programNS in "${programNotSlim[@]}";do
        echo -en "\t\t${yellowColour}[+] ${endColour}${grayColour}Installing${endColour} ${cyanColour}$programNS${endColour}${grayColour} ...${endColour}"
        sleep .25
				if [[ $programNS == "slim" ]];then
					yes 2>/dev/null | pacman -Sy $programNS --noconfirm > /dev/null 2>/dev/null
				else
					yes 2>/dev/null | pacman -Sy $programNS --noconfirm > /dev/null 2>/dev/null
				fi
				pacman -Qs $programNS > /dev/null 2>/dev/null
				instaladoP="$(echo $?)"
				test -f /usr/bin/$programNS > /dev/null 2>/dev/null
				instaladoT="$(echo $?)"
				which $programNS > /dev/null 2>/dev/null
				instaladoW="$(echo $?)"
				if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
          echo -e " ${greenColour}(OK)${endColour}"
        else
          echo -e " ${redColour}(not installed)${endColour}"
          exit 0
        fi
				unset $instaladoP
				unset $instaladoT
				unset $instaladoW
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
function clone_slimlock_arch(){
	echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}slimlock${endColour} ${grayColour}...${endColour}"
	userName="$(logname)"
	mkdir /home/$userName/.config/AUTOMATICOESC/slimlock
	git clone https://github.com/joelburget/slimlock.git /home/$userName/.config/AUTOMATICOESC/slimlock > /dev/null 2>/dev/null
	(cd /home/$userName/.config/AUTOMATICOESC/slimlock/ ; make > /dev/null 2>/dev/null ; make install > /dev/null 2>/dev/null)
}

################################################################################
################################################################################
################################################################################
#CONFIG SLIMLOCK
################################################################################
################################################################################
################################################################################
function config_slimlock_arch(){
	userName="$(logname)"
	cp -r /home/$userName/.config/AUTOMATICOESC/blue-sky/slim /etc/ > /dev/null 2>/dev/null
	cp /home/$userName/.config/AUTOMATICOESC/blue-sky/slim/slimlock.conf /etc/ > /dev/null 2>/dev/null
	cp -r /home/$userName/.config/AUTOMATICOESC/blue-sky/slim/default/ /usr/share/slim/themes > /dev/null 2>/dev/null
	echo -e "\nsuper + alt + x" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null 2>/dev/null
	echo -e "\tslimlock" | tee -a /home/$userName/.config/sxhkd/sxhkdrc > /dev/null 2>/dev/null
	sed -i 's/i3lock/slimlock/' /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	chmod 755 /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	chown $userName:$userName /home/$userName/.config/polybar/scripts/powermenu_alt > /dev/null 2>/dev/null
	echo -e "${greenColour}(OK)${endColour}"
}

################################################################################
################################################################################
################################################################################
#UNINSTALL slimlock
################################################################################
################################################################################
################################################################################
function uninstall_slimlock_arch(){
	dependenciesSlimlock=("slim" "libpam0g-dev" "libxrandr-dev" "libfreetype6-dev" "libimlib2-dev" "libxft-dev")
	for program in "${dependenciesSlimlock[@]}"; do
    grep -q "$program" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
    if [[ "$(echo $?)" != "0" ]];then
        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencie: ${endColour} ${cyanColour}$program${endColour}${grayColour} ...${endColour}"
        yes | pacman -R $program > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/AUTOMATICOESC/picom > /dev/null 2>/dev/null
        rm -r /home/$userName/.config/picom > /dev/null 2>/dev/null
				pacman -Qs $program > /dev/null 2>/dev/null
				instaladoP="$(echo $?)"
				test -f /usr/bin/$program > /dev/null 2>/dev/null
				instaladoT="$(echo $?)"
				which $program > /dev/null 2>/dev/null
				instaladoW="$(echo $?)"
				if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
          echo -e " ${greenColour}(uninstalled)${endColour}"
        else
          echo -e "${redColour}(not uninstalled)${endColour}"
          exit 0
        fi
    fi
    sleep .25
  done
}
