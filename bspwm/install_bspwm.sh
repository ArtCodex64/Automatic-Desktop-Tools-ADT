#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALL BSPWM UBUNTU-DEBIAN-PARROT
################################################################################
################################################################################
################################################################################
function bspwm_installation(){
tput civis
userName="$(logname)"
echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}bspwm${endColour} ${grayColour}...${endColour}"
if [[ ! -d "/home/$userName/bspwm" ]];then
  if [[ -d "/home/$userName" ]];then
    /usr/bin/git clone https://github.com/baskerville/bspwm.git /home/$userName/Descargas/bspwm > /dev/null 2>&1
  fi

  if [[ -d "/home/$userName/Descargas/bspwm" ]];then
    echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}bspwm${endColour} ${greenColour}(installed)${endColour}"
    sleep .25
  else
    echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}bspwm${endColour} ${redColour}(not installed)${endColour}"
    sleep .25
    tput cnorm
    exit 0
  fi
else
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}BSWPWM installed !${endColour}"
fi
#Move the sxhkd files
      if [[ -d "/home/$userName/Descargas/bspwm" ]];then
              move_bspwm_files
      fi
#INSTALL BSPWM
if [[ -d "/home/$userName/bspwm" ]];then
  make_bspwm
  cp_bspwm_example_files
fi
tput cnorm
}
################################################################################
################################################################################
################################################################################
#MOVE BSPWM FILES TO /home/$userName/
################################################################################
################################################################################
################################################################################
function move_bspwm_files(){
userName="$(logname)"
echo -e "${cyanColour}[*]${endColour} ${grayColour}Moviendo archivos${endColour} ${cyanColour}bspwm${endColour} ${grayColour}al path${endColour} ${cyanColour}~/root/${endColour} ${grayColour}...${endColour}"
sleep .25
if [[ -d "/home/$userName/Descargas/bspwm" ]];then
  mv /home/$userName/Descargas/bspwm /home/$userName/
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Archivos movidos${endColour} ${cyanColour}~/Downloads/bspwm${endColour} ${grayColour}...${endColour} ${greenColour}(ok)${endColour}"
  sleep .25
fi
}
#INSTALL BSPWM WITH MAKE
function make_bspwm(){
  userName="$(logname)"
  (cd /home/$userName/bspwm ; /usr/bin/make > /dev/null ; /usr/bin/make install > /dev/null ; apt-get install bspwm -y > /dev/null )
  echo -e "\t${greenColour}[*]${endColour}${grayColour}Instalación de BSPWM finalizada !${endColour}"
}
################################################################################
################################################################################
################################################################################
#CP BSPWM EXAMPLE FILES
################################################################################
################################################################################
################################################################################
function cp_bspwm_example_files(){
#CREATE BSPWM DIRECTORY
  userName="$(logname)"
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}Creando directorio: ${endColour}${cyanColour}bspwm${endColour} ${grayColour}...${endColour}"
  if [[ ! -d "/home/$userName/.config/bspwm" ]];then
    mkdir /home/$userName/.config/bspwm
  fi
  sleep .25
  cp /home/$userName/bspwm/examples/bspwmrc /home/$userName/.config/bspwm/
  echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivo: ${endColour}${cyanColour}bspwmrc${endColour} ${grayColour}...${endColour}"
  sleep .25
  chmod +x /home/$userName/.config/bspwm/bspwmrc
  echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Añadiendo permiso de ejecución: ${endColour}${cyanColour}chmod +x ~/.config/bspwm/bspwmrc${endColour} ${grayColour}...${endColour}"
  sleep .25
  echo -e "\t\t\t${greenColour}[*]${endColour} ${grayColour}Listo !${endColour}"
}
################################################################################
################################################################################
################################################################################
#UNINSTALL BSPWM
################################################################################
################################################################################
################################################################################
function uninstall_bspwm(){
userName="$(logname)"
echo -e "${greenColour}[*][*][*]${endColour} ${grayColour}Uninstalling files${endColour} ${cyanColour}BSPWM${endColour} ${grayColour}...${endColour}"
      #DELETE BSPWM FILES
      if [[ -d "/home/$userName/bspwm" ]];then
              echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Uninstalling${endColour} ${cyanColour}bspwm${endColour} ${grayColour}... !${endColour}"
              apt-get remove --auto-remove bspwm -y > /dev/null 2>/dev/null
              apt-get purge bspwm -y > /dev/null 2>/dev/null
              apt-get purge --auto-remove bspwm -y > /dev/null 2>/dev/null
              rm -r /home/$userName/bspwm > /dev/null 2>/dev/null
              if [[ -d "/home/$userName/.config/bspwm" ]];then
                      echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Deleting${endColour} ${cyanColour}bspwm${endColour} ${grayColour}configuration files ...${endColour}"
                      rm -r /home/$userName/.config/bspwm
                      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Configuration files deleted !${endColour}"
              fi
              if [[ ! -d "/home/$userName/bspwm" && ! -d "/home/$userName/.config/bspwm" ]];then
                      echo -e "\t\t\t${greenColour}[*]${endColour} ${grayColour}Uninstalled${endColour} !${endColour}"
              else
                      echo -e "\t\t\t${redColour}[*]${endColour} ${cyanColour}BSPWM${endColour} ${grayColour}not uninstalled.${endColour}"
              fi
      fi
      echo -e "\t\t\t${greenColour}[*][*][*]${endColour} ${grayColour}Uninstall completed !${endColour}"
}
################################################################################
################################################################################
################################################################################
#INSTALL BSPWM ARCH-LINUX
################################################################################
################################################################################
################################################################################
function bspwm_installation_arch(){
  tput civis
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}bspwm${endColour} ${grayColour}...${endColour}"
  dependencies=(xorg libxcb xcb-util xcb-util-wm xcb-util-keysyms bspwm sxhkd lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings rxvt-unicode xorg-xinit xterm)
  #mkdir ~/.config
  #mkdir ~/.config/bspwm
  #mkdir ~/.config/sxhkd
  # install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
  # install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
  #Arracnar lightdm systemctl enable lightdm
  for program in "${dependencies[@]}";do
    pacman -Qs $program > /dev/null 2>&1
    instaladoP="$(echo $?)"
    test -f /usr/bin/$program > /dev/null 2>&1
    instaladoT="$(echo $?)"
    which $program > /dev/null 2>&1
    instaladoW="$(echo $?)"
    if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
      if [[ $program == "xorg" ]];then
        yes "" "" | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      else
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      fi
      sleep .25
    else
      if [[ $program == "xorg" ]];then
        yes "" "" | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      elif [[ $program == "bspwm" || $program == "sxhkd" ]];then
        yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      elif [[ $program == "lightdm" || $program == "lightdm-gtk-greeter" ]];then
        yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      elif [[ $program == "lightdm-gtk-greeter-settings" ]];then
        yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      else
        yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
        echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      fi
      sleep .25
      tput cnorm
    fi
  done
  for program in "${dependencies[@]}";do
    if [[ $program == "rxvt-unicode" ]];then
      pacman -Qs urxvt > /dev/null 2>&1
      instaladoP="$(echo $?)"
      test -f /usr/bin/urxvt > /dev/null 2>&1
      instaladoT="$(echo $?)"
      which urxvt > /dev/null 2>&1
      instaladoW="$(echo $?)"
    else
      pacman -Qs $program > /dev/null 2>&1
      instaladoP="$(echo $?)"
      test -f /usr/bin/$program > /dev/null 2>&1
      instaladoT="$(echo $?)"
      which $program > /dev/null 2>&1
      instaladoW="$(echo $?)"
    fi
    if [[ $instaladoP != "0" && $instaladoT != "0" && $instaladoW != "0" ]];then
      echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}$program${endColour} ${redColour}(not installed)${endColour}"
      sleep .25
      tput cnorm
      exit 0
    fi
  done

  mkdir_bspwm
  install_bspwmrc_sxhkdrc
  chmod_bspwmrc
  lightdm_enable

  tput cnorm
}

