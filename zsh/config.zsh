# Use emac mode
bindkey -e

fpath=(
  $DOTFILES/functions
  $HOME/.config/zsh/functions
  $fpath
)

autoload -U "$DOTFILES"/functions/*(:t)
autoload -U "$HOME"/.config/zsh/functions/*(:t)

# http://zsh.sourceforge.net/Doc/Release/Options.html

# Input/ Output
setopt ALIASES                 # Expand aliases.
setopt CORRECT                 # Try to correct the spelling of commands.
setopt INTERACTIVECOMMENTS     # Allow comments even in interactive shells.

# History
setopt APPEND_HISTORY          # Append history list to the history file, rather than replace it.
setopt EXTENDED_HISTORY        # Save each command’s beginning timestamp.
setopt INC_APPEND_HISTORY      # Save command immediately
setopt HIST_EXPIRE_DUPS_FIRST  # Expire oldest dups before unique commands
setopt HIST_FIND_NO_DUPS       # When searching don't display dups of a line previously found.
setopt HIST_IGNORE_ALL_DUPS    # Only save last item in duplicate history entries.
setopt HIST_IGNORE_DUPS        # If I type cd and then cd again, only save the last one.
setopt HIST_IGNORE_SPACE       # If a line starts with a space, don't save it.
setopt HIST_NO_STORE           # Remove the history command from the history list when invoked.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks from history.

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export HISTFILE=~/.zsh_history
export HISTTIMEFORMAT="[%F %T] "

# Completion
setopt ALWAYS_TO_END           # Move cursor to the end of a completed word.
setopt AUTO_LIST               # Automatically list choices on an ambiguous completion.
setopt AUTO_PARAM_SLASH        # If completed parameter is a directory, add a trailing slash.
setopt COMPLETEINWORD          # Keep cursor in-place during completion.
setopt GLOB_COMPLETE           # Do not expand globs, instead show completion.
setopt LIST_TYPES              # When listing files that are possible completions, show the type of
                               # each file with a trailing identifying mark.

# Expansion and Globbing
setopt EQUALS                  # Perform = filename expansion.
setopt EXTENDEDGLOB            # Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for
                               # filename generation.

setopt SHARE_HISTORY           # This option both imports new commands from the history file, and
                               # also causes your typed commands to be appended to the history file
                               # (the latter is like specifying INC_APPEND_HISTORY, so ensure it's
                               # turned off if this option is in effect).

unsetopt MENU_COMPLETE         # Do not autoselect the first completion entry.

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e[H"   beginning-of-line
bindkey "\e[F"   end-of-line
bindkey "\e[5~"  beginning-of-history
bindkey "\e[6~"  end-of-history
bindkey "\e[3~"  delete-char
bindkey "\e[5C"  forward-word
bindkey "\e[5D"  backward-word
bindkey "^[w"    backward-kill-word

WORDCHARS='*?_[]~&;!#$%^(){}<>'
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir
