# Script de configuración instantánea
# v0.0.1

SCRIPT_VERS="0.0.1"
SCRIPT_DATE="13/02/2024"
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
	echo "Copiando configuración de Sway... " && 
		sudo mkdir -p /etc/xdg/sway &> /dev/null &&
		sudo cp ./sway/* /etc/xdg/sway
	echo "Copiando configuración de Waybar..." &&
	 	sudo mkdir -p /etc/xdg/waybar &> /dev/null &&	
		sudo cp ./waybar/* ~/.config/waybar
	echo "Copiando configuración de Fuzzel..." &&
	 	sudo mkdir -p /etc/xdg/fuzzel &> /dev/null &&	
		sudo cp ./fuzzel/* ~/.config/fuzzel
	echo "Copiando configuración de Foot Terminal..." &&
	 	sudo mkdir -p /etc/xdg/foot &> /dev/null &&	
		sudo cp ./foot/* ~/.config/foot
	echo "Copiando .bashrc a la carpeta del usuario..." &&
	       	sudo cp ./.bashrc ~
	echo "¡Terminado!"
}

installToUser() {
	echo "Copiando configuración de Sway... " &&
	       	mkdir -p ~/.config/sway	&> /dev/null &&
	       	cp ./sway/* ~/.config/sway  
	echo "Copiando configuración de Waybar..." &&
	       	mkdir -p ~/.config/waybar &> /dev/null &&
	       	cp ./waybar/* ~/.config/waybar
	echo "Copiando configuración de Fuzzel..." &&
	       	mkdir -p ~/.config/fuzzel &> /dev/null &&
	       	cp ./fuzzel/* ~/.config/fuzzel 
	echo "Copiando configuración de Foot Terminal..." &&
	       	mkdir -p ~/.config/foot &> /dev/null &&
		cp ./foot/* ~/.config/foot 
	echo "Copiando .bashrc a la carpeta del usuario..." &&
	       	cp ./.bashrc ~
	echo "¡Terminado!"
}

echo ¡Bienvenido al script de instalación! Versión actualizada al $SCRIPT_DATE.
selectOption;
