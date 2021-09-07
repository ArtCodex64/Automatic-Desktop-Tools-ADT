#!/bin/bash

function installation_arch(){
	banner
  sleep 1
  mkdir_escritorio_automatico
	sleep 1
	bspwm_installation_arch
	sleep 1
	sxhkd_installation_arch
	sleep 1
	polybar_installation_arch
	sleep 1
	install_picom_arch
	sleep 1
	install_rofi_arch
	sleep 1
	feh_installation_arch
	sleep 1
	firefox_firejail_installation_arch
	sleep 1
	hack_nerd_fonts_installation_arch
	sleep 1
	install_zsh_shell_arch
	sleep 1
	install_powerlevel_10k_arch
	sleep 1
	install_pywal
	sleep 1
	install_bat_arch
	sleep 1
	install_lsd_arch
	sleep 1
	install_slim_lock_arch
	sleep 1
	config_cursor
	sleep 1
	end_mark
	sleep 1
	installed
	sleep 1
}
