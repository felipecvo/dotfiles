filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'scrooloose/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'

Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-repeat'

" Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}

" vim on steroids
Plugin 'tpope/vim-unimpaired'

" " puppet
" Plugin 'godlygeek/tabular'
" Plugin 'rodjek/vim-puppet'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
" Plugin 'muz/vim-gemfile'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rbenv'
Plugin 'noprompt/vim-yardoc'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'idanarye/vim-merginal'

" javascript
Plugin 'pangloss/vim-javascript'
" Plugin 'moll/vim-node'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'vim-scripts/npm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'akz92/vim-angular2'
Plugin 'quramy/vim-js-pretty-template'
Plugin 'mhartington/vim-angular2-snippets'

" Plugin 'rhysd/vim-grammarous'

Plugin 'hashivim/vim-terraform'

" colorscheme
Plugin 'altercation/vim-colors-solarized'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'jpo/vim-railscasts-theme'
Plugin 'joshdick/onedark.vim'
" jellybeans

Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-dadbod'

Plugin 'aklt/plantuml-syntax'

call vundle#end()
filetype plugin indent on
