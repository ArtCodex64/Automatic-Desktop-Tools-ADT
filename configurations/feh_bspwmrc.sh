#!/bin/bash

################################################################################
################################################################################
################################################################################
#BACKGROUND CONFIGURATION FEH-BSPWMRC
################################################################################
################################################################################
################################################################################
function bg_configuration(){
echo -e "\t${cyanColour}[*]${endColour} ${grayColour}Background configuration ...${endColour}"
userName="$(logname)"
#Creamos la carpeta ImagesBackground si no existe
if [[ ! -d "/home/$userName/BGIMAGES" ]];then
  echo -e "\t\t${yellowColour}[*]${endColour} ${grayColour}Creando directorio${endColour} ${cyanColour}/home/$userName/ImagesBackground${endColour} ${grayColour}...${endColour}"
  mkdir /home/$userName/BGIMAGES
  if [[ -d "/home/$userName/BGIMAGES" ]];then
    echo -e "\t\t\t ${greenColour}[*]${endColour} ${grayColour}Directorio creado !${endColour}"
  fi
  grep -q "#FEH BACKGROUND CONFIGURATION" /home/$userName/.config/bspwm/bspwmrc
  if [[ "$(echo $?)" != "0" ]];then
    if [[ $operating_system == "arch" ]];then
      cp ./BGIMAGES/fondo-arch-linux.jpg /home/$userName/BGIMAGES/
      chown $userName:$userName /home/$userName/BGIMAGES/fondo-arch-linux.jpg
      sed -i " 1 s/.*/&\n#FEH BACKGROUND CONFIGURATION\nfeh --bg-fill \/home\/$userName\/BGIMAGES\/fondo-arch-linux.jpg \&/" /home/$userName/.config/bspwm/bspwmrc > /dev/null
      echo -e "\t\t\t\t${greenColour}[*]${endColour} ${grayColour}Fondo de pantalla seteado !${endColour}"
    elif [[ $operating_system == "ubuntu" ]];then
      cp ./BGIMAGES/fondo-ubuntu.jpg /home/$userName/BGIMAGES/
      chown $userName:$userName /home/$userName/BGIMAGES/fondo-ubuntu.jpg
      sed -i " 1 s/.*/&\n#FEH BACKGROUND CONFIGURATION\nfeh --bg-fill \/home\/$userName\/BGIMAGES\/fondo-ubuntu.jpg \&/" /home/$userName/.config/bspwm/bspwmrc > /dev/null
      echo -e "\t\t\t\t${greenColour}[*]${endColour} ${grayColour}Fondo de pantalla seteado !${endColour}"
    elif [[ $operating_system == "debian" ]];then
      cp ./BGIMAGES/fondo-debian.jpg /home/$userName/BGIMAGES/
      chown $userName:$userName /home/$userName/BGIMAGES/fondo-debian.jpg
      sed -i " 1 s/.*/&\n#FEH BACKGROUND CONFIGURATION\nfeh --bg-fill \/home\/$userName\/BGIMAGES\/fondo-debian.jpg \&/" /home/$userName/.config/bspwm/bspwmrc > /dev/null
      echo -e "\t\t\t\t${greenColour}[*]${endColour} ${grayColour}Fondo de pantalla seteado !${endColour}"
    elif [[ $operating_system == "parrot" ]];then
      cp ./BGIMAGES/fondo-parrot.jpg /home/$userName/BGIMAGES/
      chown $userName:$userName /home/$userName/BGIMAGES/fondo-parrot.jpg
      sed -i " 1 s/.*/&\n#FEH BACKGROUND CONFIGURATION\nfeh --bg-fill \/home\/$userName\/BGIMAGES\/fondo-parrot.jpg \&/" /home/$userName/.config/bspwm/bspwmrc > /dev/null
      echo -e "\t\t\t\t${greenColour}[*]${endColour} ${grayColour}Fondo de pantalla seteado !${endColour}"
    fi
  fi
fi
}
