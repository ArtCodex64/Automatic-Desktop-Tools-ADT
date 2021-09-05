#!/bin/bash

#Author: ART-CODEX-64
#Description:
# I am a novice developer who has created a script to install the following tools automatically: bspwm, sxhkd, polybar, feh and firejail
# The tool is unfinished and there is a lot of work to be done.
# I share the code so that whoever wants to study it and improve it.
# If I finish the script in the future I will share it



################################################################################
################################################################################
################################################################################
#SOURCES
################################################################################
################################################################################
################################################################################
source ./banner/banner.sh
source ./bat/install_bat.sh
source ./bspwm/install_bspwm.sh
source ./colours/colours.sh
source ./configurations/cursor.sh
source ./ctrl-c/ctrl_c.sh
source ./configurations/feh_bspwmrc.sh
source ./configurations/firefox_firejail.sh
source ./firefox-firejail/install_firefox_firejail.sh
source ./dependencies/dependencies_ub_deb_parr.sh
source ./end/end.sh
source ./feh/install_feh.sh
source ./firefox-firejail/install_firefox_firejail.sh
source ./hack-nerd-fonts/install_hack_nerd_fonts.sh
source ./help/help.sh
source ./lsd/install_lsd.sh
source ./mkdir-automaticoesc/mkdir_automaticoesc.sh
source ./os-detect/os_detect.sh
source ./picom/install_picom.sh
source ./polybar/install_polybar.sh
source ./powerlevel10k/install_powerlevel10k.sh
source ./rofi/install_rofi.sh
source ./slimlock/install_slimlock.sh
source ./sxhkd/install_sxhkd.sh
source ./uninstall/uninstall_ub_deb_parr.sh
source ./uninstall/remove_AUTOMATICOESC.sh
source ./zsh/install_zsh.sh

#Para que al usuario no le aparezca la interfaz de instalación
export DEBIAN_FRONTEND=noninteractive
	#POLYBAR
	#########################
	#INSTALLATION
function installation_ub_deb_parr(){
	mkdir_escritorio_automatico
	sleep 1
	dependencies
  sleep 1
  bspwm_installation
  sleep 1
  sxhkd_installation
  sleep 1
  polybar_installation
  sleep 1
	install_picom
	sleep 1
	install_rofi
	sleep 1
  feh_installation
  sleep 1
  firefox_firejail_installation
  sleep 1
  hack_nerd_fonts_installation
	sleep 1
	install_zsh_shell
	sleep 1
	install_powerlevel_10k
	sleep 1
	install_bat
	sleep 1
	install_lsd
	sleep 1
	install_slim_lock
	sleep 1
	config_cursor
	sleep 1
	end_mark
	sleep 1
	#ANSI SHADOW patorjk.com
	installed
}

function installation_arch(){
	bspwm_installation_arch
	sleep 1
	polybar_installation_arch
	sleep 1
	hack_nerd_fonts_installation_arch
	sleep 1
}

	#MAIN FUNCTION
if [[ "$(id -u)" == "0" ]];then
	if [[ $1 == "" ]];then
		banner
		help_panel
	elif [[ $1 == "-i" ]];then
		if [[ $operating_system == "arch" ]];then
			installation_arch
		elif [[ $operating_system == "ubuntu" || $operating_system == "debian" || $operating_system == "parrot" ]];then
			installation_ub_deb_parr
		fi
	elif [[ $1 == "-d" ]];then
		if [[ $operating_system == "arch" ]];then
			echo "Hola"
		elif [[ $operating_system == "ubuntu" || $operating_system == "debian" || $operating_system == "parrot" ]];then
			uninstallation_ub_deb_parr
			delete_automaticoesc_ub_deb_parr
		fi
	elif [[ $1 == "-h" || $1 == "--help" ]];then
		banner
		help_panel
	fi
	exit 0
else
	echo -e "${redColour}[*]${endColour}${grayColour} No eres root, utiliza ${endColour}${greenColour}-sudo su${endColour} ${grayColour}para habilitar el modo root.${endColour}\n"
fi
