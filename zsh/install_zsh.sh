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
	which zsh > /dev/null 2>/dev/null
	instaladaZsh3="$(echo $?)"
  if [[ $instaladaZsh1 == "0" || $instaladaZsh2 == "0" || $instaladaZsh3 == "0" ]];then
		usermod --shell /usr/bin/zsh $userName > /dev/null 2>/dev/null
		echo -e "${greenColour}(OK)${endColour}"
	else
    apt install zsh -y > /dev/null 2>&1
		cp ./configurations/.zshrc /home/$userName/
		cp ./configurations/.p10k.zsh /home/$userName/
		chmod 644 /home/$userName/.zshrc > /dev/null 2>&1
		chown $userName:$userName /home/$userName/.zshrc > /dev/null 2>&1
		chmod 644 /home/$userName/.p10k.zsh > /dev/null 2>&1
		chown $userName:$userName /home/$userName/.p10k.zsh > /dev/null 2>&1
		grep -q "/bin/zsh" /etc/shells > /dev/null
    Zsh1="$(echo $?)"
    grep -q "/usr/bin/zsh" /etc/shells > /dev/null
    Zsh2="$(echo $?)"
		which zsh > /dev/null 2>/dev/null
		instaladaZsh3="$(echo $?)"
    if [[ $Zsh1 == "0" || $Zsh2 == "0" || $instaladaZsh3 == "0" ]];then
			usermod --shell /usr/bin/zsh $userName > /dev/null 2>/dev/null
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
			which zsh
			instaladaZsh3="$(echo $?)"
      if [[ $instaladaZsh1 != "0" || $instaladaZsh2 != "0" || $instaladaZsh3 != "0" ]];then
  		echo "${greenColour}(OK)${endColour}"
			else
  			apt remove zsh -y > /dev/null 2>&1
  			apt purge zsh -y > /dev/null 2>&1
  			grep -q "/bin/zsh" /etc/shells > /dev/null
        instaladaZsh1="$(echo $?)"
        grep -q "/usr/bin/zsh" /etc/shells > /dev/null
        instaladaZsh2="$(echo $?)"
				which zsh
				instaladaZsh3="$(echo $?)"
        if [[ $instaladaZsh1 != "0" || $instaladaZsh2 != "0" || $instaladaZsh3 != "0" ]];then
    			echo "${greenColour}(OK)${endColour}"
  			else
    			echo "${redColour}(uninstalled)${endColour}"
    			exit 0
  			fi
			fi
}
