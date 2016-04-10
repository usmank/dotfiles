#!/bin/bash
#
# Install dotfiles in $HOME, followed by Vundle and vim plugins.
#
# NOTE: This script will clobber any existing <dotfile>.backup scripts in $HOME.
#

# All the dotfiles that we care about. Note the lack of leading dot.
dotfiles=(bashrc ghci gitconfig inputrc tmux.conf vimrc)

# Home directory. TODO: Change to home_dir $HOME once testing is finished.
home_dir=./temp

# Vundle vars.
vundle_repo=http://github.com/VundleVim/Vundle.Vim
vundle_dir=$home_dir/.vim/bundle/Vundle.vim

# Does the following:
#   1. Create symlinks in $home_dir for dotfiles. Save existing files with a
#      '.backup' suffix.
#   2. Install Vundle.
#   3. Use Vundle to install vim plugins.
install() {
  for file in ${dotfiles[*]}
  do
    ln -svr --backup --suffix=.backup $file $home_dir/.$file
  done

  echo "-- Install completed. ----------------------------"
}

install_vundle() {
  echo "Implement me!"
}

install_vim_plugins() {
  echo "Implement me!"
}

install
