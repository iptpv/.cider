SOURCE_DIR = ~/nvim
NVIMRC = .nvimrc
DOT_NVIM = .nvim

all: symlinks install_neobundle neobundle

install_neobundle:
	mkdir -p $(SOURCE_DIR)/bundle
	git clone https://github.com/Shougo/neobundle.vim $(SOURCE_DIR)/bundle/neobundle.vim

neobundle:
	nvim +NeoBundleInstall +VimProcInstall

symlinks:
	@ln -s $(SOURCE_DIR)/$(NVIMRC) ~/$(NVIMRC) && \
	ln -s $(SOURCE_DIR)/$(DOT_NVIM) ~/$(DOT_NVIM)
