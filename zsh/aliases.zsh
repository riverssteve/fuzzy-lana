# Note: To use non-alias version prefix command with \

if [[ $(uname -s) == "Darwin" ]] ;
then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias pping='prettyping --nolegend'
alias vi='vim'
