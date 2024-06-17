# import
source ~/.zsh_env_vars

########################################
# Zoxide
# https://github.com/ajeetdsouza/zoxide
########################################
eval "$(zoxide init zsh)"

########################################
# History configuration
# https://martinheinz.dev/blog/110
########################################

## Display timestamps for each command
## You can set one of the optional three formats:
## "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## or set a custom format using the strftime function format specifications,
## see 'man strftime' for details.
HIST_STAMPS="%T %y-%m-%d"
HISTSIZE=10000000
SAVEHIST=10000000

## Ignore these commands in history
HISTORY_IGNORE="(ls|pwd|exit|cd)*"

## Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

## Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

## Don't store history commands
setopt HIST_NO_STORE

## Do not record an event that was just recorded again
setopt HIST_IGNORE_DUPS

## Don't store history commands
setopt HIST_NO_STORE

## Remove superfluous blanks from each command line being added to the history
setopt HIST_REDUCE_BLANKS

########################################
# Java
########################################

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

########################################
# Dart / Flutter
########################################

export PATH="$HOME/fvm/versions/stable/bin:$HOME/.pub-cache/bin:$PATH"


########################################
# Android
########################################

export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"

########################################
# Homebrew
########################################
export HOMEBREW_AUTO_UPDATE_SECS=172800 # update every 2 days

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gw="./gradlew"
alias find="/usr/bin/find ./ -name"
alias logcat="adb logcat"

########################################
# Zsh
########################################

# Path to your oh-my-zsh installation
export ZSH="/Users/andrea/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/repositories/dotfiles/zshcustom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  osx
  git-flow
  taskwarrior
)

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


export PATH="/usr/local/sbin:$PATH"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/andrea/.dart-cli-completion/zsh-config.zsh ]] && . /Users/andrea/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


########################################
# Maestro
########################################
export PATH=$PATH:$HOME/.maestro/bin
