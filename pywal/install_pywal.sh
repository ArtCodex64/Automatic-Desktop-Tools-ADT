#!/bin/bash

function install_pywal(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Installing pywal ... ${endColour}"
  if [[ $operting_system == "ubuntu" || $operating_system == "debian" || $operating_system == "parrot" ]];then
    apt install python -y > /dev/null 2>/dev/null
    apt install python3-pip -y > /dev/null 2>/dev/null
    apt install imagemagick -y > /dev/null 2>/dev/null
    pip3 install pywal > /dev/null 2>/dev/null
    pip3 list pywal > /dev/null 2>/dev/null
    instalado="$(echo $?)"
    if [[ $instalado == "0" ]];then
      config_pywal
      echo -e "${greenColour}(OK)${endColour}"
    else
      echo -e "${redColour}(not installed)${endColour}"
      exit 0
    fi
  elif [[ $operating_system == "arch" ]];then
    yes | pacman -Sy python --noconfirm > /dev/null 2>/dev/null
    yes | pacman -Sy python-pip --noconfirm > /dev/null 2>/dev/null
    yes | pacman -Sy imagemagick --noconfirm > /dev/null 2>/dev/null
    pip3 install pywal > /dev/null 2>/dev/null
    pip3 list pywal > /dev/null 2>/dev/null
    instalado="$(echo $?)"
    if [[ $instalado == "0" ]];then
      config_pywal
      echo -e "${greenColour}(OK)${endColour}"
    else
      echo -e "${redColour}(not installed)${endColour}"
      exit 0
    fi
  fi
}

function config_pywal(){
  userName="$(logname)"
  if [[ $operating_system == "ubuntu" ]];then
    echo -e "\n#PYWAL" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
    echo -e "#wal -i /home/$userName/BGIMAGES/fondo-ubuntu.jpg & > /dev/null 2>/dev/null" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
  elif [[ $operating_system == "debian" ]];then
    echo -e "\n#PYWAL" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
    echo -e "#wal -i /home/$userName/BGIMAGES/fondo-debian.jpg & > /dev/null 2>/dev/null" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
  elif [[ $operating_system == "parrot" ]];then
    echo -e "\n#PYWAL" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
    echo -e "#wal -i /home/$userName/BGIMAGES/fondo-parrot.jpg & > /dev/null 2>/dev/null" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
  elif [[ $operating_system == "arch" ]];then
    echo -e "\n#PYWAL" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
    echo -e "#wal -i /home/$userName/BGIMAGES/fondo-arch-linux.jpg & > /dev/null 2>/dev/null" | tee -a /home/$userName/.zshrc > /dev/null 2>/dev/null
  fi
  mkdir /home/$userName/.config/wal
  chown -R $userName:$userName /home/$userName/.config/wal
}
