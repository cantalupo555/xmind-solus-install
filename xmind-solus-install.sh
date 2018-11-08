#!/bin/bash
#cantalupo555
if [ $UID -ne 1000 ]; then
    echo "Install failed: you can not be logged in as 'root'"
    exit 1
fi
o1(){
	echo ""
	echo "-------------------------------------------------------------------------"
	echo "-------------------------------------------------------------------------"
	echo "-------------------------------------------------------------------------"
	echo "Press ENTER to go back!"	
	echo ""
	read v	
}

while true 
do
	clear
	echo "_________________________________________________________________________"
	echo "|                                                                       |"
	echo "|                            @cantalupo555                              |"
	echo "|                                                                       |"
	echo "| 1 - Install XMind                                                     |"
	echo "| 2 - Update XMind                                                      |"
	echo "| 3 - Uninstall XMind                                                   |"
	echo "| 4 - Exit                                                              |"
	echo "|_______________________________________________________________________|"
	echo ""
	echo "Please select your option 1 to 4:"
	read op

	case $op in 
		1) while true; do
				clear
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Install XMind"
				echo ""
				sudo rm -rf xmind-solus-linux.zip xmind-solus-linux/ xmind/ /xmind/
				wget http://80.211.146.153/xmind-solus-linux.zip&&unzip xmind-solus-linux.zip&&sudo rm -rf xmind-solus-linux.zip
				cd xmind-solus-linux/
				set -e
				SCRIPT_NAME="$0"
				SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_NAME")" && pwd)"
				echo "[setup] Installing dependencies...."
				sudo eopkg install rsync openjdk-8 lame
				FONTS_DIR="$SCRIPT_DIR/fonts"
				if [ -d "$FONTS_DIR" ]; then
				echo "[setup] Installing custom fonts...."
				sudo mkdir -p /usr/share/fonts/truetype/xmind
				sudo rsync -av "$FONTS_DIR/" /usr/share/fonts/truetype/xmind/
				fc-cache -f
					else
						echo "[setup] WARNING: Custom fonts for XMind are not found."
					fi
				echo "[setup] Done."&&cd ..&&mv xmind-solus-linux/ xmind/&&sudo mv xmind/ /
				if [ -e ~/.local/share/applications/ ]; then
					mv /xmind/configuration/XMind.desktop ~/.local/share/applications/&&cd ~
					else
						mkdir ~/.local/share/applications/
						mv /xmind/configuration/XMind.desktop ~/.local/share/applications/&&cd ~
					fi
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Installation Complete"
				o1
				if [ -z "$v" ]; then
				break
				fi
				done
				;;

		2) while true; do
				clear
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Update XMind"
				echo ""
				sudo rm -rf xmind-solus-linux.zip xmind-solus-linux/ xmind/ /xmind/ /usr/share/fonts/truetype/xmind
				wget http://80.211.146.153/xmind-solus-linux.zip&&unzip xmind-solus-linux.zip&&sudo rm -rf xmind-solus-linux.zip
				cd xmind-solus-linux/
				set -e
				SCRIPT_NAME="$0"
				SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_NAME")" && pwd)"
				echo "[setup] Installing dependencies...."
				sudo eopkg install rsync openjdk-8 lame
				FONTS_DIR="$SCRIPT_DIR/fonts"
				if [ -d "$FONTS_DIR" ]; then
				echo "[setup] Installing custom fonts...."
				sudo mkdir -p /usr/share/fonts/truetype/xmind
				sudo rsync -av "$FONTS_DIR/" /usr/share/fonts/truetype/xmind/
				fc-cache -f
				else
				echo "[setup] WARNING: Custom fonts for XMind are not found."
				fi
				echo "[setup] Done."&&cd ..&&mv xmind-solus-linux/ xmind/&&sudo mv xmind/ /&&cd ~
				clear
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Update Completed"
				o1
				if [ -z "$v" ]; then
				break
				fi
				done
				;;

		3) while true; do
				clear
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Uninstalling XMind"
				echo ""
				sudo rm -rf xmind-solus-linux.zip xmind-solus-linux/ xmin/ /xmind/ /usr/share/fonts/truetype/xmind ~/.local/share/applications/XMind.desktop&&cd ~
				clear
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Uninstall Completed"
				o1
				if [ -z "$v" ]; then
				break
				fi
				done
				;;
						
		4)
				clear
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Exit..."
				exit
				sleep
				clear
				break
				;;

		*)
				clear		
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "Invalid Option!"
				sleep 1
				echo ""
				;;
	esac
done

