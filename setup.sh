#
# Things to do after install Ubuntu
# Based on
# https://gist.github.com/armno/4036851
#
# @author: Steve Rivers <sr220@imap.cc>
# @created March 5, 2014
#

clear

echo "Let's set up Ubuntu again!"
echo ""

# Update all packages
echo "Updating your packages ..."
sudo apt-get update && sudo apt-get -y upgrade
echo "All packages are up-to-date."
echo "Next step: Installing cool shit..."

# Install Git and Vim
echo "Installing some important packages"
sudo apt-get install -y git vim mercurial openssh

# Setup directory structure
rm -r $HOME/Videos $HOME/Documents $HOME/Pictures
mkdir $HOME/timaeus
mkdir $HOME/repos

# Get dotfiles
REPO_DIR=$HOME/repos
git clone git@github.com:st-rive/dotfiles.git $HOME/repos
DOTFILES_DIR=$HOME/repos/dotfiles
# Symlink zshrc and vimrc into home directory
#ln -s $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc

# Installing Zsh
echo "I will make your terminal AWESOME with Zsh."

# check if zsh is already installed
if type zsh
	then
	echo "Zsh is already installed"
else
	echo "Installing oh-my-zsh ..."
	sudo apt-get install -y zsh
	wget -q --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -- | sh
fi

# make zsh defaul shell. forget about bash
echo "Making Zsh the default shell ..."
chsh -s `which zsh`
echo "Zsh is now your default shell ..."

echo "Solarizing your terminal"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $REPO_DIR
cd $REPO_DIR/solarized
./set_dark.sh

# Finish up
echo "Finished work for the lazy."
echo "Opening vim will install it's addons."

exit 0
