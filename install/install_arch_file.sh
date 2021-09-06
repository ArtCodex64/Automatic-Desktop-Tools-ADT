#!/bin/bash

function installation_arch(){
	banner
  sleep 1
  mkdir_escritorio_automatico
	sleep 1
	bspwm_installation_arch
	sleep 1
	polybar_installation_arch
	sleep 1
	install_picom_arch
	sleep 1
	install_rofi_arch
	sleep 1
	feh_installation_arch
	sleep 1
	hack_nerd_fonts_installation_arch
	sleep 1
}
