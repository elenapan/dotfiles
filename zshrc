# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/elena/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="random"
#ZSH_THEME="suvash"
#ZSH_THEME="nanotech"
#ZSH_THEME="flazz"
#ZSH_THEME="wezm+"
#ZSH_THEME="dieter"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="nicoulaj"
#ZSH_THEME="cypher"
#ZSH_THEME="norm"
#ZSH_THEME="apple"
#ZSH_THEME="candy"
#ZSH_THEME="adben"
#ZSH_THEME="fishy"
#ZSH_THEME="myimp"
#ZSH_THEME="myagnosterzak"
#ZSH_THEME="agnoster"
#ZSH_THEME="mrtazz"
#ZSH_THEME="mygeek"
#ZSH_THEME="afowler"
ZSH_THEME="zhann"
#ZSH_THEME="mgutz"
#ZSH_THEME="lukerandall"

# Import colorscheme from 'wal' // Works but not needed for me
#(wal -r &)

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias h="history"
alias p="pwd -P"
alias s="sudo -s"
alias CD="cd"
# clock
#alias c="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &; clear"

alias netprocs="lsof -P -i -n"
alias up="sudo apt update && sudo apt upgrade"
alias colortest="~/Scripts/Color/bloks"
# So that sudo doesnt override aliases (doesnt work with flags)
# alias sudo='sudo '

# neovim
# alias vim="nvim" # not needed since i used update-alternatives
alias init.vim="vim ~/.config/nvim/init.vim"

# Quick edit
alias xr="vim ~/.Xresources"
alias zshrc="vim ~/.zshrc"
alias i3config="vim ~/.config/i3/config"
alias polyconf="vim ~/.config/polybar/config"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias tint2rc="vim ~/.config/tint2/tint2rc"
alias userChrome.css="vim ~/Themes/Firefox/userChrome.css"
#alias subl="subl3"

# Uncomment to reenable even-better-ls
# Doesnt work in urxvt
# LS_COLORS=$(ls_colors_generator)

# run_ls() {
# 	ls-i --color=auto -w $(tput cols) "$@"
# }

# run_dir() {
# 	dir-i --color=auto -w $(tput cols) "$@"
# }

# run_vdir() {
# 	vdir-i --color=auto -w $(tput cols) "$@"
# }
# alias ls="run_ls"
# alias dir="run_dir"
# alias vdir="run_vdir"

# urxvt
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word
bindkey "^H" backward-kill-word
bindkey "^[[3^" kill-word

# other
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# lxterminal doesnt detect diff between backspace and ctrl + backspace
#bindkey "^?" backward-kill-word

