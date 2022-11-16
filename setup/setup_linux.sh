#!/bin/bash

function run_block() {
	while :
	do
		read -p "$1 [y, ] " input
		if [[ $input == "y" ]]; then
			return
		elif [[ $input == "n" ]]; then
			false
		fi
	done
}

echo '###################################'
echo '### UPDATING APT ##################'
echo '###################################'
sudo apt update

echo '###################################' 
echo '### INSTALLING PACKAGES ###########'
echo '###################################'

if $(run_block "install apt packages?"); then
sudo apt-get install 
	vim \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	pass \
	gpg
fi

if $(run_block "configure vim?"); then
bash ./vim.sh
fi

if $(run_block "configure git?"); then
bash ./github.sh
fi

if $(run_block "install anaconda?"); then
bash ./anaconda_linux.sh
fi

if $(run_block "install zoom?"); then
curl -o ~/Downloads/zoom_amd64.deb -L https://zoom.us/client/5.12.6.173/zoom_amd64.deb
sudo dpkg -i ~/Downloads/zoom_amd64.deb
fi

if $(run_block "install xournal?"); then
curl -o ~/Downloads/xournal.deb -L https://github.com/xournalpp/xournalpp/releases/download/v1.1.2/xournalpp-1.1.2-Debian-bullseye-x86_64.deb
sudo dpkg -i ~/Downloads/xournal.deb
fi

if $(run_block "install xppen?"); then
curl -o ~/Downloads/xppen.deb -L https://www.xp-pen.com/download/file/id/1949/pid/298/ext/deb.html
sudo dpkg -i ~/Downloads/xppen.deb
fi


if $(run_block "install docker?"); then
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


