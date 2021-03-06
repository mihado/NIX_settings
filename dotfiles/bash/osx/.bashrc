# Platform information
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='darwin'
fi

export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxHxhxDxfxhxhxhxhxcxcx

# $========== PARSE GIT ==========
# http://henrik.nyh.se/2008/12/git-dirty-prompt/
# https://techcommons.stanford.edu/topics/git/show-git-branch-bash-prompt

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "{!}"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

function proml {
  local CYAN="\[\033[0;36m\]"
  local PURPLE="\[\033[0;35m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local WHITE="\[\033[1;37m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local DEFAULT="\[\033[0m\]"

  case $TERM in
  xterm*)
    TITLEBAR='\[\033]0;\u@\h: \w\007\]'
    ;;
  *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}$LIGHT_GRAY[\u@\h]: $DEFAULT\w/$LIGHT_GRAY\$(parse_git_branch) $DEFAULT
 - $ "
}
proml
# !========== PARSE GIT ==========
