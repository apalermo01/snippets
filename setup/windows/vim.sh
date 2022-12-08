# make necessary directories and copy vimrc
mkdir ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged 
cp .vimrc ~/

# clone gruvbox colorscheme and add to vim
mkdir ~/github_repos/
cd ~/github_repos
git clone https://github.com/morhetz/gruvbox.git
cd gruvbox
cp -r colors/* ~/.vim/colors/
cp -r autoload/* ~/.vim/autoload/
