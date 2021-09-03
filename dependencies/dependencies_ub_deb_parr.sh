#!/bin/bash

################################################################################
################################################################################
################################################################################
#FUNCTION INSDEPENDS
################################################################################
################################################################################
################################################################################
function insDepends(){
	userName="$(logname)"
	#INSTALL DEPENDENCIES FUNCTION
	name=( "$@" )
        for program in "${name[@]}";do
                instalado="$(apt -qq list $program 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
                test -f /usr/bin/$program > /dev/null 2>/dev/null
                instaladoT="$(echo $?)"
                which $program > /dev/null 2>/dev/null
                instaladoW="$(echo $?)"
                if [[ "$instalado" == "[instalado]" || "$instalado" == "[instalado, automático]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                        grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
                        if [[ "$(echo $?)" != "0" ]];then
													echo "$programShare" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
												fi
												echo -en "\t${yellowColour}[*] ${endColour}${grayColour}Dependencia: ${endColour}${cyanColour}$program${endColour} ${grayColour}...${endColour}"
                        echo -e "${greenColour}(OK)${endColour}"
                else
                        echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Dependencia: ${endColour}${cyanColour}$program${endColour} ${grayColour}...${endColour}"
                        sleep .25
                        apt install $program -y > /dev/null 2>&1
                        instaladoComp="$(apt -qq list $program 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
                        test -f /usr/bin/$program
                        instaladoT="$(echo $?)"
                        which $program > /dev/null
                        instaladoW="$(echo $?)"
                        if [[ "$instaladoComp" == "[instalado]" || "$instalado" == "[instalado, automático]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                                echo -e " ${greenColour}(OK)${endColour}"
                        else
                                echo -e " ${redColour}(not installed)${endColour}"
                                exit 0
                        fi
                        #sleep 1.25
                fi
        done
	unset name
}
################################################################################
################################################################################
################################################################################
#DEPENDENCIES
################################################################################
################################################################################
################################################################################
function dependencies(){
tput civis
userName="$(logname)"
dependenciesShare=( "build-essential" "python3")
dependenciesBin=( "git" "vim" "xcb" "make" ) #He borrado la herramienta CC
dependenciesDoc=( "libxcb-util0-dev" "libxcb-randr0-dev" "libxcb-icccm4-dev" "libxcb-keysyms1-dev" "libxcb-xinerama0-dev" "libasound2-dev" "libxcb-xtest0-dev" "libxcb-shape0-dev" "libxcb-ewmh-dev" )
dependenciesPolybarBin=( "cmake" "pkg-config")
dependenciesPolybarShare=( "cmake-data" "python3-sphinx" "libcairo2-dev" "libxcb1-dev" "libxcb-composite0-dev" "python3-xcbgen" "xcb-proto" "libxcb-image0-dev" "libxcb-xkb-dev" "libxcb-xrm-dev" "libxcb-cursor-dev" "libpulse-dev" "libjsoncpp-dev" "libmpdclient-dev" "libcurl4-openssl-dev" "libnl-genl-3-dev" )

echo -e "${cyanColour}[*]${endColour} ${grayColour}Comprobando dependencias necesarias para BSPWM y SXHKD ...${endColour}"
#DEPENDENCIAS BSPWM Y SXHKD
#PROGRAM BIN
      for programBin in "${dependenciesBin[@]}";do
              #echo -n para quitar el salto de línea
              echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Dependencia:${endColour} ${cyanColour}$programBin${endColour} ${grayColour}...${endColour}"
  						instalado="$(apt -qq list $programBin 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
  						test -f /usr/bin/$programBin
              instaladoT="$(echo $?)"
              which $programBin > /dev/null
  						instaladoW="$(echo $?)"
              if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
    						echo -e " ${greenColour}(OK)${endColour}"
                grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
          			if [[ "$(echo $?)" != "0" ]];then
      						echo "$programBin" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              	fi
              else
              	echo -e " ${redColour}(not installed)${endColour}"
                programNotBin+=( "$programBin" )
              fi
  #sleep .25
      done
#INSTALLATION BIN PROGRAMS
for programNB in "${programNotBin[@]}";do
              echo -en "\t\t${yellowColour}[+] ${endColour}${grayColour}Installing${endColour} ${cyanColour}$programNB${endColour}${grayColour} ...${endColour}"
        			sleep .25
  						apt-get install $programNB -y > /dev/null 2>&1
  						instalado="$(apt -qq list $programNB 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
  						test -f /usr/bin/$programNB
              instaladoT="$(echo $?)"
              which $programNB > /dev/null
              instaladoW="$(echo $?)"
              if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                      echo -e " ${greenColour}(OK)${endColour}"
              else
                      echo -e " ${redColour}(not installed)${endColour}"
                      exit 0
              fi
  #sleep 1.25
done
#PROGRAM SHARE
      insDepends "${dependenciesShare[@]}"
      #PROGRAM DOC
      insDepends "${dependenciesDoc[@]}"
tput cnorm
#INSTALLATION POLYBAR DEPENDENCIES
			echo -e "\n${cyanColour}[*]${endColour} ${grayColour}Comprobando dependencias necesarias para la POLYBAR ...${endColour}"
      #Dormimos el programa 2 segundos
      sleep 2
#PROGRAM POLYBAR BIN
      for programPolybarBin in "${dependenciesPolybarBin[@]}";do
              #echo -n para quitar el salto de línea
              echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Dependencia:${endColour} ${cyanColour}$programPolybarBin${endColour} ${grayColour}...${endColour}"
              instalado="$(apt -qq list $programPolybarBin 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
              test -f /usr/bin/$programPolybarBin
              instaladoT="$(echo $?)"
              which $programPolybarBin > /dev/null
              instaladoW="$(echo $?)"
              if [[ "$instalado" == "[instalado]" || "$instalado" == "[instalado, automático]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                      echo -e " ${greenColour}(OK)${endColour}"
    									grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
                      if [[ "$(echo $?)" != "0" ]];then
                        echo "$programPolybarBin" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
          						fi
              else
                      echo -e " ${redColour}(not installed)${endColour}"
                      programNotPolybarBin+=( "$programPolybarBin" )
              fi
              #sleep .25
      done
#POLYBAR SHARE/DOC
#INSTALLATION SHARE BIN PROGRAMS
      for programNPB in "${programNotPolybarBin[@]}";do
  						echo -en "\t\t${yellowColour}[+] ${endColour}${grayColour}Installing ${endColour} ${cyanColour}$programNPB${endColour}${grayColour} ...${endColour}"
              sleep .25
              apt install $programNPB -y > /dev/null 2>&1
  						instalado="$(apt -qq list $programNPB 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
  						test -f /usr/bin/$programNPB
              instaladoT="$(echo $?)"
              which $programNPB > /dev/null
              instaladoW="$(echo $?)"
              if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                      echo -e " ${greenColour}(OK)${endColour}"
              else
                      echo -e " ${redColour}(not installed)${endColour}"
                      exit 0
              fi
              #sleep 1.25
      done
#PROGRAM SHARE
      insDepends "${dependenciesPolybarShare[@]}"
}
################################################################################
################################################################################
################################################################################
#DELETE DEPENDENCIES
################################################################################
################################################################################
################################################################################
function delete_dependencies(){
			userName="$(logname)"
			echo -e "${cyanColour}[*]${endColour} ${grayColour}Uninstalling dependencies ...${endColour}"
			dependenciesShare=(build-essential)
      dependenciesBin=(git vim xcb make ) #He borrado la herramienta CC
      dependenciesDoc=(libxcb-util0-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev libxcb-ewmh-dev)
      dependenciesPolybarBin=(cmake pkg-config)
      dependenciesPolybarShare=(cmake-date python3-sphinx libcairo2-dev libxcb1-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libjsoncpp-dev libpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev)

#UNINSTALL SHARE DEPENDENCIES
      for programShare in "${dependenciesShare[@]}"; do
  			grep -q "$programShare" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
        if [[ "$(echo $?)" != "0" ]];then
    			echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}$programShare${endColour}${grayColour} ...${endColour}"
    			apt remove $programShare -y > /dev/null 2>&1
    			echo -e " ${greenColour}(OK)${endColour}"
  			fi
        sleep .25
      done

#UNINSTALL BIN DEPENDENCIES
      for programBin in "${dependenciesBin[@]}"; do
  			grep -q "$programBin" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
        if [[ "$(echo $?)" != "0" ]];then
          echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}$programBin${endColour}${grayColour} ...${endColour}"
          apt remove $programBin -y > /dev/null 2>&1
          echo -e " ${greenColour}(OK)${endColour}"
        fi
        sleep .25
      done

#UNINSTALL DOC DEPENDENCIES
      for programDoc in "${dependenciesDoc[@]}"; do
  			grep -q "$programDoc" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
        if [[ "$(echo $?)" != "0" ]];then
          echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}$programDoc${endColour}${grayColour} ...${endColour}"
          apt remove $programDoc -y > /dev/null 2>&1
          echo -e " ${greenColour}(OK)${endColour}"
        fi
        sleep .25
      done

#UNINSTALL POLYBAR BIN DEPENDENCIES
      for programPolybarB in "${dependenciesPolybarBin[@]}"; do
  			grep -q "$programPolybarB" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
        if [[ "$(echo $?)" != "0" ]];then
        	echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}$programPolybarB${endColour}${grayColour} ...${endColour}"
          apt remove $programPolybarB -y > /dev/null 2>&1
          echo -e " ${greenColour}(OK)${endColour}"
        fi
        sleep .25
      done

#UNINSTALL POLYBAR SHARE DEPENDENCIES
      for programPolybarS in "${dependenciesPolybarShare[@]}"; do
  			grep -q "$programPolybarS" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
        if [[ "$(echo $?)" != "0" ]];then
          	echo -en "\t${yellowColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}$programPolybarS${endColour}${grayColour} ...${endColour}"
            apt remove $programPolybarS -y > /dev/null 2>&1
            echo -e " ${greenColour}(OK)${endColour}"
        fi
        sleep .25
      done
			echo -e "${greenColour}[*]${endColour} ${grayColour}Uninstalled dependencies !${endColour}"
}
