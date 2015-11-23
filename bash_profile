GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_COMPLETION=/usr/local/git/contrib/completion/git-completion.bash
if [ ! -s $GIT_COMPLETION ]; then
  GIT_COMPLETION=/opt/boxen/homebrew/etc/bash_completion.d/git-completion.bash
fi
[[ -s $GIT_COMPLETION ]] && source $GIT_COMPLETION

GIT_PROMPT=/opt/boxen/homebrew/etc/bash_completion.d/git-prompt.sh
[ -s $GIT_PROMPT ] && source $GIT_PROMPT

if [ -s "$HOME/.rvm/bin/rvm-prompt" ]; then
  eval "$(rbenv init -)"

  __rvm_ps1()
  {
    local r=`~/.rvm/bin/rvm-prompt`
    if [ -n "$r" ]; then
      printf " $r"
    fi
  }
fi

function __rbenv_ps1() {
  local r=`rbenv version 2> /dev/null | sed 's/\([^ ]*\).*/(\1)/'`
  if [ -n "$r" ] && [ $r != "(system)" ]; then
    printf " $r"
  fi
}

fn_exists()
{
  type $1 2>/dev/null | grep -q 'is a function'
}

[[ -s "$HOME/.bash_exports" ]] && . "$HOME/.bash_exports"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

#BLACK="\[\033[30m\]"
#RED="\[\033[31m\]"
#GREEN="\[\033[32m\]"
#YELLOW="\[\033[33m\]"
#BLUE="\[\033[34m\]"
#MAGENTA="\[\033[35m\]"
#CYAN="\[\033[36m\]"
#GREEN="\[\033[37m\]"
#GREEN="\[\033[38m\]"
#YELLOW="\[\033[33m\]"
#BLUE="\[\033[0;38m\]"
#RESET="\[\033[0m\]"
black="\033[0;30m"
darkblack="\033[1;30m"
red="\033[0;31m"
orange="\033[1;31m"
green="\033[0;32m"
yellow="\033[0;33m"
blue="\033[0;34m"
pink="\033[0;35m"
purple="\033[1;35m"
cyan="\033[0;36m"
darkwhite="\033[0;37m"
white="\033[1;37m"
gray="\033[0;38m"
lightgray="\033[1;38m"
reset="\033[0m"
bgblack="\033[40m"
bgred="\033[41m"
bggreen="\033[42m"
bgyellow="\033[43m"
bgblue="\033[44m"
bgpink="\033[45m"
bgcyan="\033[46m"
bgwhite="\033[47m"
bgdarkblack="\033[48m"

DEFAULT_USER=feoliveira

function __user_ps1() {
  if [ ! "$USER" = "$DEFAULT_USER" ]; then
    printf "${gray}${bgblack} $USER@$(hostname -s) ${black}${bgcyan} "
  fi
}

function __my_git_ps1() {
  branch=$(__git_ps1 ' ')
  printf "${darkwhite}${bgyellow}${branch}"
  #NORMAL   master  test                                                                                                      sh  [unix]   19%   12:  1
}

PS1="\$(__user_ps1)${black}${bgcyan} \w ${cyan}\$(__my_git_ps1)"
if [ -s "$HOME/.rvm/bin/rvm-prompt" ] && fn_exists "__rvm_ps1"; then
  PS1=$PS1'\[\033[0;36m\]$(__rvm_ps1)'
fi
if [ `which rbenv` ] && fn_exists "__rbenv_ps1"; then
  PS1=$PS1'\[\033[0;36m\]$(__rbenv_ps1)'
fi
if fn_exists "__git_ps1"; then

  PS1=$PS1"${darkwhite}${bgyellow}\$(__git_ps1 ' %s')"
  #NORMAL   master  test                                                                                                      sh  [unix]   19%   12:  1
fi
PS1=$PS1' \[\033[01;31m\]\[\033[00;32m\]\n\$\[\033[00m\] '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

if [ -d "$HOME/.node-completion" ]; then
  # {{{
  # Node Completion - Auto-generated, do not touch.
  shopt -s progcomp
  for f in $(command ls ~/.node-completion); do
    f="$HOME/.node-completion/$f"
    test -f "$f" && . "$f"
  done
  # }}}
fi

if [ `which brew 2> /dev/null` ] && [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export NVM_DIR="/Users/feoliveira/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# vim:ft=sh:

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
