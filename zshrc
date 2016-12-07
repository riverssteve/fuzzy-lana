# Steve Rivers
# steve@crunchboards.com
# zshrc

# Startup {{{
PATH=$PATH:/usr/local/bin
source <(antibody init)
# }}}
# Environment settings {{{

export EDITOR='vim'

# Use GNU unix utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# }}}
# Options {{{

# History Settings
HISTFILE=~/.zhistory
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
# }}}
# UI {{{
eval `dircolors ~/.dircolors`

autoload -U compinit && {
    compinit

    # Speed up completion by avoiding partial globs.
    zstyle ':completion:*' accept-exact '*(N)'
    zstyle ':completion:*' accept-exact-dirs true

    # Default colors for listings.
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

    zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'

    # Separate directories from files.
    zstyle ':completion:*' list-dirs-first true

    # Highlight completion items
    zstyle ':completion:*' menu select

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

# Force rehash when command not found
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

# forces zsh to realize new commands
zstyle ':completion:*' completer _oldlist _expand _force_rehash _complete _match _ignored _approximate
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# }}}
# Aliases {{{
alias ls='ls --color'
# }}}
# Key bindings {{{
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
# }}}
# Functions {{{

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
# }}}
# Antibody {{{
antibody bundle mafredri/zsh-async
antibody bundle < $HOME/.plugins.txt
antibody bundle sindresorhus/pure
# }}}
# vim:foldmethod=marker:foldlevel=0
