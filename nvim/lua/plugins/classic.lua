return {
  {
    'mileszs/ack.vim',

    config = function()
      vim.g.ackprg = 'ag --vimgrep'
      vim.keymap.set('n', '<leader>a', ':Ack!<Space>', { noremap = true })
    end
  },
  { 'tpope/vim-endwise' },
  { 'tpope/vim-eunuch' },
  { 'tpope/vim-sleuth' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-unimpaired' }
}
