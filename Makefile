################################################################################
# 
# Author: Usman Khan
#
# Date: 2014-09-19
#
################################################################################

HOME_DIR 	= ~
DOT_FILES	= .bashrc \
			  .ghci \
			  .gitconfig \
			  .inputrc \
			  .tmux.conf \
			  .vimrc

all: install

install:
	@$(foreach file, $(DOT_FILES), \
		echo "Copying $(file) to $(HOME_DIR)/$(file)"; \
		cp $(file) $(HOME_DIR)/$(file);)
	vim +PluginInstall +qall

update:
	@$(foreach file, $(DOT_FILES), \
		echo "Copying $(HOME_DIR)/$(file) to $(file)"; \
		cp $(HOME_DIR)/$(file) $(file);)
