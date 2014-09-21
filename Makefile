################################################################################
#
# Author: Usman Khan
#
# Date: 2014-09-19
#
# Requires GNU make and Git.
#
################################################################################

HOME_DIR 	= ~
DOT_FILES	= .bashrc .ghci .gitconfig .inputrc .tmux.conf .vimrc
VUNDLE_REPO = https://github.com/gmarik/Vundle.vim.git
VUNDLE_DIR	= $(HOME_DIR)/.vim/bundle/Vundle.vim

.PHONY: all install update

all: install

install: $(VUNDLE_DIR)
	@$(foreach file, $(DOT_FILES), \
		echo "Copying $(file) to $(HOME_DIR)/$(file)"; \
		cp $(file) $(HOME_DIR)/$(file);)
	vim +PluginInstall +qall

update:
	@$(foreach file, $(DOT_FILES), \
		echo "Copying $(HOME_DIR)/$(file) to $(file)"; \
		cp $(HOME_DIR)/$(file) $(file);)

$(VUNDLE_DIR):
	git clone $(VUNDLE_REPO) $(VUNDLE_DIR)
