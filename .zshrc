# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="garyblessington"

# Autojump
#. /usr/share/autojump/autojump.zsh

# Import colorscheme from wal
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

export HISTSIZE=500000
export SAVEHIST=500000
# export MANPATH="/usr/local/man:$MANPATH"

# Cursor
#echo -e -n "\x1b[\x30 q" # changes to blinking block
#echo -e -n "\x1b[\x31 q" # changes to blinking block also
#echo -e -n "\x1b[\x32 q" # changes to steady block
#echo -e -n "\x1b[\x33 q" # changes to blinking underline
echo -e -n "\x1b[\x34 q" # changes to steady underline
#echo -e -n "\x1b[\x35 q" # changes to blinking bar
#echo -e -n "\x1b[\x36 q" # changes to steady bar

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

# Find new executables in path
zstyle ':completion:*' rehash true

#This causes pasted URLs to be automatically escaped, without needing to disable globbing.
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

# --- Remembering recent directories ---
# --- NOTE: Doesn't work if you have more than one zsh session open, and attempt to cd, due to a conflict in both sessions writing to the same file. ---
#DIRSTACKFILE="$HOME/.cache/zsh/dirs"
#if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  #dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  #[[ -d $dirstack[1] ]] && cd $dirstack[1]
#fi
#chpwd() {
  #print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
#}

#DIRSTACKSIZE=20

#setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

### Remove duplicate entries
#setopt PUSHD_IGNORE_DUPS

### This reverts the +/- operators.
#setopt PUSHD_MINUS
# --------------------------------------

# Allows st to use different cursors in different vim modes (in neovim)
#export TERM=xterm
#export TERM=xterm-256color

# Possible fix for del key not working on st
#function zle-line-init () { echoti smkx }
#function zle-line-finish () { echoti rmkx }
#zle -N zle-line-init
#zle -N zle-line-finish

# Set current working directory for termite
if [[ $TERM == xterm-termite ]]; then
  source /etc/profile.d/vte-2.91.sh
fi

# Freeze and unfreeze processes (for example: stop firefox)
stop(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: stop process
  else
    PROCESS=$1
    echo "Stopping processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -STOP
  fi
}

cont(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: cont process
  else
    PROCESS=$1
    echo "Continuing processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -CONT
  fi
}

export WEECHAT_HOME="~/.config/weechat"

export EDITOR=vim
export BROWSER=firefox

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
alias hc='herbstclient'
alias ff='firefox'
# Force tmux to use 256 colors
# Either set this or TERM=xterm (or both if tmux keeps messing up?)
#alias tmux="tmux -2"
# clock
#alias c="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &; clear"

alias netprocs="lsof -P -i -n"
alias up="sudo apt update && sudo apt upgrade"
# So that sudo doesnt override aliases (doesnt work with flags)
# alias sudo='sudo '

# neovim
# alias vim="nvim" # not needed since i used update-alternatives
alias init.vim="vim ~/.config/nvim/init.vim"

# Quick edit
alias xr="vim ~/.Xresources"
alias xrc="vim ~/.wally/Xresources-clean"
alias zshrc="vim ~/.zshrc"
alias i3config="vim ~/.config/i3/config"
alias polyconf="vim ~/.config/polybar/config"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias tint2rc="vim ~/.config/tint2/tint2rc"
alias userChrome.css="vim ~/thm/Firefox/userChrome.css"
alias stconf="vim ~/pro/xst/src/config.h"
alias playlists="vim ~/.config/mpv/tubify_playlists"
alias airlinevim="vim ~/.config/nvim/plugged/vim-airline/autoload/airline/themes/dark.vim"
alias quteconf="vim ~/.config/qutebrowser/config.py"
alias comptonconf="vim ~/.config/compton/compton.conf"
alias rc.lua="vim ~/.config/awesome/rc.lua"
alias theme.lua="vim ~/.config/awesome/themes/reasons/theme.lua"
#alias awesomeconf="vim ~/.config/awesome/rc.lua"
#alias subl="subl3"
# Update qutebrowser
alias quteup="(cd ~/pro/qutebrowser; git pull origin && tox -r -e mkvenv-pypi-old)"

# nvidia optimus -> prime select 
alias nvidia="sudo prime-select nvidia"
alias intel="sudo prime-select intel"
# cpu governor
alias gameoff="sudo cpufreq-set -g powersave"
alias gameon="sudo cpufreq-set -g performance"

# translate-shell: brief
alias t='trans -brief'

# --- even-better-ls ---  
# LS_COLORS=$(ls_colors_generator)
# run_ls() {
#         ls-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }

# run_dir() {
#         dir-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }

# run_vdir() {
#         vdir-i --color=auto --group-directories-first -w $(tput cols) "$@"
# }
# alias ls="run_ls"
# alias dir="run_dir"
# alias vdir="run_vdir"
# --- ---

# urxvt
#bindkey "^[Od" backward-word
#bindkey "^[Oc" forward-word
bindkey "^H" backward-kill-word
#bindkey "^[[3^" kill-word

# other
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
# lxterminal doesnt detect diff between backspace and ctrl + backspace
#bindkey "^?" backward-kill-word

