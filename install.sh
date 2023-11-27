# Colors

nocolor='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

# Create + Verify symlinks

link_dotfiles()
{
	if ln -s "$PWD/$1" "$HOME/$1" ; then
		echo "[ ${green}OK${nocolor} ] : symlink for $1"
	else
		echo "[ ${red}KO${nocolor} ] : an error occured for $1"
	fi
}

dotfiles=$(find . -type f -name ".*" -o -name "*.conf" | sort)
for dotfile in $dotfiles; do
	correct_path="${dotfile##./}"
	if [ -e "$HOME/$correct_path" ]; then
		if [ ! $(readlink -f $HOME/$correct_path) = "$PWD/$correct_path" ]; then
			echo "Bad symlink for $HOME/$correct_path"
			rm "$HOME/$correct_path"
			echo "Correction..."
			link_dotfiles $correct_path
		else
			echo "[ ${blue}AOK${nocolor} ] : $correct_path already linked."
		fi
	else
		link_dotfiles $correct_path
	fi	
done
