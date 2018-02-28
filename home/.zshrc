#!/bin/zsh

# function ls() {[ $(($RANDOM % 20)) -eq 0 ] && sl || /bin/ls}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

export GOPATH=$HOME/go

PATH=~/bin:/usr/local/sbin:/usr/local/bin:/usr/local/go/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/games:$GOPATH/bin
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

CDPATH=.:~

export WORKON_HOME=~/virtualenvs
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# sourcing virtualenvwrapper takes a second. that's too long when starting a new shell
alias venv='source $HOME/bin/virtualenvwrapper.sh'
alias renv='source $HOME/.rvm/scripts/rvm' # Load RVM into a shell session *as a function*
alias ftc='venv && workon ftc'
# nvm takes a second. too long!
export NVM_DIR="$HOME/.nvm"
alias nenv=". $NVM_DIR/nvm.sh"

source $HOME/.z_passwords

# Enable command not found support on Ubuntu
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

export EDITOR="subl -w"
export GIT_EDITOR=$EDITOR
export SVN_EDITOR=$EDITOR

# Parallelize builds by default
export MAKEFLAGS="-j4"
export PYTHONDONTWRITEBYTECODE=1

export JAVA_HOME=/usr

export NODE_REPL_HISTORY_FILE=~/.node_history

export CLICOLOR=1
export GREP_COLOR=auto
export LSCOLORS=Exgxcxdxbxegedabagacad
export WORDCHARS='*?[]~&;!$%^<>'


# export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

# Fix for xquartz
#export DISPLAY=:0

export HOMEBREW_NO_ANALYTICS=1

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
unsetopt share_history
alias dh='dirs -v'

# Enable Rupa's Z
. ~/bin/z.sh

PROMPT='%{$fg[green]%}%n%{$fg[white]%}@%{$fg[yellow]%}%m%{$fg[white]%}:%{$fg[cyan]%}%~% %(?.%{$fg[green]%}.%{$fg[red]%})%B%#%b '

alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

alias ls='ls -F --color=auto'
#alias ls='ls -GF'
alias te='ls -a -F'
alias tu='ls -la'
alias ll='ls -la'
alias tet='ls -halt'
alias cd..='cd ..'
alias ..='cd ..'

alias assh='ssh -A home.abughrai.be -p 2022 -D3000'
#alias abumount='mkdir -p /Volumes/home.abughrai.be && sshfs -f -p 2022 home.abughrai.be:/x1 /Volumes/home.abughrai.be'
#alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
#alias lock='gnome-screensaver-command -l'
alias lock='lock-screen'
alias op='xdg-open'
#alias op='open'

# bindkey -e #Use emacs mode, it's more sane for beginners
# bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
# bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word

# Use alt + arrows to move between words
bindkey "\e$terminfo[kcub1]" backward-word
bindkey "\e$terminfo[kcuf1]" forward-word

# Get fn+delete working in zsh
# bindkey "^[[3~" delete-char

# autoload edit-command-line
# zle -N edit-command-line
# bindkey '^X^e' edit-command-line

rot13 () { tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" }

function git-rm-untracked {
    git st -s -u | awk "{ print \$2 }" | xargs rm
}

function ascp {
    scp -P2022 "$@" home.abughrai.be: ;
}

function upscreen {
    URL=$(python -c "import urllib; print urllib.quote('''$1''')")
    echo http://abughrai.be/pics/screenshots/$URL
    scp "$@" abughrai.be:/usr/local/www/apache24/data/pics/screenshots/ ;
}

function svtail {
    tail -F /service/$@/log/main/current
}

function svtailall {
    tail -F /service/*/log/main/current
}

function git_current_branch() {
    git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

function git_current_origin() {
  git ls-remote --get-url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
# git config --get remote.origin.url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
}

# create a github pull request from the current branch
alias gpr='op "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'

# Show manpage in textmate
function tman {
    MANWIDTH=100 MANPAGER='col -bx' man $@ | mate
}

# Function for making PDF versions of man pages
function pman() {
    man $@ -t | open -f -a Preview
}

# usage: "multi 3 echo blah" will print blah 3 times
function multi {
    n=$1; shift; for ((i=0;i<n;i++)) do $@; done;
}
