# ---------------------------------------------------------------------------
# Work Environment
# ---------------------------------------------------------------------------
if [[ $OSTYPE == "linux-gnu" ]]; then
    export TERM=xterm-256color

    # Personal Information
    source $HOME/.ldap_info

    # Take me to my chroot!
    function to(){ cd $HOME/timaeus/chroots/$1$HOME;}

    # Path
    export PATH=/home/srivers/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/srivers/bin:/opt/node/bin

    # Timaeus information
    export PATH=$PATH:~/timaeus/bin
    export PATH=$PATH:/opt/node/bin
    export PATH=$PATH:~/.local/bin
    export CHROOTS_DIR=~/timaeus/chroots
    export SVNROOT=hg:http://hg.devel.cmedltd.com/timaeus

    # Load Xmodmap settings, if any.
    xmodmap_rc=$HOME/.xmodmap

    if [[ -n $DISPLAY ]]; then
        [[ -f $xmodmap_rc ]] && xmodmap $xmodmap_rc
    fi
fi
# ----------------------------------------------------------------------------
# ZSH Options
# ----------------------------------------------------------------------------

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
plugins=(git)

eval $(dircolors ~/.dircolors)
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------

# List directory contents after a 'cd'
function chpwd() {
    emulate -LR zsh
    ls
}

# M^s to insert sudo at start of line
insert_sudo () {
    zle beginning-of-line;
    zle -U "sudo "
}

zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# ----------------------------------------------------------------------------
# Options
# ----------------------------------------------------------------------------

# History Settings
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

setopt ALIASES \
       AUTO_LIST \
       COMPLETEINWORD \
       CORRECTALL \
       EQUALS \
       EXTENDEDGLOB \
       HIST_SAVE_NO_DUPS \
       HIST_EXPIRE_DUPS_FIRST \
       HIST_FIND_NO_DUPS \
       LIST_TYPES \
       INTERACTIVECOMMENTS \
       APPEND_HISTORY \
       SHARE_HISTORY \
       EXTENDED_HISTORY \
       HIST_REDUCE_BLANKS

# Even if there are commands inbetween commands that are the same, still only save the last one
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

# ------------------------------------------------------------------------------
# Key bindings / ZLE configuration
# ------------------------------------------------------------------------------

# Use Emacs line editing mode
bindkey -e

# <up>/<down> => Fish style history substring search
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh &>/dev/null || \
. $MAIN_USER_HOME/projects/zsh-history-substring-search/zsh-history-substring-search.zsh &>/dev/null

# ----------------------------------------------------------------------------
# Completion
# ----------------------------------------------------------------------------

# zsh auto-completion
autoload -U compinit && {

    # Init completion, ignoring security checks.
    compinit

    # Speed up completion by avoiding partial globs.
    zstyle ':completion:*' accept-exact '*(N)'
    zstyle ':completion:*' accept-exact-dirs true

    # Default colors for listings.
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    #zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'

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
    zstyle ':completion:*:cd:*' ignore-parents parent pwd # cd never selects the parent directory (e.g.: cd ../<TAB>)
    zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

    # kill style.
    zstyle ':completion:*:*:kill:*' command 'ps -a -w -w -u $USER -o pid,cmd --sort=-pid'
    zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=39=32"

    # Use zsh-completions if available.
    [[ -d $HOME/repositories/zsh-completions ]] && fpath=($HOME/repositories/zsh-completions/src $fpath)

    # Completion debugging
    bindkey '^Xh' _complete_help
    bindkey '^X?' _complete_debug
}