function mkdir_bspwm(){
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Creando directorios${endColour} ${cyanColour}~/.config/bspwm ~/.config/sxhkd${endColour} ${grayColour}...${endColour}"
  mkdir /home/$userName/.config > /dev/null 2>/dev/null
  mkdir /home/$userName/.config/bspwm > /dev/null  2>/dev/null
  mkdir /home/$userName/.config/sxhkd > /dev/null 2>/dev/null
  if [[ -d "/home/$userName/.config/bspwm" || -d "/home/$userName/.config/bspwm" || -d "/home/$userName/.config/sxhkd" ]];then
    echo -e "\t${grayColour}Direcotorios creado !${endColour}"
  else
    echo -e "\t${redColour}Directorios no creados !${endColour}"
  fi
}

function install_bspwmrc_sxhkdrc(){
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Copiando archvios${endColour} ${cyanColour}~/.config/bspwm/bspwmrc${endColour} ${grayColour}y${endColour} ${cyanColour}~/.config/sxhkd/sxhkdrc${endColour}${grayColour}...${endColour}"
  install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc /home/$userName/.config/bspwm/bspwmrc
  install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc /home/$userName/.config/sxhkd/sxhkdrc
  if [[ -f "/home/$userName/.config/bspwm/bspwmrc" || -f "/home/$userName/.config/sxhkd/sxhkdrc" ]];then
    echo -e "\t${grayColour}Instalados !${endColour}"
  fi
}

function chmod_bspwmrc(){
  userName="$(logname)"
  chmod u+o /home/$userName/.config/bspwm/bspwmrc
  echo -e "\t${grayColour}Permisos asignados a ${cyanColour}bspwmrc${endColour} !${endColour}"
}

function lightdm_enable(){
  systemctl enable lightdm.service > /dev/null 2>&1
  echo -e "\t${grayColour}Enable ${cyanColour}lightdm${endColour} !${endColour}"
}
