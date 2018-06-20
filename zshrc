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
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=$HOME/node_modules/bin:$PATH
export HOSTNAME=hacktiv8-mac



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
alias ydlpluralsight="youtube-dl -f mp4 -u adhywiranatap@gmail.com -p bWEmv89bU65r "
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
alias em="emacs -nw"
alias ec="emacsclient -c -a emacs --no-wait"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
