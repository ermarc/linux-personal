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
	ls ./sway;
}

installToUser() {
	echo "Copiando configuración de Sway... " && cp ./sway/* ~/.config/sway
	echo "Copiando configuración de Waybar..." && cp ./waybar/* ~/.config/waybar
	echo "Copiando configuración de Fuzzel..." && cp ./fuzzel/* ~/.config/fuzzel
	echo "Copiando configuración de Foot Terminal..." && cp ./foot/* ~/.config/foot
	echo "Copiando .bashrc a la carpeta del usuario..." && cp ./.bashrc ~
	echo "¡Terminado!"
}

echo ¡Bienvenido al script de instalación! Versión actualizada al $SCRIPT_DATE.
selectOption;
