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

# Load Xmodmap settings, if any.
xmodmap_rc=$HOME/.xmodmap

if [[ -n $DISPLAY ]]; then
  [[ -f $xmodmap_rc ]] && xmodmap $xmodmap_rc
fi

# List directory contents after a 'cd'
function chpwd() {
    emulate -LR zsh
    ls
}

# M^s to insert sudo at start of line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# Take me to my chroot!
function to(){ cd $HOME/timaeus/chroots/$1$HOME;}

# ----------------------------------------------------------------------------
# Options
# ----------------------------------------------------------------------------

# History Settings
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

setopt extendedglob \
       completeinword \
       correctall \
       HIST_SAVE_NO_DUPS \
       HIST_EXPIRE_DUPS_FIRST \
       HIST_FIND_NO_DUPS

# Don't overwrite, append!
setopt APPEND_HISTORY

# Killer: share history between multiple shells
setopt SHARE_HISTORY

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# Even if there are commands inbetween commands that are the same, still only save the last one
setopt HIST_IGNORE_ALL_DUPS

# Pretty    Obvious.  Right?
setopt HIST_REDUCE_BLANKS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

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
    #zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")'

    zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

    # Separate directories from files.
    zstyle ':completion:*' list-dirs-first true

    # Describe options.
    zstyle ':completion:*:options' description yes

    # Hostnames completion.
    zstyle -e ':completion:*:hosts' hosts 'reply=(
      ${${${${(f)"$(<~/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*}
      ${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*[*?]*}
      ${(s: :)${(ps:\t:)${${(f)~~"$(</etc/hosts)"}%%\#*}#*[[:blank:]]}}
    )'
    zstyle ':completion:*:*:*:hosts' ignored-patterns 'ip6*' 'localhost*'
}

# ----------------------------------------------------------------------------
# Exports
# ----------------------------------------------------------------------------

export PATH=/home/srivers/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/srivers/bin:/opt/node/bin
#export TERM=xterm-256color
export PATH=$PATH:~/timaeus/bin
export PATH=$PATH:/opt/node/bin
export CHROOTS_DIR=~/timaeus/chroots
export SVNROOT=hg:http://hg.devel.cmedltd.com/timaeus
