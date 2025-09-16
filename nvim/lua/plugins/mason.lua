return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
      "williamboman/mason.nvim",
    },

    config = function()
      require("mason-lspconfig").setup({
        -- ensure_installed = { "lua_ls" "tsserver" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local lspconfig = require('lspconfig')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      lspconfig.ts_ls.setup{
        capabilities = capabilities
      }
    end
  },
}
