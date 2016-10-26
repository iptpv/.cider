all:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.config/fish/nvm-wrapper/nvm.fish \
			https://raw.githubusercontent.com/passcod/nvm-fish-wrapper/master/nvm.fish
