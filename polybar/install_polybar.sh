#!/bin/bash

################################################################################
################################################################################
################################################################################
#Installatión polybar UBUNTU-DEBIAN-PARROT
################################################################################
################################################################################
################################################################################
function polybar_installation(){
tput civis
      userName="$(logname)"
      echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}polybar${endColour} ${grayColour}...${endColour}"
      if [[ ! -d "/home/$userName/polybar" ]];then
              if [[ -d "/home/$userName" ]];then
                      /usr/bin/git clone --recursive https://github.com/polybar/polybar /home/$userName/polybar > /dev/null 2>&1
              fi

              if [[ -d "/home/$userName/polybar" ]];then
                      echo -e "\t${greenColour}[*] ${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}polybar${endColour} ${greenColour}(installed)${endColour}"
                      sleep .25
              else
                      echo -e "\t${redColour}[*] ${endColour}${grayColour}Error:${endColour} ${cyanColour}polybar${endColour} ${redColour}(not installed)${endColour}"
                      sleep .25
                      tput cnorm
                      exit 0
              fi
      else
              echo -e "\t${greenColour}[*]${endColour} ${grayColour}POLYBAR files${endColour} ${greenColour}(ok)${endColour}"
      fi
      #INSTALL POLYBAR
      if [[ -d "/home/$userName/polybar" ]];then
              echo -e "${cyanColour}[*]${endColour}${grayColour}Making the polybar ... !${endColour}"
              make_polybar
              install_net_tools
              configure_polybar
      fi

      tput cnorm

}
################################################################################
################################################################################
################################################################################
#INSTALL POLYBAR WITH MAKE
################################################################################
################################################################################
################################################################################
function make_polybar(){
      userName="$(logname)"
#CREAR DIRECTORIO POLYBAR/BUILD
  if [[ ! -d "/home/$userName/polybar/build" ]];then
    mkdir /home/$userName/polybar/build > /dev/null 2>&1
  fi;
#EJECUTAMOS COMANDO
  (cd /home/$userName/polybar/build/ ; cmake .. > /dev/null 2>&1 ; make -j $(nproc) > /dev/null 2>&1 ; make install > /dev/null 2>&1)
  echo -e "\t${greenColour}[*] ${endColour}${grayColour}Instalación de POLYBAR finalizada !${endColour}"
}
################################################################################
################################################################################
################################################################################
#INSTALLING NET-TOOLS
################################################################################
################################################################################
################################################################################
function install_net_tools(){
  apt install net-tools -y > /dev/null 2>&1
}
################################################################################
################################################################################
################################################################################
#CONFIGURE POLYBAR
################################################################################
################################################################################
################################################################################
function configure_polybar(){
userName="$(logname)"
if [[ ! -d "/home/$userName/.config/polybar" ]];then
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Configurado POLYBAR ...${endColour}"
  mkdir /home/$userName/.config/polybar > /dev/null 2>&1
fi
if [[ -d "/home/$userName/.config/polybar" ]];then
  echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Directorio${endColour} ${cyanColour}/home/$userName/.config/polybar${endColour} ${grayColour}creado !${endColour}"
  echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Clonando repositorio de git:${endColour} ${cyanColour}Blue-sky${endColour} ${grayColour}...${endColour}"
  /usr/bin/git clone https://github.com/VaughnValle/blue-sky.git /home/$userName/Descargas/blue-sky > /dev/null 2>&1
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivos de${endColour} ${cyanColour}blue-sky${endColour} ${grayColour}...${endColour}"
  cp -r /home/$userName/Descargas/blue-sky/polybar/* /home/$userName/.config/polybar/ > /dev/null 2>&1
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour}${grayColour}Borrando archivo${endColour} ${cyanColour}current.ini${endColour} ${grayColour}...${endColour}"
  rm /home/$userName/.config/polybar/current.ini > /dev/null 2>/dev/null
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour}${grayColour}Copiando archivo${endColour} ${cyanColour}current.ini${endColour} ${grayColour}...${endColour}"
  cp ./configurations/current-polybar.ini /home/$userName/.config/polybar/current.ini > /dev/null 2>/dev/null
  chown $userName:$userName /home/$userName/.config/polybar/current.ini > /dev/null 2>/dev/null
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour}${grayColour}Borrando archivo${endColour} ${cyanColour}launch.sh${endColour} ${grayColour}...${endColour}"
  rm /home/$userName/.config/polybar/launch.sh > /dev/null 2>/dev/null
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour}${grayColour}Copiando archivo${endColour} ${cyanColour}launch.sh${endColour} ${grayColour}...${endColour}"
  cp ./configurations/launch-polybar.sh /home/$userName/.config/polybar/launch.sh > /dev/null 2>/dev/null
  chown $userName:$userName /home/$userName/.config/polybar/launch.sh > /dev/null 2>/dev/null
  chmod +x /home/$userName/.config/polybar/launch.sh > /dev/null 2>/dev/null
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Añadiendo configuración al archivo${endColour} ${cyanColour}/home/$userName/.config/bspwm/bspwmrc${endColour} ${grayColour}...${endColour}"
  echo -e "/home/$userName/.config/polybar/./launch.sh" | tee -a /home/$userName/.config/bspwm/bspwmrc > /dev/null 2>&1
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Creando directorio ${endColour} ${cyanColour}/home/$userName/.config/bin${endColour} ${grayColour}...${endColour}"
  mkdir /home/$userName/.config/bin > /dev/null 2>&1
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivo ${endColour} ${cyanColour}ethernet_status.sh${endColour} ${grayColour}...${endColour}"
  cp ./configurations/ethernet_status.sh /home/$userName/.config/bin/ > /dev/null 2>&1
  chmod +x /home/$userName/.config/bin/ethernet_status.sh > /dev/null 2>&1
  chown $userName:$userName /home/$userName/.config/bin/ethernet_status.sh > /dev/null 2>&1
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivo ${endColour} ${cyanColour}ethernet_status.sh${endColour} ${grayColour}...${endColour}"
  cp ./configurations/ethernet_status_tun.sh /home/$userName/.config/bin/ > /dev/null 2>&1
  chmod +x /home/$userName/.config/bin/ethernet_status_tun.sh > /dev/null 2>&1
  chown $userName:$userName /home/$userName/.config/bin/ethernet_status_tun.sh > /dev/null 2>&1
  echo -e "${greenColour}(OK)${endColour}"
  echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Copiando archivos del directorio${endColour} ${cyanColour}blue-sky/polybar/fonts${endColour} ${grayColour}...${endColour}"
  (cd /home/$userName/Descargas/blue-sky/polybar/fonts ; cp * /usr/share/fonts/truetype/ > /dev/null 2>&1 ; fc-cache -v > /dev/null 2>&1)
  if [[ $operating_system == "ubuntu" ]];then
    before="content = %{T7}"
    after=${before%?}
    sed -i "s/$before/$after/" /home/$(logname)/.config/polybar/current.ini
  elif [[ $operating_system == "debian" ]];then
    before="content = %{T7}"
    after=${before%?}
    sed -i "s/$before/$after/" /home/$(logname)/.config/polybar/current.ini
  elif [[ $operating_system == "parrot" ]];then
    before="content = %{T7}"
    after=${before%?}
    sed -i "s/$before/$after/" /home/$(logname)/.config/polybar/current.ini
  elif [[ $operating_system == "arch" ]];then
    before="content = %{T7}"
    after=${before%?}
    sed -i "s/$before/$after/" /home/$(logname)/.config/polybar/current.ini
  fi
  echo -e "${greenColour}(OK)${endColour}"
fi
}
################################################################################
################################################################################
################################################################################
#UNINSTALL POLYBAR
################################################################################
################################################################################
################################################################################
function uninstall_polybar(){
userName="$(logname)"
echo -e "${greenColour}[*][*][*]${endColour} ${grayColour}Uninstalling files${endColour} ${cyanColour}POLYBAR${endColour} ${grayColour}...${endColour}"
      if [[ -d "/home/$userName/polybar" ]];then
              echo -e "\t${yellowColour}[*]${endColour} ${grayColour}Uninstalling${endColour} ${cyanColour}polybar${endColour} ${grayColour}... !${endColour}"
              rm -r /home/$userName/polybar
              rm -r /home/$userName/.config/polybar
              if [[ ! -d "/home/$userName/polybar" && ! -d "/home/$userName/.config/polybar" ]];then
                      echo -e "\t\t${greenColour}[*]${endColour} ${grayColour}Uninstalled${endColour} !${endColour}"
              else
                      echo -e "\t\t${redColour}[*]${endColour} ${cyanColour}POLYBAR${endColour} ${grayColour}not uninstalled.${endColour}"
              fi
      fi
      echo -e "\t\t\t${greenColour}[*][*][*]${endColour} ${grayColour}Uninstall completed !${endColour}"
}
################################################################################
################################################################################
################################################################################
#Installatión polybar ARCH-LINUX
################################################################################
################################################################################
################################################################################
function polybar_installation_arch(){
  tput civis
  userName="$(logname)"
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Verificando${endColour} ${cyanColour}polybar${endColour} ${grayColour}...${endColour}"
  dependencies=(git alsa-lib cairo curl jsoncpp libmpdclient libpulse xcb-util-cursor xcb-util-image xcb-util-wm xcb-util-xrm cmake i3-wm pkg-config python python-packaging python-sphinx polybar)
  for program in "${dependencies[@]}";do
    if [[ $program == "polybar" ]];then
      /usr/bin/git clone --recursive https://github.com/polybar/polybar /home/$userName/polybar > /dev/null 2>&1
    else
      yes | pacman -Sy $program --noconfirm > /dev/null 2>&1
    fi
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
      echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}$program${endColour} ${greenColour}(OK)${endColour}"
      sleep .25
      tput cnorm
    fi
    pacman -Qs $program > /dev/null 2>&1
    instaladoP="$(echo $?)"
    test -f /usr/bin/$program > /dev/null 2>&1
    instaladoT="$(echo $?)"
    which $program > /dev/null 2>&1
    instaladoW="$(echo $?)"
    if [[ $instaladoP != "0" && $instaladoT != "0" && $instaladoW != "0" ]];then
      if [[ $program != "polybar" ]];then
        echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}$program${endColour} ${redColour}(not installed)${endColour}"
        sleep .25
        tput cnorm
        exit 0
      fi
    fi
  done
  make_polybar_arch
  configure_polybar_arch

  pacman -Qs polybar > /dev/null 2>&1
  instaladoP="$(echo $?)"
  test -f /usr/local/bin/polybar > /dev/null 2>&1
  instaladoT="$(echo $?)"
  which polybar > /dev/null 2>&1
  if [[ $instaladoP == "0" || $instaladoT == "0" || $instaladoW == "0" ]];then
    echo -e "\t${greenColour}[*]${endColour} ${grayColour}Archivos de ${endColour} ${cyanColour}polybar${endColour} ${greenColour}(OK)${endColour}"
  else
      echo -e "\t${redColour}[*]${endColour}${grayColour}Error:${endColour} ${cyanColour}$program${endColour} ${redColour}(not installed)${endColour}"
      sleep .25
      tput cnorm
      exit 0
  fi

}
function make_polybar_arch(){
      userName="$(logname)"
      #CREAR DIRECTORIO POLYBAR/BUILD
      if [[ ! -d "/home/$userName/polybar/build" ]];then
        mkdir /home/$userName/polybar/build > /dev/null 2>&1
      fi;
      #EJECUTAMOS COMANDO
      (cd /home/$userName/polybar/build/ ; cmake .. > /dev/null 2>&1 ; make -j $(nproc) > /dev/null 2>&1 ; make install > /dev/null 2>&1)
      echo -e "\t${greenColour}[*] ${endColour}${grayColour}Instalación de POLYBAR finalizada !${endColour}"
}
  #COFIGURE POLYBAR ARCH LINUX
function configure_polybar_arch(){
userName="$(logname)"
if [[ ! -d "/home/$userName/.config/polybar" ]];then
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Configurado POLYBAR ...${endColour}"
  mkdir /home/$userName/.config/polybar > /dev/null 2>&1
  if [[ -d "/home/$userName/.config/polybar" ]];then
    echo -e "\t${greenColour}[*]${endColour} ${grayColour}Directorio${endColour} ${cyanColour}/home/$userName/.config/polybar${endColour} ${grayColour}creado !${endColour}"
    echo -e "\t${greenColour}[*]${endColour} ${grayColour}Clonando repositorio de git:${endColour} ${cyanColour}Blue-sky${endColour} ${grayColour}...${endColour}"
    /usr/bin/git clone https://github.com/VaughnValle/blue-sky.git /home/$userName/Descargas/blue-sky > /dev/null 2>&1
    echo -en "\t${greenColour}[*]${endColour} ${grayColour}Copiando archivos de${endColour} ${cyanColour}blue-sky${endColour} ${grayColour}...${endColour}"
    (cd /home/$userName/Descargas/blue-sky/polybar/ ; cp * -r /home/$userName/.config/polybar/ > /dev/null 2>&1)
    echo -e "${greenColour}(OK)${endColour}"
    echo -en "\t${greenColour}[*]${endColour} ${grayColour}Añadiendo configuración al archivo${endColour} ${cyanColour}/home/$userName/.config/bspwm/bspwmrc${endColour} ${grayColour}...${endColour}"
    echo "/home/$userName/.config/polybar/./launch.sh" | tee -a /home/$userName/.config/bspwm/bspwmrc > /dev/null 2>&1
    echo -e "${greenColour}(OK)${endColour}"
    echo -en "\t${greenColour}[*]${endColour} ${grayColour}Copiando archivos del directorio${endColour} ${cyanColour}blue-sky/polybar/fonts${endColour} ${grayColour}...${endColour}"
    (cd /home/$userName/Descargas/blue-sky/polybar/fonts ; cp * /usr/share/fonts/truetype/ > /dev/null 2>&1 ; fc-cache -v > /dev/null 2>&1)
    echo -e "${greenColour}(OK)${endColour}"
  fi
fi
}
