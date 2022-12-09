#!/bin/bash
# script to set up programs that I use for tutoring
# on debian-based distributions


function run_block() {
	read -p "$1 [y, n] " input
	case $input in
		y|Y|yes)
			return
	esac
	false
}

### update apt
if $(run_block "update / install apt packages?");then
	sudo apt update
#	sudo apt-get install 
fi

if $(run_block "install zoom?"); then
curl -o ~/Downloads/zoom_amd64.deb -L https://zoom.us/client/5.12.6.173/zoom_amd64.deb
sudo dpkg -i ~/Downloads/zoom_amd64.deb
sudo apt --fix-broken install
fi

if $(run_block "install xournal?"); then
curl -o ~/Downloads/xournal.deb -L https://github.com/xournalpp/xournalpp/releases/download/v1.1.2/xournalpp-1.1.2-Debian-bullseye-x86_64.deb
sudo dpkg -i ~/Downloads/xournal.deb
sudo apt --fix-broken install
fi

if $(run_block "install xppen"); then
curl -o ~/Downloads/xppen.deb -L https://www.xp-pen.com/download/file/id/1949/pid/298/ext/deb.html
sudo dpkg -i ~/Downloads/xppen.deb
fi

### obsidian
if $(run_block "install obsidian?"); then
sudo curl -o obsidian.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage
fi
