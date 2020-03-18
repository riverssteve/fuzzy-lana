zmodload zsh/complist

# Speed up completion by avoiding partial globs.
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' accept-exact-dirs true

# Default colors for listings.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Separate directories from files.
zstyle ':completion:*' list-dirs-first true

# Highlight completion items
zstyle ':completion:*' menu select

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Separate matches into groups.
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' group-name ''

# Always use the most verbose completion.
zstyle ':completion:*' verbose true

# Treat sequences of slashes as single slash.
zstyle ':completion:*' squeeze-slashes true

# Describe options.
zstyle ':completion:*:options' description yes

# Completion presentation styles.
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'

# Don't complete completion functions/widgets.
zstyle ':completion:*:functions' ignored-patterns '_*'

# Show ignored patterns if needed.
zstyle '*' single-ignored show

# cd style.
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# cd never selects the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

# kill style.
zstyle ':completion:*:*:kill:*' command 'ps -a -w -w -u $USER -o pid,cmd --sort=-pid'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=39=32"
