#!/bin/bash

echo '###################################'
echo '### UPDATING APT ##################'
echo '###################################'
sudo apt update

echo '###################################' 
echo '### INSTALLING PACKAGES ###########'
echo '###################################'

sudo apt-get install 
	vim \
	ca-certificates \
	curl \
	gnupg \
	lsb-release


echo '###################################' 
echo '### CONFIGURING VIM ###############'
echo '###################################'
bash ./vim.sh


echo '###################################' 
echo '### CONFIGURING GIT ### ###########'
echo '###################################'
bash ./github.sh


echo '###################################' 
echo '### INSTALLING ANACONDA ###########'
echo '###################################'
bash ./anaconda_linux.sh


echo '###################################' 
echo '### INSTALLING ZOOM ###############'
echo '###################################'
curl -o ~/Downloads/zoom_amd64.deb -L https://zoom.us/client/5.12.6.173/zoom_amd64.deb
sudo dpkg -i ~/Downloads/zoom_amd64.deb


echo '###################################' 
echo '### INSTALLING XOURNAL ############'
echo '###################################'
xournal
curl -o ~/Downloads/xournal.deb -L https://github.com/xournalpp/xournalpp/releases/download/v1.1.2/xournalpp-1.1.2-Debian-bullseye-x86_64.deb
sudo dpkg -i ~/Downloads/xournal.deb

echo '###################################' 
echo '### INSTALLING XPPEN ##############'
echo '###################################'

curl -o ~/Downloads/xppen.deb -L https://www.xp-pen.com/download/file/id/1949/pid/298/ext/deb.html
sudo dpkg -i ~/Downloads/xppen.deb

echo '#################################'
echo '### INSTALLING DOCKER ###########'
echo '#################################'
sudo apt --fix-broken install
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world

