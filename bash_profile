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

PS1='\[\033[00;32m\][\u\[\033[0;31m\]@\[\033[01;32m\]\h:\[\033[01;31m\]\w'
if [ -s "$HOME/.rvm/bin/rvm-prompt" ] && fn_exists "__rvm_ps1"; then
  PS1=$PS1'\[\033[0;36m\]$(__rvm_ps1)'
fi
if [ `which rbenv` ] && fn_exists "__rbenv_ps1"; then
  PS1=$PS1'\[\033[0;36m\]$(__rbenv_ps1)'
fi
if fn_exists "__git_ps1"; then
  PS1=$PS1'\[\033[01;33m\]$(__git_ps1 " %s")'
fi
PS1=$PS1'\[\033[00;32m\]]\n\$\[\033[00m\] '

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

# vim:ft=sh:
