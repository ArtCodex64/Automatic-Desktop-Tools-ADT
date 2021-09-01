#!/bin/bash

################################################################################
################################################################################
################################################################################
#SXHKD AND SXHKD INSTALLATION
################################################################################
################################################################################
################################################################################
function sxhkd_installation(){
      tput civis
userName="$(logname)"
      echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}sxhkd${endColour} ${grayColour}...${endColour}"
      if [[ ! -d "/home/$userName/sxhkd" ]];then
              if [[ -d "/home/$userName" ]];then
                      /usr/bin/git clone https://github.com/baskerville/sxhkd.git /home/$userName/Descargas/sxhkd > /dev/null 2>&1
              fi

              if [[ -d "/home/$userName/Descargas/sxhkd" ]];then
                      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}sxhkd${endColour} ${greenColour}(installed)${endColour}"
                      sleep .25
              else
                      echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}sxhkd${endColour} ${redColour}(not installed)${endColour}"
                      sleep .25
                      tput cnorm
                      exit 0
              fi
      else
              echo -e "\t${greenColour}[*]${endColour} ${grayColour}SXHKD installed !${endColour}"
      fi
#Move the sxhkd files
if [[ -d "/home/$userName/Descargas/sxhkd" ]];then
  move_sxhkd_files
fi
#INSTALL SXHKD
if [[ -d "/home/$userName/sxhkd" ]];then
              make_sxhkd
  cp_sxhkd_example_files
  sxhkdrc_configuration
      fi

      tput cnorm
}
################################################################################
################################################################################
################################################################################
#MOVE SXHKD FILES TO /home/$userName/
################################################################################
################################################################################
################################################################################
function move_sxhkd_files(){
userName="$(logname)"
      echo -e "${cyanColour}[*]${endColour} ${grayColour}Moviendo archivos${endColour} ${cyanColour}sxhkd${endColour} ${grayColour}al path${endColour} ${cyanColour}~/root/${endColour} ${grayColour}...${endColour}"
      sleep .25
      if [[ -d "/home/$userName/Descargas/sxhkd" ]];then
              mv /home/$userName/Descargas/sxhkd /home/$userName/
              echo -e "${cyanColour}[*]${endColour} ${grayColour}Archivos movidos${endColour} ${cyanColour}~/Downloads/sxhkd${endColour} ${grayColour}...${endColour} ${greenColour}(ok)${endColour}"
              sleep .25
      fi
}
################################################################################
################################################################################
################################################################################
#INSTALL SXHKD WITH MAKE
################################################################################
################################################################################
################################################################################
function make_sxhkd(){
userName="$(logname)"
      (cd /home/$userName/sxhkd ; /usr/bin/make > /dev/null ; /usr/bin/make install > /dev/null ; apt-get install sxhkd -y > /dev/null)
echo -e "\t${greenColour}[*]${endColour}${grayColour}Instalación de SXHKD finalizada !${endColour}"
}
################################################################################
################################################################################
################################################################################
#CP SXHKD EXAMPLE FILES
################################################################################
################################################################################
################################################################################
function cp_sxhkd_example_files(){
userName="$(logname)"
      #CREATE SXHKD DIRECTORY
      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Creando directorio: ${endColour}${cyanColour}bspwm${endColour} ${grayColour}...${endColour}"
      if [[ ! -d "/home/$userName/.config/sxhkd" ]];then
              mkdir /home/$userName/.config/sxhkd
      fi
      sleep .25
      cp /home/$userName/bspwm/examples/sxhkdrc /home/$userName/.config/sxhkd/
      echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivo: ${endColour}${cyanColour}sxhkd${endColour} ${grayColour}...${endColour}"
      sleep .25
      echo -e "\t\t\t${greenColour}[*]${endColour} ${grayColour}Listo !${endColour}"
}
################################################################################
################################################################################
################################################################################
#Configurar archivo SXHKD
################################################################################
################################################################################
################################################################################
function sxhkdrc_configuration(){
userName="$(logname)"
echo -e "${cyanColour}[*]${endColour}${grayColour}Asignando consola BASH en configuración SXHKD !${endColour}"
sed -i 's/urxvt/gnome-terminal/' /home/$userName/.config/sxhkd/sxhkdrc
echo -e "\t${greenColour}[*]${endColour} ${grayColour}Listo !${endColour}"
}
################################################################################
################################################################################
################################################################################
#UNINSTALL SXHKD
################################################################################
################################################################################
################################################################################
function uninstall_sxhkd(){
userName="$(logname)"
echo -e "${greenColour}[*][*][*]${endColour} ${grayColour}Uninstalling files${endColour} ${cyanColour}SXHKD${endColour} ${grayColour}...${endColour}"
      #DELETE SXHKD FILES
      if [[ -d "/home/$userName/sxhkd" ]];then
              echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Uninstalling${endColour} ${cyanColour}sxhkd${endColour} ${grayColour}... !${endColour}"
              rm -r /home/$userName/sxhkd
              if [[ -d "/home/$userName/.config/sxhkd" ]];then
                      echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Deleting${endColour} ${cyanColour}sxhkd${endColour} ${grayColour}configuration files ...${endColour}"
                      rm -r /home/$userName/.config/sxhkd
                      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Configuration files deleted !${endColour}"
              fi
              if [[ ! -d "/home/$userName/sxhkd" && ! -d "/home/$userName/.config/sxhkd" ]];then
                      echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}Uninstalled${endColour} !${endColour}"
              else
                      echo -e "\t\t${redColour}[*]${endColour} ${cyanColour}SXHKD${endColour} ${grayColour}not uninstalled.${endColour}"
              fi
      fi
      echo -e "\t\t\t${greenColour}[*][*][*]${endColour} ${grayColour}Uninstall completed !${endColour}"
}

