# setup vim
mkdir ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged 
cp .vimrc ~/
mkdir ~/github_repos/
cd ~/github_repos
git clone https://github.com/morhetz/gruvbox.git
cd gruvbox
cp -r colors/* ~/.vim/colors/
cp -r autoload/* ~/.vim/autoload/
