
# Terse theme for zsh
# Requires hg-prompt mq extension

# Looks like:
# clamps: ~
#    »

# Are we using Mercurial?
if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi

# Display return code
local return_code="%(?..%{$R%}[%?] %{$RESET%})"

# Display my patches and the state of my Mercurial repository
function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
< hg[%{$FG[002]%}<branch>>%{$reset_color%}%{$FG[001]%}<status|modified|unknown><update>%{$reset_color%}\
<:%{$FG[003]%}<patch>%{$reset_color%}>]" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function prompt_char {
    #hg root >/dev/null 2>/dev/null && echo 'hg » ' && return
    echo ' » '
}

function header_info {
    hg qheader
}


PROMPT='
%D{%H:%M} \
%{$FG[004]%}${PWD/#$HOME/~}%{$reset_color%}\
$(hg_prompt_info)%{$reset_color%}
%{$FG[005]%}$(box_name)%{$reset_color%}\
$(prompt_char)'

# Colour the spell checker
SPROMPT='%{$FG[003]%}zsh: correct "%U%R%u" to "%U%r%u"%{$reset_color%} %{$FG[014]%}[Nyae]%{$reset_color%}: '
