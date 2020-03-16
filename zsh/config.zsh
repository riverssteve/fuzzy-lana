# Use emac mode
bindkey -e

fpath=($DOTFILES/functions $fpath)

setopt ALIASES 
setopt APPEND_HISTORY 
setopt AUTO_LIST 
setopt COMPLETEINWORD 
setopt CORRECT 
setopt EQUALS 
setopt EXTENDEDGLOB 
setopt EXTENDED_HISTORY 
setopt GLOB_COMPLETE 

setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_FIND_NO_DUPS 

# If I type cd and then cd again, only save the last one
setopt HIST_IGNORE_DUPS

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE

# Even if there are commands inbetween commands that are the same,
# still only save the last one
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS 

setopt INTERACTIVECOMMENTS 
setopt LIST_TYPES 
setopt SHARE_HISTORY

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