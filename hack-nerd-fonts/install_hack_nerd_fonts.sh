#!/bin/bash

################################################################################
################################################################################
################################################################################
#HACK NERD FONTS INSTALLATION
################################################################################
################################################################################
################################################################################
function hack_nerd_fonts_installation(){
echo -en "${cyanColour}[*]${endColour} ${grayColour}Checking${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}...${endColour}"
cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
if [[ "$(echo $?)" != "0" ]];then
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -P /usr/local/share/fonts/ > /dev/null 2>&1
  if [[ -f "/usr/local/share/fonts/Hack.zip" ]];then
    (cd /usr/local/share/fonts/ ; unzip Hack.zip > /dev/null 2>&1)
    cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
    if [[ "$(echo $?)" == "0" ]];then
      echo -e "${greenColour}(OK)${endColour}"
      (cd /usr/local/share/fonts/ ; rm Hack.zip > /dev/null 2>&1)
    fi
  fi
else
  echo -e "${greenColour}(OK)${endColour}"
fi
}
#UNINSTALLING HACK NERD FONTS
function uninstall_hack_nerd_fonts(){
cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
if [[ "$(echo $?)" == "0" ]];then
  echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Deleting${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}...${endColour}"
  rm /usr/local/share/fonts/*.ttf > /dev/null
  cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
  if [[ "$(echo $?)" != "0" ]];then
    echo -e "\t${greenColour}[*]${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}files deleted !${endColour}"
  fi
else
  echo -e "\t${greenColour}[*]${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour} files don't exist !${endColour}"
fi
}
################################################################################
################################################################################
################################################################################
#HACK NERD FONTS INSTALLATION ARCH
################################################################################
################################################################################
################################################################################
function hack_nerd_fonts_installation_arch(){
  tput civis
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}Hack nerd fonts${endColour} ${grayColour}...${endColour}"
  dependencies=(wget unzip)
  for program in "${dependencies[@]}";do
    pacman -Qs $program > /dev/null 2>&1
    instaladoP="$(echo $?)"
    test -f /usr/bin/$program > /dev/null 2>&1
    instaladoT="$(echo $?)"
    which $program > /dev/null 2>&1
    instaladoW="$(echo $?)"
    if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      sleep .25
    else
      yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
      sleep .25
      tput cnorm
    fi
    pacman -Qs $program > /dev/null 2>&1
    instaladoP="$(echo $?)"
    test -f /usr/bin/$program > /dev/null 2>&1
    instaladoT="$(echo $?)"
    which $program > /dev/null 2>&1
    instaladoW="$(echo $?)"
    if [[ $instaladoP == "0" && $instaladoT == "0" && $instaladoW == "0" ]];then
      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      sleep .25
    else
      echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}$program${endColour} ${redColour}(not installed)${endColour}"
      sleep .25
      tput cnorm
      exit 0
    fi
  done
echo -e "${cyanColour}[*]${endColour} ${grayColour}Checking Hack Nerd Fonts ...${endColour}"
if [[ ! -d "/usr/local/share/fonts" ]];then
  mkdir /usr/local/share/fonts > /dev/null 2>&1
fi
cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
if [[ "$(echo $?)" != "0" ]];then
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}Downloading${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}...${endColour}"
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -P /usr/local/share/fonts/ > /dev/null 2>&1
  if [[ -f "/usr/local/share/fonts/Hack.zip" ]];then
    echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}Installing ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}...${endColour}"
    (cd /usr/local/share/fonts/ ; unzip Hack.zip > /dev/null 2>&1)
    cat "/usr/local/share/fonts/Hack Regular Nerd Font Complete.ttf" > /dev/null 2>&1
    if [[ "$(echo $?)" == "0" ]];then
      echo -e "\t\t\t${greenColour}[*]${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}installed !${endColour}"
      echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}Deleting${endColour} ${cyanColour}Hack.zip${endColour} ${grayColour}file${endColour}"
      (cd /usr/local/share/fonts/ ; rm Hack.zip > /dev/null 2>&1)
      if [[ ! -f "/usr/local/share/fonts/Hack.zip" ]];then
        echo -e "\t\t\t${greenColour}[*]${endColour} ${cyanColour}Hack.zip${endColour} ${grayColour}deleted !${endColour}"
      fi
    fi
  fi
else
  echo -e "${greenColour}[*]${endColour} ${cyanColour}Hack Nerd Fonts${endColour} ${grayColour}installed !${endColour}"
fi
}
