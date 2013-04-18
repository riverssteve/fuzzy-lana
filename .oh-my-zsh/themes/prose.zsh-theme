
# Color shortcuts
R=$fg[red]
G=$fg[green]
M=$fg[magenta]
RB=$fg_bold[red]
YB=$fg_bold[yellow]
BB=$fg_bold[blue]
RESET=$reset_color

if [ "x$OH_MY_ZSH_HG" = "x" ]; then
    OH_MY_ZSH_HG="hg"
fi

local return_code="%(?..%{$R%}[%?] %{$RESET%})"

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function hg_prompt_info {
    $OH_MY_ZSH_HG prompt --angle-brackets "\
<%{$FG[006]%}repo: %{$reset_color%}%{$FG[003]%}<branch>%{$reset_color%}>\
%{$R%}<status|modified|unknown><update>%{$reset_color%}\
 %{$FG[003]%}[<patch|count> patches]%{$reset_color%} <%{$FG[006]%}patch: %{$reset_color%}%{$FG[003]%}<patch>%{$reset_color%}>" 2>/dev/null
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function prompt_char {
    hg root >/dev/null 2>/dev/null && echo 'hg »' && return
    echo '    »'
}

PROMPT='
%{$FG[005]%}$(box_name):%{$reset_color%} %{$FX[bold]$FG[033]%}${PWD/#$HOME/~}%{$reset_color%} $(hg_prompt_info)
$(virtualenv_info)%(?,,%{${fg_bold[white]}%}%{$reset_color%})$(prompt_char) '

RPS1='${return_code}%* %D%{$reset_color%}'
