#!/bin/bash

function run_block() {
	while :
	do
		read -p "$1 [y, n] " input
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
sudo apt-get install \
	vim \
	ca-certificates \
	curl \
	gnupg \
	lsb-release \
	pass \
	gpg \
    build-essential \
	i3 \
	pavucontrol
fi

if $(run_block "configure vim?"); then
bash vim.sh
fi

if $(run_block "configure git?"); then
bash ./github.sh
fi

if $(run_block "install anaconda?"); then
bash ./linux.sh
fi

if $(run_block "install zoom?"); then
curl -o ~/Downloads/zoom_amd64.deb -L https://zoom.us/client/5.12.6.173/zoom_amd64.deb
sudo dpkg -i ~/Downloads/zoom_amd64.deb
fi

if $(run_block "install xournal?"); then
curl -o ~/Downloads/xournal.deb -L https://github.com/xournalpp/xournalpp/releases/download/v1.1.2/xournalpp-1.1.2-Debian-bullseye-x86_64.deb
sudo dpkg -i ~/Downloads/xournal.deb
fi

if $(run_block "install xppen"); then
curl -o ~/Downloads/xppen.deb -L https://www.xp-pen.com/download/file/id/1949/pid/298/ext/deb.html
sudo dpkg -i ~/Downloads/xppen.deb
fi


<<<<<<< HEAD:setup/debian/setup.sh
if $(run_block "install docker? (only select yes if running ubuntu)"); then
=======
if $(run_block "install docker (select no if not running ubuntu, needs a different download link)?"); then
>>>>>>> 4806343780f8c24233e803422ff6f6f144e4a5eb:setup/setup_linux.sh
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
sudo dpkg -i ~/Downloads/expressvpn.deb
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


### obsidian
if $(run_block "install obsidian?"); then
sudo curl -o obsidian.AppImage https://github.com/obsidianmd/obsidian-releases/releases/download/v1.0.3/Obsidian-1.0.3.AppImage
fi
### copying dotfiles
cp ../../debian-dotfiles/compton.conf ~/.config/compton.conf
cp ../../debian-dotfiles/i3-config ~/.config/i3/config

### other stuff
echo "setup is almost complete. To finish setting up vim, open vim and type "
echo ":PlugInstall"
