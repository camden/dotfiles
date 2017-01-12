# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSHRC=~/.zshrc

export VISUAL=vim
export EDITOR="$VISUAL"

# react native junk
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell-fork"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

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
plugins=(git brew autojump colored-man-pages colorize osx)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias tree='tree -C'
alias love='/Applications/love.app/Contents/MacOS/love'
alias t='todo.sh -d ~/.todo/config'
alias startPythonServer="python -m SimpleHTTPServer"

# add completion for todo.txt
# source /usr/local/Cellar/todo-txt/2.10/etc/bash_completion.d/todo_completion

# alias vim='mvim'

function gitnewpost() {
    git add _posts/
    git commit -m "new post"
    git push -u origin gh-pages
}

#
# Defines transfer alias and provides easy command line file and folder sharing.
#
# Authors:
#   Remco Verhoef <remco@dutchcoders.io>
#
 
if (( ! $+commands[curl] )); then
  return 1
fi
 
transfer() { 
    # check arguments
    if [ $# -eq 0 ]; 
    then 
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
        return 1
    fi
 
    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )
    
    # upload stdin or file
    file=$1
 
    if tty -s; 
    then 
        basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g') 
 
        if [ ! -e $file ];
        then
            echo "File $file doesn't exists."
            return 1
        fi
        
        if [ -d $file ];
        then
            # zip directory and transfer
            zipfile=$( mktemp -t transferXXX.zip )
            cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
            curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
            rm -f $zipfile
        else
            # transfer file
            curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
    fi
    else 
        # transfer pipe
        curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi
   
    # cat output link
    cat $tmpfile
 
    # cleanup
    rm -f $tmpfile
}
eval "`npm completion`"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# alias python='python3'
# alias pip='pip3'

PATH="/usr/local/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# source /usr/local/bin/virtualenvwrapper.sh
# source /usr/local/opt/autoenv/activate.sh
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
alias fuck='$(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# USEFUL ALIASES

alias rmi="rm -i"
alias notify='terminal-notifier -title "(づ￣ ³￣)づ" -message "Command finished executing" -sound "Frog" -activate com.googlecode.iterm2'

# GIT ALIASES

alias gs='git status'
alias gsm='git status | grep modified:'
alias ga='git add'
alias gc='git commit'


# vi mode stuff
bindkey -v

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1

set -o vi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Docker stuff
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.147.128:2376"
export DOCKER_CERT_PATH="/Users/cbickel1/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
# Run this command to configure your shell: 
# eval $(docker-machine env default)
export MY_HOST=192.168.147.1
export SOURCE=/Users/cbickel1/dev
# end Docker stuff

source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind ctrl-K and ctrl-J 
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

# bind shift-tab to backwards history
bindkey '^[[Z' reverse-menu-complete

