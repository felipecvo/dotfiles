set guifont=Hack\ Nerd\ Font:h12
let g:netrw_browsex_viewer="open"

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set cursorline
set cursorcolumn