################################################################################
################################################################################
################################################################################
#INSTALL SXHKD IN ARCH
################################################################################
################################################################################
################################################################################
function sxhkd_installation_arch(){
tput civis
userName="$(logname)"
echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}sxhkd${endColour} ${grayColour}...${endColour}"
dependencies=(xorg-server xorg-xinit xf86-video-qxl sxhkd picom)
which sxhkd
instalado="$(echo $?)"
if [[ $instalado != "0" ]];then
  for program in "${dependencies[@]}";do
    yes | pacman -Sy $program
  done
  which sxhkd
  instalado="$(echo $?)"
  if [[ $instalado == "0" ]];then
    for program in "${dependencies[@]}";do
      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(installed)${endColour}"
      sleep .25
    done
  else
    for program in "${dependencies[@]}";do
      echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}bspwm${endColour} ${redColour}(not installed)${endColour}"
      sleep .25
      tput cnorm
      exit 0
    done
  fi
else
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}BSWPWM files installed !${endColour}"
fi

mkdir_sxhkd
cp_sxhkd
cp_sxkhd

tput cnorm
}

function mkdir_sxhkd(){
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Creando directorio${endColour} ${cyanColour}~/.config/bspwm${endColour} ${grayColour}...${endColour}"
  mkdir /home/$userName/.config/sxhkd
  if [[ -d "/home/$userName/.config/sxhkd" ]];then
    echo -e "\t${grayColour}Direcotorio creado !${endColour}"
  fi
}

function cp_sxhkdrc(){
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Copiando archvio${endColour} ${cyanColour}~/.config/bspwm/bspwmrc${endColour} ${grayColour}...${endColour}"
  cp /usr/share/doc/bspwm/examples/sxhkdrc /home/$userName/.config/sxhkd/
  if [[ -f "/home/$userName/.config/sxhkd/sxhkdrc" ]];then
    echo -e "\t${grayColour}Archivo copiado !${endColour}"
  fi
}

function config_sxhkdrc(){
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour}${grayColour}Asignando consola BASH en configuración SXHKD !${endColour}"
  sed -i 's/urxvt/zsh/' /home/$userName/.config/sxhkd/sxhkdrc
  echo -e "\t${greenColour}[*]${endColour} ${grayColour}Listo !${endColour}"
}
