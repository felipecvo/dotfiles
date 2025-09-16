vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.optshiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.list = true
vim.opt.listchars = {
  tab = " »",
  trail = "·",
}

vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { noremap = true, silent = true })
-- vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
