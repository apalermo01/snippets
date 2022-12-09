read -p "enter the email associated with your github: " email
read -p "enter the name you want to associate with github: " name

git config --global user.email $email
git config --global user.name $name

echo "setting up a personal access token, follow the instructions on this page to generate a token"

case $OSTYPE in 
	linux-gnu)
		# send user to instruction page for generating an authentication token
		# xdg-open https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
		
		# install git credential manager
	    curl -LO https://aka.ms/gcm/linux-install-source.sh &&
		sh ./linux-install-source.sh &&
		git-credential-manager-core configure
		
		# read -p "Running gpg genkey, please remember the id you enter (press ENTER to continue)"
		gpg --gen-key
		read -p "what was the id you used for gen-key? " gpgid
		pass init $gpgid
		git config --global credential.credentialStore gpg
		rm ./linux-install-source.sh
		rm -r git-credential-manager
		;;
	*)
		echo "this script has not been configured for $OSTYPE"
		;;
esac

