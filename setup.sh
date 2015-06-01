git clone https://github.com/felipecvo/dotfiles.git ~/.dotfiles

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
brew install caskroom/cask/brew-cask

cd ~/.dotfiles

brew bundle
