filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'wincent/Command-T'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" puppet
Plugin 'godlygeek/tabular'
Plugin 'rodjek/vim-puppet'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'muz/vim-gemfile'

" git
Plugin 'tpope/vim-fugitive'

" javascript
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/npm.vim'

" colorscheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on
