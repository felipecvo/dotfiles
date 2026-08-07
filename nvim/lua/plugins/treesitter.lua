return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- required for Neovim >= 0.12; `master` only supports <= 0.11
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local languages = {
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
    }

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })
    require("nvim-treesitter").install(languages)

    -- terraform files use the hcl parser but aren't ft==hcl
    vim.treesitter.language.register("hcl", "terraform")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "lua",
        "vim",
        "help", -- vimdoc
        "query",
        "elixir",
        "javascript",
        "typescript",
        "typescriptreact", -- tsx
        "html",
        "rust",
        "go",
        "norg",
        "hcl",
        "terraform",
        "toml",
        "css",
      },
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
