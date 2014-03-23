# ===========================================================================
# CONTENTS
#
#   Environment ........................................... zsh-environment
#   oh-my-zsh Options ................................... oh-my-zsh-options
#   Functions ............................................... zsh-functions
#   Options ................................................... zsh-options
#   Key Bindings ......................................... zsh-key-bindings
#   Completion ............................................. zsh-completion

# ===========================================================================
# Environments                                                zsh-environment


# Exports for both environments
export PATH="$PATH:$HOME/.bin"
export MYVIMRC="$HOME/.vimrc"
export TERM=xterm-256color
export EDITOR=/usr/bin/vim

# Dell XPS
if [[ $OSTYPE == "linux-gnu" ]]; then

    synclient TapButton3=2

    # Personal Information
    source $HOME/.ldap_info

    # Fix pidgin-sipe
    export NSS_SSL_CBC_RANDOM_IV=0

    # Path Information
    export PATH="$PATH:/opt/chef/embedded/bin"
    export PATH="$PATH:$HOME/.local/bin"

    # Timaeus Environment things
    export TIMAEUS_HOME="$HOME/timaeus"
    export CHROOTS_DIR="$TIMAEUS_HOME/chroots"
    export PATH="$PATH:$TIMAEUS_HOME/bin"
    export SVNROOT=hg:http://hg.devel.cmedltd.com/timaeus

    # Load Xmodmap settings, if any.
    xmodmap_rc=$HOME/.Xmodmap

    # Keyboard settings
    if [[ -n $DISPLAY ]]; then
        [[ -f $xmodmap_rc ]] && xmodmap $xmodmap_rc
    fi

    # Take me to my chroot!
    function to(){ cd $CHROOTS_DIR/$1$HOME; }

fi

# Macbook Pro - darwin13.0 = OS X 10.9
if [[ $OSTYPE == "darwin13.0" ]]; then

    # Path Information
    export PATH="$PATH:$HOME/Library/Python/2.7/bin"

    # Replace bsd utils with gnu equivalent and their manpages
    export PATH="$PATH:$(brew --prefix coreutils)/libexec/gnubin"
    export MANPATH="$PATH:$(brew --prefix coreutils)/libexec/gnuman"

    export BYOBU_PREFIX=$(brew --prefix)
fi

# ============================================================================
# ZSH Options                                                oh-my-zsh-options

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git zsh-history-substring-search)

# zsh-syntax-highlighting doesn't work with Precise
#plugins=(git zsh-syntax-highlighting zsh-history-substring-search)

eval $(dircolors ~/.dircolors)
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Plugin settings
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# ============================================================================
# Functions                                                      zsh-functions

# Preserve cd - across sessions. Saves dirstack to ~/.zdirs.
# Also prints directory content after cd.
DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi

chpwd() {
    local -a dirs; dirs=( "$PWD" ${(f)"$(< $DIRSTACKFILE)"} )
    print -l ${${(u)dirs}[0,$DIRSTACKSIZE]} >$DIRSTACKFILE
    emulate -LR zsh
    ls
}

# dirstack search ~[name]
_mydirstack() {
    local -a lines list
    for d in $dirstack; do
        lines+="$(($#lines+1)) -- $d"
        list+="$#lines"
    done
    _wanted -V directory-stack expl 'directory stack' \
        compadd "$@" -ld lines -S']/' -Q -a list
}

zsh_directory_name() {
    case $1 in
        c) _mydirstack;;
        n) case $2 in
            <0-9>) reply=($dirstack[$2]);;
            *) reply=($dirstack[(r)*$2*]);;
           esac;;
        d) false;;
    esac
}

# M^s to insert sudo at start of line
insert_sudo () {
    zle beginning-of-line;
    zle -U "sudo "
}

zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[0;34m") \
    LESS_TERMCAP_md=$(printf "\e[0;34m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[0;44;37m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[2;32m") \
    man "$@"
}

# mcd -- mkdir and cd at once
mcd() { mkdir -p "$1" && cd "$1" }
compdef mcd=mkdir

# ============================================================================
# Options                                                          zsh-options

# History Settings
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

# More info here: http://zsh.sourceforge.net/Doc/Release/Options.html
unsetopt CORRECT_ALL

setopt ALIASES \
       AUTO_LIST \
       COMPLETEINWORD \
       CORRECT \
       EQUALS \
       EXTENDEDGLOB \
       GLOB_COMPLETE \
       HIST_SAVE_NO_DUPS \
       HIST_EXPIRE_DUPS_FIRST \
       HIST_FIND_NO_DUPS \
       LIST_TYPES \
       INTERACTIVECOMMENTS \
       APPEND_HISTORY \
       SHARE_HISTORY \
       EXTENDED_HISTORY \
       HIST_REDUCE_BLANKS

# Even if there are commands inbetween commands that are the same,
# still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Display usage statistics for commands running > 5 sec.
REPORTTIME=10

# ==============================================================================
# Key bindings                                                   zsh-keybindings

# Use Emacs line editing mode
bindkey -e

# zsh-history substring - bind UP and DOWN arrow keys
zmodload zsh/terminfo


# bind UP and DOWN arrow keys
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down


# ==============================================================================
# Completion                                                      zsh-completion

# zsh auto-completion
autoload -U compinit && {

    # Init completion, ignoring security checks.
    compinit

    # Speed up completion by avoiding partial globs.
    zstyle ':completion:*' accept-exact '*(N)'
    zstyle ':completion:*' accept-exact-dirs true

    # Default colors for listings.
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

    zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

    # Separate directories from files.
    zstyle ':completion:*' list-dirs-first true

    # Separate matches into groups.
    zstyle ':completion:*:matches' group yes
    zstyle ':completion:*' group-name ''

    # Always use the most verbose completion.
    zstyle ':completion:*' verbose true

    # Treat sequences of slashes as single slash.
    zstyle ':completion:*' squeeze-slashes true

    # Describe options.
    zstyle ':completion:*:options' description yes

    # Completion presentation styles.
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:descriptions' format $'\e[1m -- %d --\e[22m'
    zstyle ':completion:*:messages' format $'\e[1m -- %d --\e[22m'
    zstyle ':completion:*:warnings' format $'\e[1m -- No matches found --\e[22m'

    # Don't complete completion functions/widgets.
    zstyle ':completion:*:functions' ignored-patterns '_*'

    # Show ignored patterns if needed.
    zstyle '*' single-ignored show

    # cd style.
    zstyle ':completion:*:cd:*' ignore-parents parent pwd

    # cd never selects the parent directory (e.g.: cd ../<TAB>)
    zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

    # kill style.
    zstyle ':completion:*:*:kill:*' command 'ps -a -w -w -u $USER -o pid,cmd --sort=-pid'
    zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=39=32"

    # Use zsh-completions if available.
    [[ -d $HOME/repos/zsh-completions ]] && fpath=($HOME/repos/zsh-completions/src $fpath)

    # Completion debugging
    bindkey '^Xh' _complete_help
    bindkey '^X?' _complete_debug
}
