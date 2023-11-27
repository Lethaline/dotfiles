# Colors

nocolor='\033[0m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'

# Create + Verify symlinks

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
		if [ ! $(readlink -f $HOME/$correct_path) = "$PWD/$correct_path" ]; then
			echo "Bad symlink for $HOME/$correct_path"
			rm "$HOME/$correct_path"
			echo "Correction..."
			if ln -s "$PWD/$correct_path" "$HOME/$correct_path"; then
				echo "[ ${green}OK${nocolor} ] : new symlink for $correct_path"
			else
				echo "[ ${red}KO${nocolor} ] : an error occured for $correct_path"
			fi
		fi
		echo "[ ${blue}AOK${nocolor} ] : $correct_path already linked"
	fi
done
