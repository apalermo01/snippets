#!/bin/bash

function run_block() {
	read -p "$1 [y, n] " input
	case $input in
		y|Y)
			return
	esac

	false
}

if $(run_block "install apt packages?"); then
	sudo apt update
	sudo apt-get install \
		vim \
		ca-certificates \
		curl \
		gnupg \
		lsb-release \
		pass \
		gpg \
	    build-essential \
		pavucontrol \
		pip \
		neofetch
fi

if $(run_block "configure vim?"); then
	bash vim.sh
fi

if $(run_block "configure git?"); then
	bash ./github.sh
fi

if $(run_block "install anaconda?"); then
	bash ./anaconda.sh
fi



if $(run_block "install docker? (only select yes if running ubuntu)"); then
	sudo apt --fix-broken install
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
	  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	sudo docker run hello-world
fi

### vpn
if $(run_block "install expressvpn? (only select yes if running ubuntu)"); then
	curl -o ~/Downloads/expressvpn.deb -L https://www.expressvpn.works/clients/linux/expressvpn_3.36.0.2-1_amd64.deb
	dpkg -i ~/Downloads/expressvpn.deb
	echo "Activating expressvpn, you must use an activation link from their website"
	expressvpn activate
fi

### virtualbox
if $(run_block "install virtualbox?"); then
	sudo apt-get install virtualbox
	sudo apt install virtualbox-dkms
fi

### wallpaper
curl -o ~/Pictures/F1-wallpaper.png -L https://wallpapercave.com/download/4k-epic-race-wallpapers-wp11251731

### setting up bashrc
echo "neofetch" >> ~/.bashrc
echo "PATH=\"\$HOME/.local/bin:\$PATH" >> ~/.bashrc




echo "setup is almost complete. To finish setting up vim, open vim and type "
echo ":PlugInstall"
