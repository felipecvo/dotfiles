source /usr/local/git/contrib/completion/git-completion.bash

if [ -s "$HOME/.rvm/bin/rvm-prompt" ]; then
  __rvm_ps1()
  {
    local r=`~/.rvm/bin/rvm-prompt`
    if [ -n "$r" ]; then
      printf " $r"
    fi
  }
fi

fn_exists()
{
  type $1 2>/dev/null | grep -q 'is a function'
}

PS1='\[\033[00;32m\][\u\[\033[0;31m\]@\[\033[01;32m\]\h:\[\033[01;31m\]\w'
if fn_exists "__rvm_ps1"; then
  PS1=$PS1'\[\033[0;36m\]$(__rvm_ps1)'
fi
if fn_exists "__git_ps1"; then
  PS1=$PS1'\[\033[01;33m\]$(__git_ps1 " %s")'
fi
PS1=$PS1'\[\033[00;32m\]]\n\$\[\033[00m\] '

[[ -s "$HOME/.bash_exports" ]] && . "$HOME/.bash_exports"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# vim:ft=sh:
