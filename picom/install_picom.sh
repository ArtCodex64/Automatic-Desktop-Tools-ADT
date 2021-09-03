#!/bin/bash

################################################################################
################################################################################
################################################################################
#INSTALLATION PICOM
################################################################################
################################################################################
################################################################################

function install_picom(){
  dependencies_picom
  sleep 1
  download_picom
  sleep 1
  config_picom
  sleep 1
}
################################################################################
################################################################################
################################################################################
#INSTALLATION DEPENDENCIES PICOM
################################################################################
################################################################################
################################################################################
function dependencies_picom(){
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Actualizando sistema ...${endColour}"
  apt update > /dev/null 2>/dev/null
  echo -e "${greenColour}(OK)${endColour}"
  dependencies=(meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev)
  echo -e "${cyanColour}[*]${endColour} ${grayColour}Comprobando dependencias para picom ...${endColour}"
  #DEPENDENCIAS BSPWM Y SXHKD
  #PROGRAM BIN
        for program in "${dependencies[@]}";do
                #echo -n para quitar el salto de línea
                echo -en "\t${yellowColour}[*]${endColour} ${grayColour}Dependencia:${endColour} ${cyanColour}$program${endColour} ${grayColour}...${endColour}"
    						instalado="$(apt -qq list $programBin 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
    						test -f /usr/bin/$program
                instaladoT="$(echo $?)"
                which $program > /dev/null
    						instaladoW="$(echo $?)"
                if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
      						echo -e " ${greenColour}(OK)${endColour}"
                  grep -q "#END" /home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt
            			if [[ "$(echo $?)" != "0" ]];then
        						echo "$program" | tee -a "/home/$userName/.config/AUTOMATICOESC/recovery/installedPrograms.txt" > /dev/null
                	fi
                else
                	echo -e " ${redColour}(not installed)${endColour}"
                  programNot+=( "$program" )
                fi
    #sleep .25
        done
  #INSTALLATION BIN PROGRAMS
  for programN in "${programNot[@]}";do
                echo -en "${cyanColour}[+] ${endColour}${grayColour}Installing${endColour} ${cyanColour}$programN${endColour}${grayColour} ...${endColour}"
          			sleep .25
    						apt-get install $programN -y > /dev/null 2>&1
    						instalado="$(apt -qq list $programN 2>/dev/null | head -n 1 | cut -d ' ' -f 4)"
    						test -f /usr/bin/$programN
                instaladoT="$(echo $?)"
                which $programN > /dev/null
                instaladoW="$(echo $?)"
                if [[ "$instalado" == "[instalado]" || "instaladoT" == "0" || "$instaladoW" == "0" ]];then
                        echo -e " ${greenColour}(OK)${endColour}"
                else
                        echo -e " ${redColour}(not installed)${endColour}"
                        exit 0
                fi
    #sleep 1.25
  done
}
################################################################################
################################################################################
################################################################################
#DOWNLOAD PICOM
################################################################################
################################################################################
################################################################################
function download_picom(){
  userName="$(logname)"
  echo -en "${cyanColour}[*]${endColour} ${grayColour}Clonando repositorio picom ...${endColour}"
  git clone https://github.com/ibhagwan/picom.git /home/$userName/picom >> /dev/null 2>/dev/null
  if [[ -d /home/$userName/picom  ]];then
    (cd /home/$userName/picom ; git submodule update --init --recursive > /dev/null 2>/dev/null ; meson --buildtype=release . build > /dev/null 2>/dev/null ; ninja -C build > /dev/null 2>&1 ; sudo ninja -C build install > /dev/null 2>&1)
    echo -e "${greenColour}(OK)${endColour}"
  else
    echo -e "${redColour}(not installed)${endColour}"
    exit 0
  fi
}
################################################################################
################################################################################
################################################################################
#CONFIG PICOM
################################################################################
################################################################################
################################################################################
function config_picom(){
  userName="$(logname)"
  mkdir /home/$userName/.config/picom
  if [[ -d /home/$userName/.config/picom ]];then
    cp /home/$userName/Descargas/blue-sky/picom.conf /home/$userName/.config/picom/
    sed -i 's/backend = "glx"/#backend = "glx"/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/#backend = "xrender"/backend = "xrender"/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/blur-method = "dual_kawase"/#blur-method = "dual_kawase"/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/blur-strength = 5/#blur-strenth = 5/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/blur-kern = "7x7box"/#blur-kern = "7x7box"/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/blur-background-exclude = [/#blur-background-exclude = [/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    sed -i 's/blur-strength = 5/#blur-strenth = 5/' /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    #Blur fuera
    $resGrep="$(grep -A 10 'blur-background-exclude' /home/$userName/.config/picom/picom.conf)" > /dev/null 2>/dev/null
    IFS=$'\n' read -d '' -r -a y <<< "$resGrep"
    for line in "$y[@]";do
          sed -i "s/$line/#$line/" /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    done
    unset y
    unset resGrep
    $resGrep="$(grep -A 11 'blur: {' /home/$userName/.config/picom/picom.conf)" > /dev/null 2>/dev/null
    IFS=$'\n' read -d '' -r -a y <<< "$resGrep"
    for line in "$y[@]";do
          sed -i "s/$line/#$line/" /home/$userName/.config/picom/picom.conf > /dev/null 2>/dev/null
    done
    echo -e "p\npicom --experimental-backend &" | tee -a /home/$userName/bspwm/bspwmrc > /dev/null 2>/dev/null
    echo -e "\nbspc config border_width 0" | tee -a /home/$userName/bspwm/bspwmrc > /dev/null 2>/dev/null
  else
    echo -e "${redColour}(no installed)${endColour}"
    exit 0
  fi

}
