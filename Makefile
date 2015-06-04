SOURCE_DIR = ~/.nvim

all: install_neobundle neobundle ycm

install_neobundle:
	mkdir -p $(SOURCE_DIR)/bundle
	git clone https://github.com/Shougo/neobundle.vim $(SOURCE_DIR)/bundle/neobundle.vim

neobundle:
	nvim +NeoBundleInstall +q

ycm:
	cd $(SOURCE_DIR)/bundle/YouCompleteMe && git submodule update --init --recursive
	cd $(SOURCE_DIR)/bundle/YouCompleteMe && ./install.sh
