#!/bin/bash

#DESINSTALLATION
function uninstallation_ub_deb_parr(){
delete_dependencies
sleep 1
echo -e "${greenColour}[*][*]${endColour} ${grayColour}Uninstalling files${endColour} ${cyanColour}BSPWM SXHKD POLYBAR${endColour} ${grayColour}...${endColour}"
uninstall_bspwm
sleep 1
uninstall_sxhkd
sleep 1
uninstall_polybar
sleep 1
uninstall_picom
sleep 1
uninstall_rofi
sleep 1
uninstall_feh
sleep 1
uninstall_firefox_firejail
sleep 1
uninstall_hack_nerd_fonts
sleep 1
uninstall_zsh
sleep 1
uninstall_powerlevel10k
sleep 1
uninstall_bat
sleep 1
uninstall_lsd
sleep 1
uninstall_slimlock
sleep 1
}
