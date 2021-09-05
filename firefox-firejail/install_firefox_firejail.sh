#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION FIREFOX WITH FIREFAIL
################################################################################
################################################################################
################################################################################
function firefox_firejail_installation(){
      tput civis
      userName="$(logname)"
      echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}firefox${endColour} ${grayColour}...${endColour}"
      instalado="$(apt -qq list firefox --installed 2>/dev/null | wc -l > /dev/null)"
      test -f /usr/bin/firefox
      instaladoT="$(echo $?)"
      which firefox > /dev/null
      instaladoW="$(echo $?)"
      if [[ $instalado == "1" || $instaladoT == "0" || $instaladoW == "0" ]];then
              grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
              if [[ "$(echo $?)" != "0" ]];then
                  echo -e "\n#WEB BROWSER" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
                  echo "firefox" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              fi
              echo -e "${greenColour}(OK)${endColour}${grayColour}${endColour}"
      else
        apt install firefox -y > /dev/null 2>&1
        instaladoComp="$(apt -qq list firefox --installed 2>/dev/null | wc -l)"
        test -f /usr/bin/firefox
        instaladoT="$(echo $?)"
        which firefox > /dev/null
        instaladoW="$(echo $?)"
        if [[ $instaladoComp == "1" || $instaladoT == "0" || $instaladoW == "0" ]];then
          echo -e "${greenColour}(OK)${endColour}${grayColour}!${endColour}"
        else
          echo -e "${redColour}(not installed)${endColour}"
          exit 0
        fi
        #sleep 1.25
      fi
###
      echo -en "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}firejail${endColour} ${grayColour}...${endColour}"
      test -f /usr/bin/firejail > /dev/null
      if [[ "$(echo $?)" == "0" ]];then
              grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
              if [[ "$(echo $?)" != "0" ]];then
              echo -e "\n#WEB BROWSER SECURITY" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              echo "firejail" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
              fi
              echo -e "${greenColour}(OK)${endColour}${grayColour}!${endColour}"
      else
              apt-get install firejail -y > /dev/null 2>&1
              instaladoComp="$(apt -qq list firejail --installed 2>/dev/null | wc -l)"
              if [[ $instaladoComp == "1" ]];then
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
function uninstall_firefox_firejail(){
tput civis
userName="$(logname)"
grep -q "firefox" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt > /dev/null
      if [[ "$(echo $?)" != "0" ]];then
        echo -e "${cyanColour}[+] ${endColour}${grayColour}Uninstalling dependencies: ${endColour} ${cyanColour}FIREFOXS${endColour}${grayColour} ...${endColour}"
              apt remove firefox -y > /dev/null 2>&1
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
              apt remove firejail -y > /dev/null 2>&1
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
