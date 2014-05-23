#!/bin/sh
# Hard link both .bashrc and .vimrc to your $HOME
echo "Performing file backups..."
mv ~/.bashrc ~/.bashrc_old
mv ~/.vimrc ~/.vimrc_old
mv ~/.git_scripts ~/.git_scripts_old
mv ~/.gitconfig ~/.gitconfig_old
mv ~/.gitignore_global ~/.gitconfig_old
mv ~/.bash_aliases ~/.bash_aliases_old
mv ~/.muttrc ~/.muttrc_old
mv ~/.screenrc ~/.screenrc_old
mv ~/.ssh ~/.ssh_old
echo "Creating new symbolic links..."
ln -s ~/Dropbox/UIB/dotfiles/.bashrc ~/.bashrc
ln -s ~/Dropbox/UIB/dotfiles/.vimrc ~/.vimrc
ln -s ~/Dropbox/UIB/dotfiles/.git_scripts ~/.git_scripts
ln -s ~/Dropbox/UIB/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Dropbox/UIB/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/Dropbox/UIB/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/Dropbox/UIB/dotfiles/.muttrc ~/.muttrc
ln -s ~/Dropbox/UIB/dotfiles/.screenrc ~/.screenrc
ln -s ~/Dropbox/UIB/dotfiles/.uncrustify_config ~/.uncrustify_config
ln -s ~/Dropbox/UIB/dotfiles/.ssh ~
echo "Done!"
