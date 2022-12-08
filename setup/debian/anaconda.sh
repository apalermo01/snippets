curl -o ~/Downloads/anaconda_install.sh -L https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh
bash ~/Downloads/anaconda_install.sh
echo source /home/$(whoami)/anaconda3/bin/activate >> ~/.bashrc

