return {
  { 'tpope/vim-rails' },
  {
    'vim-ruby/vim-ruby',

    config = function()
      vim.g.ruby_indent_assignment_style = 'variable'
    end
  },
  { 'thoughtbot/vim-rspec' },
  { 'tpope/vim-bundler' }
}
