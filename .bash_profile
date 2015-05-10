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

# simple static server
alias server='python -m CGIHTTPServer'

# show current git branch
git_branch() {
    git branch --no-color 2> /dev/null | \
        awk -v "clrp=$txtpur" -v "clrr=$txtrst" \
            '{ print clrp "[" $2 clrr"]"}'
}
PS1="\$@\W\$(git_branch)∑ "

# homebrew
export PATH=/usr/local/bin:$PATH

# nodejs
PATH=./node_modules/.bin:$PATH
source ~/.nvm/nvm.sh
