# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

eval $(dircolors ~/.dircolors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# List directory contents after a 'cd'
function chpwd() {
    emulate -LR zsh
    ls
}

# Insert sudo at start of line
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo

# -------
# Exports
# -------
export PATH=/home/srivers/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/srivers/bin:/opt/node/bin
export TERM=xterm-256color
#export TERM=rxvt

# -------
# Aliases
# -------
alias ll='ls -alFh'
alias ld='ls -alFh --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lstr='ls -lstr'

alias open='nautilus'

# Wolf aliases
alias def='cd /home/srivers/chroots/default/home/srivers/'
alias chr='chr -Xd /home/srivers/chroots/default/ bash'
alias templates='cd home/srivers/chroots/default/home/srivers/web/templates'
alias resources='cd home/srivers/chroots/default/home/srivers/web/resources'

# misc
alias psql_trunk='sudo /etc/init.d/postgresql stop && chr -Xd /home/srivers/chroots/trunk/ bash'
alias trunk='chr -Xd /home/srivers/chroots/trunk/ bash'
alias tail_syslog='tail -f /var/log/syslog'

# Mercurial aliases
alias hgmv='hg qpush --move'
