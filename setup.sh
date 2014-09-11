#
# Things to do after install Ubuntu
# Based on
# https://gist.github.com/armno/4036851
#
# @author: Steve Rivers <sr220@imap.cc>
# @created 2014-03-05
#
# Updated 2014-09-11

clear

echo "Let's set up Ubuntu again!"
echo ""

# Update all packages
echo " - Updating your packages ..."
sudo apt-get update && sudo apt-get -yq upgrade
echo ":) All packages are now up-to-date."

# Install important packages
echo " - Installing some important packages"
apt-get install -yq git vim-gtk mercurial openssh-server fish \
    python-setuptools python-dev build-essential python-keyring \
    python-pip mercurial-keyring tmux virtualbox \
    virtualbox-guest-additions-iso gnome-tweak-tool \
    compizconfig-settings-manager npm nodejs autossh network-manager-openvpn

npm install -g coffee-script

# Setup directory structure
echo " - Remove default home directories and add new ones"
rm -rf $HOME/Videos $HOME/Documents $HOME/Pictures
mkdir $HOME/ice
mkdir $HOME/timaeus
mkdir $HOME/repos

# Get dotfiles
REPO_DIR=$HOME/repos
git clone git@github.com:st-rive/dotfiles.git $HOME/repos
DOTFILES_DIR=$HOME/repos/dotfiles

# Symlink zshrc and vimrc into home directory
cp $DOTFILES_DIR/fish/* $HOME/.config/fish
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc

echo "  - Change default shell to fish"
chsh -s `which fish`

echo " - Add solarized theme to gnome-terminal"
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git $REPO_DIR
cd $REPO_DIR/solarized
./set_dark.sh

# Finish up
echo "Finished. Opening vim will install it's addons."

exit 0
