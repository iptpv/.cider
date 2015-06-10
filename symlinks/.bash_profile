if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
export EDITOR=nvim

# mkdir
md() { mkdir -p "$@" && cd "$@"; }

# find
function f() { find . -name "$1" 2>/dev/null; }

# Extract archives of various types
function extract() {
    if [ -f $1 ] ; then
        local dir_name=${1%.*}  # Filename without extension
        case $1 in
            *.tar.bz2)  tar xjf           $1 ;;
            *.tar.gz)   tar xzf           $1 ;;
            *.tar.xz)   tar Jxvf          $1 ;;
            *.tar)      tar xf            $1 ;;
            *.tbz2)     tar xjf           $1 ;;
            *.tgz)      tar xzf           $1 ;;
            *.bz2)      bunzip2           $1 ;;
            *.rar)      unrar x           $1 $2 ;;
            *.gz)       gunzip            $1 ;;
            *.zip)      unzip -d$dir_name $1 ;;
            *.Z)        uncompress        $1 ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# pwd and cd aliases
alias .='pwd'
alias ..='cd ..'
alias ls='ls -G'
alias rm='rm -i'
alias cat='ccat'

# default editor
alias e='nvim'

# simple static server
alias server='python -m CGIHTTPServer'

# show current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] 🐰  "

# homebrew
export PATH=/usr/local/bin:$PATH

# nodejs
PATH=./node_modules/.bin:$PATH
