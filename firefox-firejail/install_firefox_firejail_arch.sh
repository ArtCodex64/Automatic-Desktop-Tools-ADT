#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION FIREFOX WITH FIREFAIL ARCH
################################################################################
################################################################################
################################################################################
function firefox_firejail_installation_arch(){
      tput civis
      userName="$(logname)"
      echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}firefox${endColour} ${grayColour}...${endColour}"
      pacman -Qs firefox > /dev/null 2>&1
      instaladoP="$(echo $?)"
      test -f /usr/bin/firefox > /dev/null 2>&1
      instaladoT="$(echo $?)"
      which firefox > /dev/null 2>&1
      instaladoW="$(echo $?)"
      if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
              grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
              if [[ "$(echo $?)" != "0" ]];then
                  echo -e "\n#WEB BROWSER" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
                  echo "firefox" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              fi
              echo -e "${greenColour}(OK)${endColour}${grayColour}${endColour}"
      else
        yes | pacman -Sy firefox --noconfirm > /dev/null 2>/dev/null
        pacman -Qs firefox > /dev/null 2>/dev/null
        instaladoP="$(echo $?)"
        test -f /usr/bin/firefox > /dev/null 2>/dev/null
        instaladoT="$(echo $?)"
        which firefox > /dev/null 2>/dev/null
        instaladoW="$(echo $?)"
        if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
          echo -e "${greenColour}(OK)${endColour}${grayColour}${endColour}"
        else
          echo -e "${redColour}(not installed)${endColour}"
          exit 0
        fi
        #sleep 1.25
      fi
###
      echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}firejail${endColour} ${grayColour}...${endColour}"
      pacman -Qs firejail > /dev/null 2>/dev/null
      instaladoP="$(echo $?)"
      test -f /usr/bin/firejail > /dev/null 2>/dev/null
      instaladoT="$(echo $?)"
      which firejail > /dev/null 2>/dev/null
      instaladoW="$(echo $?)"
      if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
              grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
              if [[ "$(echo $?)" != "0" ]];then
              echo -e "\n#WEB BROWSER SECURITY" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              echo "firejail" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              fi
              echo -e "${greenColour}(OK)${endColour}${grayColour}${endColour}"
      else
              yes | pacman -Sy firejail --noconfirm > /dev/null 2>/dev/null
              pacman -Qs firefox > /dev/null 2>/dev/null
              instaladoP="$(echo $?)"
              test -f /usr/bin/firefox > /dev/null 2>/dev/null
              instaladoT="$(echo $?)"
              which firefox > /dev/null 2>/dev/null
              instaladoW="$(echo $?)"
              if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
                      echo -e "${greenColour}(OK)${endColour}"
              else
                      echo -e "${redColour}(not installed)${endColour}"
                      exit 0
              fi
              #sleep 1.25
      fi
###
      test -f /usr/bin/firefox > /dev/null
      if [[ "$(echo $?)" == "0" ]];then
        test -f /usr/bin/firejail > /dev/null
        if [[ "$(echo $?)" == "0" ]];then
          firefox_firejail_configuration
        fi
      fi
      tput cnorm
}
################################################################################
################################################################################
################################################################################
#UNINSTALL FIREFOX && FIREJAIL
################################################################################
################################################################################
################################################################################
function uninstall_firefox_firejail_arch(){
tput civis
userName="$(logname)"
grep -q "firefox" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt > /dev/null
      if [[ "$(echo $?)" != "0" ]];then
        echo -e "${cyanColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}FIREFOXS${endColour}${grayColour} ...${endColour}"
              yes | pacman -R firefox > /dev/null 2>/dev/null
              echo -e "\t\t${greenColour}[*]${endColour}${grayColour}Uninstalled !${endColour}"
              echo -e "\t\t\t${greenColour}[*]${endColour} ${grayColour}OK !${endColour}"
      fi
test -f  /usr/bin/firefox > /dev/null
      if [[ "$(echo $?)" != "0" ]];then
        echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}FIREFOX${endColour} ${greenColour}(not installed)${endColour}"
      else
        echo -e "${redColour}[*]${endColour} ${grayColour}FIREFOX${endColour} ${redColour}(installed)${endColour}"
      fi
      sleep .25
grep -q "firejail" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt > /dev/null
      if [[ "($echo $?)" != "0" ]];then
              echo -e "${cyanColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}firejail${endColour}${grayColour} ...${endColour}"
              yes | pacman -R firejail > /dev/null 2>/dev/null
              echo -e "\t\t${greenColour}[*]${endColour}${grayColour}Uninstalled !${endColour}"
              echo -e "\t\t\t${greenColour}[*]${endColour} ${grayColour}OK !${endColour}"
      fi
      test -f  /usr/bin/firejail > /dev/null
      if [[ "$(echo $?)" != "0" ]];then
              echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}FIREJAIL${endColour} ${greenColour}(not installed)${endColour}"
      else
              echo -e "\t\t${redColour}[*]${endColour} ${grayColour}FIREJAIL${endColour} ${redColour}(installed)${endColour}"
      fi
      sleep .25

tput cnorm
}
