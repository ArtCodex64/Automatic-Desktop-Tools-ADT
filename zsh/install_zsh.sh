#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION ZSH
################################################################################
################################################################################
################################################################################
function install_zsh_shell(){
	userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Shell${endColour} ${cyanColour}ZSH${endColour} ${grayColour}...${endColour}"
	grep -q "/bin/zsh" /etc/shells > /dev/null
	instaladaZsh1="$(echo $?)"
	grep -q "/usr/bin/zsh" /etc/shells > /dev/null
	instaladaZsh2="$(echo $?)"
  if [[ $instaladaZsh1 == "0" || $instaladaZsh2 == "0" ]];then
		echo -e "${greenColour}(OK)${endColour}"
	else
    apt install zsh -y > /dev/null 2>&1
		grep -q "/bin/zsh" /etc/shells > /dev/null
    Zsh1="$(echo $?)"
    grep -q "/usr/bin/zsh" /etc/shells > /dev/null
    Zsh2="$(echo $?)"
    if [[ $Zsh1 == "0" || $Zsh2 == "0" ]];then
    	echo -e "${greenColour}(OK)${endColour}"
		else
			echo -e "${redColour}(not installed)${endColour}"
			exit 0
    fi
	 fi
}
################################################################################
################################################################################
################################################################################
#UNINSTALL ZSH
################################################################################
################################################################################
################################################################################
function uninstall_zsh(){
userName="$(logname)"
      echo -en "${greenColour}[*]${endColour} ${grayColour}Uninstalling shell${endColour} ${cyanColour}ZSH${endColour} ${grayColour}...${endColour}"
      grep -q "/bin/zsh" /etc/shells > /dev/null
      instaladaZsh1="$(echo $?)"
      grep -q "/usr/bin/zsh" /etc/shells > /dev/null
      instaladaZsh2="$(echo $?)"
      if [[ $instaladaZsh1 != "0" || $instaladaZsh2 != "0" ]];then
  echo "${greenColour}(OK)${endColour}"
else
  apt remove zsh -y > /dev/null 2>&1
  apt purge zsh -y > /dev/null 2>&1
  grep -q "/bin/zsh" /etc/shells > /dev/null
        instaladaZsh1="$(echo $?)"
        grep -q "/usr/bin/zsh" /etc/shells > /dev/null
        instaladaZsh2="$(echo $?)"
        if [[ $instaladaZsh1 != "0" || $instaladaZsh2 != "0" ]];then
    echo "${greenColour}(OK)${endColour}"
  else
    echo "${redColour}(uninstalled)${endColour}"
    exit 0
  fi
fi
}
