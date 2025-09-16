return {
  {
    'joeveiga/ng.nvim',
    config = function()
      require'lspconfig'.angularls.setup{}
      local ng = require("ng")

      local opts = { noremap = true, silent = true }
      -- vim.keymap.set("n", "<leader>l", ":Git<CR>")
      vim.keymap.set("n", "<leader>l", ng.goto_template_for_component, opts)
      vim.keymap.set("n", "<leader>oc", ng.goto_component_with_template_file, opts)
      vim.keymap.set("n", "<leader>oT", ng.get_template_tcb, opts)
    end
  },
}
