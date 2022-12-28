#!/bin/sh

######################################### ENVIRONMENTS

NEOVIM_VERSION=0.8.0

################################# CLEANING

SYSTEM_MACHINE=''
SYSTEM_OS="$(uname)"


################################################ CASES

case $SYSTEM_OS in
'Linux')
	SYSTEM_MACHINE='nvim-linux64'
	FILE='nvim-linux64'
	;;
'Darwin')
	SYSTEM_MACHINE='nvim-macos'
	FILE="nvim-macos"
	;;
*) ;;
esac

################################################ INSTALL

function installNeovim() {
	echo ""
	echo "🧑🏽‍💻 INSTALLING NEOVIM"
	echo ""
	URL="https://github.com/neovim/neovim/releases/download/v${NEOVIM_VERSION}/${SYSTEM_MACHINE}.tar.gz"
	echo $URL
	echo ""
	curl -LO $URL
	tar xzvf ${SYSTEM_MACHINE}.tar.gz >/dev/null 2>&1
	rm -rf ${SYSTEM_MACHINE}.tar.gz
	mv ./${FILE} "${HOME}"/${FILE}
	ln -sf "${HOME}"/${FILE}/bin/nvim /usr/local/bin/nvim
}

################################################ REMOVE NVIM

function removeInstalledNvim() {
	echo ""
	echo "❌ REMOVING NVIM"
	echo ""
	rm -rf "${HOME}"/nvim-macos "${HOME}"/nvim.appimage /usr/local/Cellar/nvim /usr/local/bin/nvim "${HOME}"/.cache/nvim "${HOME}"/.cache/nvim "${HOME}"/.local/share/nvim /usr/local/share/lua /usr/local/Cellar/luajit-openresty /usr/local/share/luajit-2.1.0-beta3 /usr/local/lib/lua
	bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/uninstall.sh)
}

################################################ INSTALL NVIM FOLDER

function installNvimFolder() {
	if [ ! -d "${HOME}/.config" ]; then
		echo ""
		echo "❌ NO ./.CONFIG SO CREATING IT NOW"
		echo ""
		mkdir ${HOME}/.config
	fi
}

################################################ PROCESS

removeInstalledNvim
installNeovim
installNvimFolder

echo ""

################################################ END

echo "########.####.##....##.####..######..##.....##.########.########."
echo "##........##..###...##..##..##....##.##.....##.##.......##.....##"
echo "##........##..####..##..##..##.......##.....##.##.......##.....##"
echo "######....##..##.##.##..##...######..#########.######...##.....##"
echo "##........##..##..####..##........##.##.....##.##.......##.....##"
echo "##........##..##...###..##..##....##.##.....##.##.......##.....##"
echo "##.......####.##....##.####..######..##.....##.########.########."

echo ""
echo ""
echo "🖍 NOW JUST RUN : "
echo ""
echo "nvim +PackerSync # to install and run all deps for nvim "
echo ""
echo ""

