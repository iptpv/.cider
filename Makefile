SOURCE_DIR = ~/nvim
FILES:= .nvimrc .nvim .eslintrc .inputrc .bash_profile


all: symlinks install_neobundle neobundle

install_neobundle:
	mkdir -p $(SOURCE_DIR)/bundle
	git clone https://github.com/Shougo/neobundle.vim $(SOURCE_DIR)/bundle/neobundle.vim

neobundle:
	nvim +NeoBundleInstall +VimProcInstall

symlinks:
	@$(foreach FILE, $(FILES), ln -s $(SOURCE_DIR)/$(FILE) ~/$(FILE);)

clean:
	@$(foreach FILE, $(FILES), rm -rf ~/$(FILE);)
	rm -rf $(SOURCE_DIR)/bundle
