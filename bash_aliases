alias env='env | sort'

if [ `uname` = 'Linux' ]; then
  alias ls='ls --color=auto'
  alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'

alias psg='ps -ef | grep -v grep | grep'

alias sqlplus='rlwrap sqlplus'

alias rehash='source ~/.bash_profile'
alias vihost='sudo vim /etc/hosts'
alias visshconfig='vim ~/.ssh/config'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# vim:ft=sh:
