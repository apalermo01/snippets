read -p "enter the email associated with your github: " email
read -p "enter the name you want to associate with github: " name

git config --global user.email $email
git config --global user.name $name

echo "setting up a personal access token, follow the instructions on this page to generate a token"

# case $OSTYPE in 
# 	linux-gnu)
# 		# send user to instruction page for generating an authentication token
# 		# xdg-open https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
# 		
# 		# install git credential manager
# 	    curl -LO https://aka.ms/gcm/linux-install-source.sh &&
# 		sh ./linux-install-source.sh &&
# 		git-credential-manager-core configure
# 		
# 		# read -p "Running gpg genkey, please remember the id you enter (press ENTER to continue)"
# 		gpg --gen-key
# 		read -p "what was the id you used for gen-key? " gpgid
# 		pass init $gpgid
# 		git config --global credential.credentialStore gpg
# 		rm ./linux-install-source.sh
# 		rm -r git-credential-manager
# 		;;
# 	*)
# 		echo "this script has not been configured for $OSTYPE"
# 		;;
# esac

#### case for when git-credential-manager is not supported
read -p "what is your github email address? " email
read -p "what do you want to name the ssh key? " ssh_name
ssh-keygen -f ~/.ssh/$ssh_name -t ed25519 -C $email 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/$ssh_name
cat ~/.ssh/$ssh_name.pub | xclip -selection c
echo "SSH key has been generated and copied to the clipboard"
echo "I am going to open github. You need to sign in when prompted and paste"
read -p "the ssh key into the prompt and give it a name [press any key to continue]" throwaway

xdg-open https://github.com/settings/ssh/new

echo "once done, a connection to github should be set up"

