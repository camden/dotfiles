# Thanks to http://radiumblue.net/blog/2013/04/29/zsh-prompt-spicing-up-the-present-working-directory/

parent_dir_color="cyan"
current_dir_color="magenta"

current_dir_path() {
    CURRENT=`dirname ${PWD}`
    if [[ $CURRENT = /  ]]; then
        echo ""
    elif [[ $PWD = $HOME  ]]; then
        echo ""
    else
        CURRENT=$(print -P %3~)
        echo "${CURRENT%/*}/"
    fi

}

directory_name() {
    echo "%{$fg[$parent_dir_color]%}$(current_dir_path)%{$reset_color%}%{$fg_bold[$current_dir_color]%}%1~%{$reset_color%}"
}

NEWLINE=$'\n'
PROMPT_SYMBOL=$'╼'
local ret_status="%(?:%{$fg_bold[green]%}${PROMPT_SYMBOL} :%{$fg_bold[red]%}${PROMPT_SYMBOL} )"
PROMPT='${NEWLINE}${NEWLINE}╭╼ $(directory_name)$reset_color%} $(git_prompt_info)
╰${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
