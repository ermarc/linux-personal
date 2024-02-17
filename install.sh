# Script de configuración instantánea
# Incluye Sway, Waybar, Fuzzel, Foot Terminal y bashrc personal

SCRIPT_VERS="1.0.0"
SCRIPT_DATE="14/02/2024"
SCRIPT_LANG="ES"

INSTALL_LOCT=""

selectOption() {
	read -p "¿Dónde quieres instalar la configuración? [user/root] " INSTALL_LOCT

	case $INSTALL_LOCT in
        	"user")
			echo Instalando configuración para este usuario...;
			installToUser;; 
		"root")
			echo Instalando configuración para todo el sistema...;
			installToRoot;;
		*)
			echo Opción no encontrada.;
			selectOption;;
	esac
}

installToRoot() {
	echo "Se necesitarán permisos de superusuario..."

	sudo -- sh -c "

	echo Copiando configuración de Sway...  
		mkdir -p /etc/xdg/sway &> /dev/null
		cp ./sway/* /etc/xdg/sway
	echo Copiando configuración de Waybar...
	 	mkdir -p /etc/xdg/waybar &> /dev/null	
		cp ./waybar/* /etc/xdg/waybar
	echo Copiando configuración de Fuzzel...
	 	mkdir -p /etc/xdg/fuzzel &> /dev/null	
		cp ./fuzzel/* /etc/xdg/fuzzel
	echo Copiando configuración de Foot Terminal...
	 	mkdir -p /etc/xdg/foot &> /dev/null	
		cp ./foot/* /etc/xdg/foot
	echo Copiando .bashrc a la carpeta de root...
	       	cp ./.bashrc ~
	echo Copiando prettyforest.jpg a la carpeta de sistema...
		cp ./prettyforest.jpg /usr/share/backgrounds/sway
	echo Copiando darkforest.jpg a la carpeta del sistema...
		cp ./darkforest.jpg /usr/share/backgrounds/sway
	"
	echo "¡Terminado!"
}

installToUser() {
	echo "Copiando configuración de Sway... " &&
	       	cp -r ./sway ~/.config  
	echo "Copiando configuración de Waybar..." &&
	       	cp -r ./waybar ~/.config
	echo "Copiando configuración de Fuzzel..." &&
	       	cp -r ./fuzzel ~/.config 
	echo "Copiando configuración de Foot Terminal..." &&
		cp -r ./foot ~/.config 
	echo "Copiando configuración de Hyprland..." &&
		cp -r ./hypr ~/.config
	echo "Copiando .bashrc a la carpeta del usuario..." &&
	       	cp ./.bashrc ~
	echo "¡Terminado!"
}

echo ¡Bienvenido al script de instalación! Versión actualizada al $SCRIPT_DATE.
selectOption;
