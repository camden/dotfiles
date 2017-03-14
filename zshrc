# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSHRC=~/.zshrc

export VISUAL=vim
export EDITOR="$VISUAL"

# react native junk
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

ZSH_THEME="robbyrussell-fork"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump colored-man-pages colorize osx)

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

###########
# Aliases #
###########

alias tree='tree -C'
alias love='/Applications/love.app/Contents/MacOS/love'
alias t='todo.sh -d ~/.todo/config'
alias startPythonServer="python -m SimpleHTTPServer"
alias ls='ls -FG'

# ag config
alias ag='ag --path-to-ignore ~/.agignore'

alias fuck='$(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

# USEFUL ALIASES

alias rmi="rm -i"
alias notify='terminal-notifier -title "(づ￣ ³￣)づ" -message "Command finished executing" -sound "Frog" -activate com.googlecode.iterm2'

# GIT ALIASES

alias gs='git status'
alias gsm='git status | grep modified:'
alias ga='git add'
alias gc='git commit'

#############
# Functions #
#############

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

# npm stuff
export PATH="$PATH:$NVM_DIR"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="/usr/local/bin:$PATH"
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
# source /usr/local/bin/virtualenvwrapper.sh
# source /usr/local/opt/autoenv/activate.sh
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"

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

###########
# Bindkey #
###########

# vi mode stuff
bindkey -v

# bind UP and DOWN arrow keys
bindkey '^[[Z' reverse-menu-complete

# bind ctrl-K and ctrl-J 
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down

# bind shift-tab to backwards history
bindkey '^[[Z' reverse-menu-complete

# fzf config
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g "" --path-to-ignore ~/.agignore'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -d ~/.nvm ] 
    then
        export NVM_DIR="/Users/cbickel1/.nvm"
        # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        alias loadnvm=". $NVM_DIR/nvm.sh"
        alias loadnvm_no_use=". $NVM_DIR/nvm.sh --no-use"
        nvm_sh=$NVM_DIR/nvm.sh

        function enableNPMCompletion() {
            eval "`npm completion`"
        }

        # nvm
        # THANK YOU: https://github.com/creationix/nvm/issues/539#issuecomment-245791291
        export NVM_DIR="$HOME/.nvm"

        # alias node='unalias node ; unalias npm ; nvm use default ; node $@'
        # alias npm='unalias node ; unalias npm ; nvm use default ; enableNPMCompletion; npm $@'

        NODE_VERSION="v7.4.0"
        . "$NVM_DIR/nvm.sh" --no-use
        export PATH="${PATH}:${NVM_DIR}/versions/node/${NODE_VERSION}/bin"
fi
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
