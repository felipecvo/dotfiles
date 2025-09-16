return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  -- dependencies = {
  --   'RRethy/nvim-treesitter-endwise'
  -- },

  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "elixir",
        "javascript",
        "typescript",
        "html",
        "rust",
        "go",
        "norg",
        "hcl",
        "tsx",
        "toml",
        "css",
      },
      sync_install = false,
      highlight = {
        enable = true,
        disable = { 'ruby' },
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    })
  end
}
