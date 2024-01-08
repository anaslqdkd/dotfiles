#! /bin/bash
######################################
# .make.sh
# Script to create symlinks from the home directory to dotfiles in ~/dotfiles

######### Variables

dir=~/dotfiles
files="vimrc Xresources "

#########

# create dorfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p ~/dotfiles_old 
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in the home directory"
    ln -s $dir/$file ~/.$file
done 

################
rm ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets
ln -s ~/dotfiles/tex.snippets ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets
