#!/bin/bash
#cantalupo555
clear
echo -e "\n\e[1;33mChecking user\e[0m"
if [ $UID -ne 1000 ]; then
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo -e "\033[1;31mInstall failed: you can not be logged in as 'root'\033[0m"
    sleep 5
    exit 1
    	else
    		sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo -e "\033[1;32mOK\033[0m"
    		sleep 3	
    	fi
clear
echo -e "\n\e[1;33mChecking that minimal requirements are ok\e[0m"
if [ -f /etc/centos-release ]; then
    OS="CentOs"
    VERFULL=$(sed 's/^.*release //;s/ (Fin.*$//' /etc/centos-release)
    VER=${VERFULL:0:1} # return 6 or 7
elif [ -f /etc/lsb-release ]; then
    OS=$(grep DISTRIB_ID /etc/lsb-release | sed 's/^.*=//')
    VER=$(grep DISTRIB_RELEASE /etc/lsb-release | sed 's/^.*=//')
elif [ -f /etc/os-release ]; then
    OS=$(grep -w ID /etc/os-release | sed 's/^.*=//')
    VER=$(grep VERSION_ID /etc/os-release | sed 's/^.*"\(.*\)"/\1/')
 else
    OS=$(uname -s)
    VER=$(uname -r)
fi
ARCH=$(uname -m)
echo "Detected : $OS  $VER  $ARCH"&&r='add-apt-repository'
if [[ "$OS" = "Solus" ]] ; then
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo -e "\033[1;32mOK\033[0m"
    sleep 5
		else
			sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo "....."
    		sleep 1
    		echo -e "\033[1;31mSorry, this OS is not supported.\033[0m"
    		sleep 5
    		exit 1
		fi
clear
echo -e "\n\e[1;33mChecking Network\e[0m"
	sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo "....."
    sleep 1
    echo -e ".....\n"
    sleep 1
if ! ping -c 5 google.com -q ; then
	echo
	echo -e "\033[1;31mConnect with Google, FAIL.\033[0m"
	exit 1
	echo
		else
			echo
			echo -e "\033[1;32mConnect with Google, OK.\033[0m"
			echo
		fi
	sleep 2
if ! ping -c 5 dl3.xmind.net -q ; then
	echo
	echo -e "\033[1;31mConnect with XMind, FAIL.\033[0m"
	exit 1
	echo
		else
			echo
			echo -e "\033[1;32mConnect with XMind, OK.\033[0m"
			echo
		fi
sleep 3

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
				if [ -e /opt/xmind/ ]; then
					echo -e "\nXMind can not be installed, \e[1;33mplease run Option 3 and try again\e[0m"
					o1
					if [ -z "$v" ]; then
						break
					fi
					else
						version="$(wget -qO- https://raw.githubusercontent.com/cantalupo555/xmind-solus-install/master/version.txt)"
						sudo rm -rf xmind*
						wget $version -O xmind-solus.zip&&mkdir xmind-solus/&&mv xmind-solus.zip xmind-solus/
						cd xmind-solus/&&unzip xmind-solus.zip&&sudo rm -rf xmind-solus.zip setup.sh&&echo "cd /opt/xmind/XMind_amd64/;./XMind" > xmind.sh
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
							echo "[setup] Done."&&cd ..&&mv xmind-solus/ xmind/&&cd xmind/configuration/&&wget https://github.com/cantalupo555/xmind-solus-install/raw/master/default128.png&&cd ../..&&sudo mv xmind/ /opt/&&cd ~
							if [ -e ~/.local/share/applications/ ]; then
								#mv /xmind/configuration/XMind.desktop ~/.local/share/applications/&&cd ~
								echo -e "[Desktop Entry]\nVersion=1.0\nName=XMind\nGenericName=Mind Mapping\nGenericName[pt_BR]=Mapa Mental\nComment=The Most Popular Mind Mapping Software on The Planet\nComment[pt_BR]=O mais popular software de mapeamento mental do planeta\nExec=sh /opt/xmind/xmind.sh\nIcon=/opt/xmind/configuration/default128.png\nTerminal=false\nType=Application\nMimeType=application/x-xmind;\nStartupNotify=true\nCategories=Office;\nKeywords=map;mind;" | tee ~/.local/share/applications/xmind.desktop&&cd ~
								else
									mkdir ~/.local/share/applications/
									#mv /xmind/configuration/XMind.desktop ~/.local/share/applications/&&cd ~
									echo -e "[Desktop Entry]\nVersion=1.0\nName=XMind\nGenericName=Mind Mapping\nGenericName[pt_BR]=Mapa Mental\nComment=The Most Popular Mind Mapping Software on The Planet\nComment[pt_BR]=O mais popular software de mapeamento mental do planeta\nExec=sh /opt/xmind/xmind.sh\nIcon=/opt/xmind/configuration/default128.png\nTerminal=false\nType=Application\nMimeType=application/x-xmind;\nStartupNotify=true\nCategories=Office;\nKeywords=map;mind;" | tee ~/.local/share/applications/xmind.desktop&&cd ~
								fi
					fi
				clear
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo -e "\033[1;32mInstallation Complete\033[0m"
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
				if [ -e /opt/xmind/ ]; then
					version="$(wget -qO- https://raw.githubusercontent.com/cantalupo555/xmind-solus-install/master/version.txt)"
					sudo rm -rf xmind* /xmind/ /usr/share/fonts/truetype/xmind/
					wget $version -O xmind-solus.zip&&mkdir xmind-solus/&&mv xmind-solus.zip xmind-solus/
					cd xmind-solus/&&unzip xmind-solus.zip&&sudo rm -rf xmind-solus.zip setup.sh&&echo "cd /opt/xmind/XMind_amd64/;./XMind" > xmind.sh
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
							echo "[setup] Done."&&cd ..&&mv xmind-solus/ xmind/&&cd xmind/configuration/&&wget https://github.com/cantalupo555/xmind-solus-install/raw/master/default128.png&&cd ../..&&sudo mv xmind/ /opt/&&cd ~
					else
						echo -e "\nXMind can not be update, \e[1;33mplease run Option 1 and try again\e[0m"
						o1
						if [ -z "$v" ]; then
							break
						fi
					fi
				clear
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo -e "\033[1;32mUpdate Completed\033[0m"
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
				if [ -e /xmind/ ]; then					
					sudo rm -rf xmind* /opt/xmind/ /usr/share/fonts/truetype/xmind/ ~/.local/share/applications/xmind.desktop&&cd ~
					sleep 2
					echo "		Uninstalling"
					sleep 2
					echo "			Uninstalling"
					sleep 2
					echo "				Uninstalling"
					sleep 2
					else
						echo -e "\nXMind can not be uninstalling, \e[1;33mplease run Option 1 and try again\e[0m"
						o1
						if [ -z "$v"]; then
							break
						fi
					fi
				clear
				echo ""
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo "-------------------------------------------------------------------------"
				echo -e "\033[1;32mUninstall Completed\033[0m"
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
