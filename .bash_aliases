# Some bash aliases
alias ll='ls -alFh'
alias ld='ls -alFh --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias lstr='ls -lstr'

alias open='nautilus'

alias install='sudo apt-get install'
alias remove='sudo apt-get remove'
alias update='sudo apt-get update'
alias search='sudo apt-cache search'
alias postgresstop='sudo /etc/init.d/postgresql stop'

# Aliases for cd
alias cddb='cd /home/srivers/Dropbox'
alias cdwork='cd /home/srivers/Dropbox/Active/Work'
alias cdtrunc='cd /home/srivers/chroots/trunk/home/srivers/conductor'
alias cdtrunkh='cd /home/srivers/chroots/trunk/home/srivers'
alias cdtrunkv='cd /home/srivers/chroots/trunk/home/srivers/trial_releases/validation__HEAD/validation'
alias cdti='cd /home/srivers/timaeus'

# Wolf aliases
alias defc='cd /home/srivers/chroots/default/home/srivers/conductor'
alias defcw='cd /home/srivers/chroots/default/home/srivers/web/src/conductorweb'
alias def='cd /home/srivers/chroots/default/home/srivers/'
alias chrdef='chr -Xd /home/srivers/chroots/default/ bash'
alias templates='cd home/srivers/chroots/default/home/srivers/web/templates'
alias resources='cd home/srivers/chroots/default/home/srivers/web/resources'

# misc
alias psql_trunk='sudo /etc/init.d/postgresql stop && chr -Xd /home/srivers/chroots/trunk/ bash'
alias trunk='chr -Xd /home/srivers/chroots/trunk/ bash'
alias tail_syslog='tail -f /var/log/syslog'

# Mercurial aliases
alias hgmv='hg qpush --move'
