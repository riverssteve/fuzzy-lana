SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  pyenv         # Pyenv section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  jobs          # Backgound jobs indicator
  exit_code     # Exit code section
  line_sep
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  git           # Git section (git_branch + git_status)
)
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true

SPACESHIP_DIR_TRUNC="1"
SPACESHIP_CHAR_SYMBOL='> '

# Git
SPACESHIP_GIT_PREFIX=''

# Pyenv
SPACESHIP_PYENV_PREFIX=''
SPACESHIP_PYENV_SUFFIX=' '
SPACESHIP_PYENV_SYMBOL=''

# Venv
SPACESHIP_VENV_SYMBOL=''
SPACESHIP_VENV_PREFIX='in venv '