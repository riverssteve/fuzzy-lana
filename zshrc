# Load aliases
[ -e "${HOME}/.aliases" ] && source "${HOME}/.aliases"

# Load dircolors
eval $(dircolors ~/.dircolors)

# You have to use npm to install npm, and that will give you the
# completion.sh file you need.
source /usr/lib/node_modules/npm/lib/utils/completion.sh

# ============================================================================
# Antigen

source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundles <<EOBUNDLES

git
mercurial

python
pip
virtualenvwrapper

coffee

zsh-users/zsh-completions src
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search

command-not-found
history
rsync
node
npm

EOBUNDLES

# Has to come after oh-my-zsh is loaded
antigen theme $HOME/repos/dotfiles/themes/terse.zsh-theme

# Tell antigen that you're done.
antigen apply

# ============================================================================
# Functions

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
# Options

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

# ==============================================================================
# Key bindings

# zsh-history substring - bind UP and DOWN arrow keys
zmodload zsh/terminfo

# ==============================================================================
# Completion

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
