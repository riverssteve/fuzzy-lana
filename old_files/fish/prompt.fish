## Requires
##   fish      : http://fishshell.com/
##   mercurial : http://mercurial.selenic.com/


function __user_host
    set -l content
    if [ (id -u) = "0" ];
        echo -n (set_color red)
    else
        echo -n (set_color yellow)
    end
    echo -n $USER@(hostname|cut -d . -f 1) (set_color normal)
end

function __prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
    set_color blue
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        printf '~'
    end
    set_color normal
end

function __git_prompt

    if git_is_repo
        set_color cyan
        printf " :%s" (git branch ^/dev/null | grep \* | sed 's/* //' 2> /dev/null)
        set_color normal

        set -l untracked_count (git_untracked_files)

        if git_is_dirty
        or test $untracked_count -gt 0
            set_color red
            printf "%s" "["

            if git_is_dirty
                printf "%s" "!"
            end

            if test $untracked_count -gt 0
                printf "%s" "?"
            end
            printf "%s" "]"
        end

        set_color normal
    end
end

function __pew
    set -g __fish_prompt_venv (basename "$VIRTUAL_ENV")
    if test -n $__fish_prompt_venv
        set_color --bold -b blue white
        printf "$__fish_prompt_venv"
        set_color normal
        printf " "
    end
end

function fish_prompt --description 'Write out the prompt'
    __user_host   # Print user info
    __prompt_pwd  # Print current directory info
    printf " > "
end

function fish_right_prompt
    __git_prompt  # Print git info
end
