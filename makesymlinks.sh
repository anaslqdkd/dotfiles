#! /bin/bash
######################################
# .make.sh
# Script to create symlinks from the home directory to dotfiles in ~/dotfiles

######### Variables

dir=~/dotfiles
files="vimrc Xresources bashrc"

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

######### install plugins on the command line ########
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

################
rm ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets
echo "creating symlink to tex.snippets"
ln -s ~/dotfiles/tex.snippets ~/.vim/plugged/vim-snippets/UltiSnips/tex.snippets
echo "compiling .Xresources"
xrdb ~/.Xresources

echo "adding i3 config if i3 is installed"
FILE=~/.config/i3/config
if pacman -Qi i3-wm > /dev/null; then 
    if test -f "$FILE"; then
        rm ~/.config/i3/config 
        echo "creating the symbolic link to ~/.config/i3/config"
        ln -s ~/dotfiles/config ~/.config/i3/config
    else
        mkdir ~/.config/i3
        ln -s ~/dotfiles/config ~/.config/i3/config
    fi 
elif dpkg -s i3 > /dev/null; then
    if test -f "$FILE"; then
        rm ~/.config/i3/config 
        echo "creating the symbolic link to ~/.config/i3/config"
        ln -s ~/dotfiles/config ~/.config/i3/config
    else
        mkdir ~/.config/i3
        ln -s ~/dotfiles/config ~/.config/i3/config
    fi
else 
    echo "i3wm not found"
fi


