# Steve Rivers
# steve@crunchboards.com
# zshrc

# Startup {{{

# Load antibody
source <(antibody init)
# }}}
# Environment settings {{{

export EDITOR='vim'
export FZF_DEFAULT_COMMAND='ag -g ""'
export GEMFURY_TOKEN='iFqUs6qXKz4Qh4HKypE4'

WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# }}}
# Options {{{

# History Settings
HISTFILE=~/.zhistory
SAVEHIST=10000
HISTSIZE=10000

# More info here: http://zsh.sourceforge.net/Doc/Release/Options.html
unsetopt CORRECT_ALL

setopt \
    ALIASES \
    APPEND_HISTORY \
    AUTO_LIST \
    COMPLETEINWORD \
    CORRECT \
    EQUALS \
    EXTENDEDGLOB \
    EXTENDED_HISTORY \
    GLOB_COMPLETE \
    HIST_EXPIRE_DUPS_FIRST \
    HIST_FIND_NO_DUPS \
    HIST_REDUCE_BLANKS \
    INTERACTIVECOMMENTS \
    LIST_TYPES \
    SHARE_HISTORY

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
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "^[w" backward-kill-word

#bindkey "^P" history-substring-search-up
#bindkey "^[[A" history-substring-search-up
#bindkey "^[[B" history-substring-search-down

# Disable HOME and END
#bindkey -r "\e[H"
#bindkey -r "\e[F"

# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
# }}}
# Functions {{{

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# }}}
# Antibody {{{
antibody bundle mafredri/zsh-async
#antibody bundle sindresorhus/pure
antibody bundle rupa/z
antibody bundle denysdovhan/spaceship-prompt
# }}}
# Theme {{{

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  aws           # Amazon Web Services section
  venv          # virtualenv section
  node          # node version
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_DIR_TRUNC='0'
# }}}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.local/bin/aws_zsh_completer.sh ] && source $HOME/.local/bin/aws_zsh_completer.sh
eval "$(pyenv init -)"

# NVM setup
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

# vim:foldmethod=marker:foldlevel=0
