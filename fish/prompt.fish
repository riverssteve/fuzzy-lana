## Requires
##   hg prompt : http://stevelosh.com/projects/hg-prompt/
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

function __hg_prompt
    # Quick way to see if we're in a mercurial repo
    if test -d $PWD/.hg
        set_color green
        printf " :%s" (hg prompt "{branch}{ ({bookmark})}" 2> /dev/null)
        set -l dirty (hg prompt "{status}{outgoing}" 2> /dev/null)
        set -l patch (hg prompt "{patch}" 2> /dev/null)
        if not test "$dirty" = ""
            set_color red
            printf "%s" $dirty
            set_color normal
        end
        if not test "$patch" = ""
            printf ":" $patch
            set_color yellow
            printf "%s" $patch
            set_color normal
        end
        set_color normal
    end
end

function fish_prompt --description 'Write out the prompt'
    printf "\n"
    __user_host
    __prompt_pwd
    #printf "\n"
    printf " » "
end

function fish_right_prompt
    function find_hg_root
        set -l dir (pwd)
        set -e HG_ROOT

        while test $dir != "/"
            if test -f $dir'/.hg/dirstate'
            set -g HG_ROOT $dir"/.hg"
            return 0
            end

            set -l dir (dirname $dir)
        end

        return 1
    end
    if find_hg_root 2>&1
        set_color normal
        printf 'hg:'

        printf '['
        # show red dot if there are uncommited changes
        if test (count (hg status)) != 0
            set_color black --background red
            printf '!'
            set_color normal
        end

        # show branch name
        set_color magenta
        printf '%s' (cat "$HG_ROOT/branch" 2>/dev/null; or hg branch)
        set_color normal

        printf '@'

        set -l patch (cat "$HG_ROOT/patches/status")
        # show 7 digits of commit hash (like git)
        if test -z $patch
            set_color green
        else
            set_color black --background red
        end
        printf '%s' (hexdump -n 4 -e '1/1 "%02x"' "$HG_ROOT/dirstate" | cut -c-7)
        set_color normal

        printf ']'
    end
end