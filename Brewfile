# tap 'homebrew/cask-cask'
# tap 'homebrew/versions'
tap 'homebrew/cask-fonts'
tap 'linuxbrew/fonts'
tap 'heroku/brew'
# tap 'd12frosted/emacs-plus'

def mac?
  /darwin/ =~ RUBY_PLATFORM
end

# essential
brew 'git'
brew 'vim'
brew 'zsh'
brew 'tmux'
brew 'asdf'
# brew 'rbenv'
# brew 'ruby-build'
# brew 'rbspy'
# brew 'postgresql'
brew 'mas' if mac?
brew 'lima' if mac?
# brew 'emacs-plus'
brew 'starship'

# brew 'node'
# brew 'packer'
brew 'terraform'

####brew 'python3'

# modern unix
brew 'bat'
brew 'lsd'
brew 'git-delta'
brew 'ripgrep'
brew 'ag'
brew 'tldr'
brew 'glances'
brew 'curlie'
brew 'jq'

# tools
brew 'awscli'
brew 'heroku'
brew 'kubectl'
brew 'minikube'
brew 'helm'

# brew 'tmuxinator'

#brew 'graphviz'
#brew 'httpie'

# brew 'ctags'
# brew 'jmeter'

# brew 'golang'
#brew 'python'
#brew 'bash-completion'
#brew 'maven'
#brew 'ack'
#brew 'wget'
#brew 'tig'
#brew 'gpg'
#brew 'gnupg'
#brew 'gpg-agent'
#brew 'pinentry-mac'

# cask 'arduino'
#cask 'atom'
#cask 'calibre'
#cask 'firefox'
#cask 'grammarly'
#cask 'insomnia'
#cask 'limechat'
#cask 'lingo'
#cask 'mockplus'
#cask 'notational-velocity'
#cask 'rowanj-gitx'
#cask 'sketch'
#cask 'skype'
#cask 'vlc'
#cask 'zeplin'
# cask 'anydo'
cask 'alacritty'
# cask 'android-studio'
cask 'authy'
# cask 'boostnote'
# cask 'docker'
# cask 'dropbox'
# cask 'emacs'
# cask 'evernote'
# cask 'google-chrome'
# cask 'google-cloud-sdk'
# cask 'google-drive'
# cask 'iterm2'
# cask 'macvim'
# cask 'notion'
# cask 'oracle-jdk'
cask 'postman'
# cask 'pritunl'
# cask 'psequel'
# cask 'slack'
# cask 'spectacle'
# cask 'spotify'

# Fonts
# cask 'font-source-code-pro'
# cask 'font-inconsolata'
# cask 'font-inconsolata-for-powerline'
# cask 'font-devicons'
# cask 'font-lato'
# cask 'font-hack-nerd-font'
# cask 'font-roboto'
# cask 'font-roboto-slab'

if mac?
  mas 'Keynote', id: 409183694
  mas 'Microsoft OneNote', id: 784801555
  mas 'Microsoft Remote Desktop 10', id: 1295203466
  mas 'Amphetamine', id: 937984704
  mas 'Slack', id: 803453959
  mas 'Any.do To-do list & Calendar', id: 944960179
  mas 'Evernote', id: 406056744
  mas 'MindNode – Mind Map & Outline', id: 1289197285
  mas 'LastPass Password Manager', id: 926036361
end

# vi: ft=ruby
