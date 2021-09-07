#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION POWERLEVEL10K
################################################################################
################################################################################
################################################################################
function install_powerlevel_10k_arch(){
userName="$(logname)"
echo -en "${cyanColour}[*]${endColour} ${grayColour}Dependencia${endColour} ${cyanColour}PowerLevel10k${endColour} ${grayColour}...${endColour}"
if [[ ! -d "/home/$userName/.config/AUTOMATICOESC/powerlevel10k" ]];then
  /usr/bin/git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$userName/.config/AUTOMATICOESC/powerlevel10k > /dev/null 2>/dev/null
  grep -q "source /home/$userName/.config/AUTOMATICOESC/powerlevel10k/powerlevel10k.zsh-theme" /home/$userName/.zshrc > /dev/null 2>/dev/null
  if [[ "$(echo $?)" != "0" ]];then
    echo -e "source /home/$userName/.config/AUTOMATICOESC/powerlevel10k/powerlevel10k.zsh-theme" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
    echo -e "${greenColour}(OK)${endColour}"
  else
    echo -e "${greenColour}(was configured)${endColour}"
  fi
else
  echo -e "${greenColour}(OK)${endColour}"
fi
}

#UNINSTALL POWERLEVEL10K
function uninstall_powerlevel10k_arch(){
userName="$(logname)"
echo -en "${greenColour}[*]${endColour} ${grayColour}Uninstalling${endColour} ${cyanColour}powerlevel10k${endColour} ${grayColour}...${endColour}"
if [[ -d "/home/$userName/.config/AUTOMATICOESC/powerlevel10k" ]];then
  rm -r /home/$userName/.config/AUTOMATICOESC/powerlevel10k
  if [[ ! -d "/home/$userName/powerlevel10k" ]];then
    echo -e "${greenColour}(OK)${endColour}"
  else
    echo -e "${redColour}(not deleted)${endColour}"
    exit 0
  fi
else
  echo -e "${greenColour}(OK)${endColour}"
fi
}

################################################################################
################################################################################
################################################################################
#INSTALLATION POWERLEVEL10K IN ARCH-LINUX
################################################################################
################################################################################
################################################################################
function install_powerlevel10k_arch(){
  echo "Hola"
}
