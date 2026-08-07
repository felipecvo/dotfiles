-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    -- "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    -- tailwindcss is already enabled via mason-lspconfig + vim.lsp.enable
    -- (see plugins/mason.lua); don't let tailwind-tools set up its own
    -- client through the deprecated require('lspconfig') API.
    server = {
      override = false,
    },
  },
}
