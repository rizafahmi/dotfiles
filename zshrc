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
export PATH=$PATH:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH=/usr/lib/node_modules:$PATH
export PATH=$HOME/bin/activator/bin:$PATH
export PATH=$HOME/bin/Concuerror:$PATH
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$HOME/.cask/bin:$PATH



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

export WORKON_HOME=~/Developers/Python
source /usr/local/bin/virtualenvwrapper.sh


alias ax10="axel -a -n 10 "
alias ax="axel -a "
alias ydl="youtube-dl "
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export NVM_DIR="/Users/riza/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/Developers/dotfiles, ~/Developers/ThrowAway, ~/Developers/elm, ~/Developers/Elixir Projects, ~/Developers/Hacktiv8, ~/Developers/NodeJS, ~/Developers/Python'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Tangerang Selatan'

# Set to false if you're an imperial savage. <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Twitter api keys

export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_77.jdk
grep -E "^setenv" /etc/launchd.conf | xargs -t -L 1 launchctl

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
