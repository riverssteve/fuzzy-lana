# Exports for both environments
export PATH="$PATH:$HOME/.bin"
export MYVIMRC="$HOME/.vimrc"
export TERM=xterm-256color
export EDITOR=/usr/bin/vim

# Dell XPS
if [[ $OSTYPE == "linux-gnu" ]]; then

    synclient TapButton3=2

    # Fix pidgin-sipe
    export NSS_SSL_CBC_RANDOM_IV=0

    # Chef Path Information
    export PATH="$PATH:/opt/chef/embedded/bin"

    # Timaeus Environment things
    export TIMAEUS_HOME="$HOME/timaeus"
    export CHROOTS_DIR="$TIMAEUS_HOME/chroots"
    export PATH="$PATH:$TIMAEUS_HOME/bin"
    export SVNROOT=bind:/home/srivers/timaeus/repos

    # Load Xmodmap settings, if any.
    xmodmap_rc=$HOME/.Xmodmap

    # Keyboard settings
    if [[ -n $DISPLAY ]]; then
        [[ -f $xmodmap_rc ]] && xmodmap $xmodmap_rc
    fi

    # Take me to my chroot!
    # function to(){ cd $CHROOTS_DIR/$1$HOME; }

fi

# Macbook Pro - darwin13.0 = OS X 10.9
if [[ $OSTYPE == "darwin13.0" ]]; then

    # Path Information
    export PATH="$PATH:$HOME/Library/Python/2.7/bin"

    # Replace bsd utils with gnu equivalent and their manpages
    export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin"
    export MANPATH="$PATH:$(brew --prefix coreutils)/libexec/gnuman"

fi
