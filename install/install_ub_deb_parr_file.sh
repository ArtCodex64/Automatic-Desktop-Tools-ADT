#!/bin/bash

#INSTALLATION
function installation_ub_deb_parr(){
banner
sleep 1
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
