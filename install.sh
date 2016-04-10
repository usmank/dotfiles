#!/bin/bash
#
# Install dotfiles in $HOME, followed by Vundle and vim plugins. Requires Git.
#
# NOTE: This script will clobber any existing <dotfile>.backup scripts in $HOME.
#

set -e

# All the dotfiles that we care about. Note the lack of leading dot.
dotfiles=(bashrc ghci gitconfig inputrc tmux.conf vimrc)

home_dir=$HOME
vundle_repo=http://github.com/VundleVim/Vundle.Vim
vundle_dir=$home_dir/.vim/bundle/Vundle.vim

# Does the following:
#   1. Create symlinks in $home_dir for dotfiles. Save existing files with a
#      '.backup' suffix.
#   2. Install Vundle.
#   3. Use Vundle to install vim plugins.
install() {
  # Create symlinks for dotfiles.
  for file in ${dotfiles[*]}
  do
    ln -svr --backup --suffix=.backup $file $home_dir/.$file
  done

  # Install Vundle.
  if [[ ! -d $vundle_dir ]]; then
    git clone $vundle_repo $vundle_dir
  else
    echo "Vundle already installed. Moving on..."
  fi

  # Install vim plugins using Vundle.
  vim +PluginInstall +qall

  echo "-- INSTALL COMPLETED -----------------------------"
}

install
