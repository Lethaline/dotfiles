# Colors

nocolor='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

dotfiles=$(find . -type f -name ".*" -o -name "*.conf" | sort) 
for dotfile in $dotfiles; do
	correct_path="${dotfile##./}"
	if [ ! -e "$HOME/$correct_path" ]; then
		if ln -s "$PWD/$correct_path" "$HOME/$correct_path"; then
			echo "[ ${green}OK${nocolor} ] : symlink for $correct_path"
		else
			echo "[ ${red}KO${nocolor} ] : an error occured for $correct_path"
		fi
	else
		echo "[ ${blue}AOK${nocolor} ] : $correct_path already linked"
	fi
done
