#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#  Customize to your needs...
export TERM=xterm-256color
export EDITOR=nvim
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/Users/riza/Library/Python/2.7/bin:$PATH
export ANDROID_HOME=/usr/local/share/android-sdk
export HOSTNAME=hacktiv8-mac
export FBTOKEN=EAADsFkmVrFABAJkrPbdYbMQEY1EKHNkBGbJRwDBOmCs0ZABwJmZBTimiH1eYUbZCSqC8cxZC6Mwr7oFpyVY1MvqiK6WrHoTU2eOea2qRioe7zUqeiu80BzSUa53ATwWKLf9ki2A5yhVYqyqK6flrjZCO8UZBqqYqfd26JLcZAv9dZBjpUcQSZCghO2FOfFGKqOYm1CYHkMo8bvYBr4gmBgCvS
export AWS_ACCESS_KEY_ID=AKIAJAYLF75GFUSY7PKQ
export AWS_SECRET_ACCESS=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


# Temporary

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}



# Elixir Version Manager
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"


server() {
  local port="${1:-8000}"
  open "http://localhost:${port}" && livereload --port "$port"
}

mkcd() { mkdir -p "$@" && cd "$@"; }

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
  # Load rupa's z if installed
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ax10="axel -a -n 10 "
alias ax="axel -a "
alias ydl="youtube-dl -f mp4 "
alias ydlfem="youtube-dl -f mp4-mid -u rizafahmi@gmail.com -p mcew5s,juDr "
alias rm="trash"
alias v="nvim"
alias g="git"
alias df="df -h"
alias pg="pg_ctl -D /usr/local/var/postgres9.4 -l /tmp/logfile "
alias dock="docker"
alias rimraf="trash -rf"
alias npmbr="npm i babel-loader babel-preset-es2015 babel-preset-react -S"
alias babelrc="echo '{ \'presets\': [\'react\', \'es2016\'] }' >> .babelrc"
alias wt="webtorrent download "
alias c="clear"
alias cat="bat"
alias ping="prettyping --nolegend"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias top="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

function paste() {
 pbpaste > ${1}
}

function copy() {
 cat ${1} | pbcopy
}
