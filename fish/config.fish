# Fish Config
set TERM xterm-256color
set PATH $HOME/.bin $HOME/.local/bin $PATH
set -l fish_config $HOME/.config/fish

if [ -e $fish_config/prompt.fish ]
    . $fish_config/prompt.fish
end

if [ -e $fish_config/colors.fish ]
    . ~/.config/fish/colors.fish
end

if [ -e $fish_config/completion-colors.fish ]
    . ~/.config/fish/completion-colors.fish
end
