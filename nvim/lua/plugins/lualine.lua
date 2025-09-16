return {
  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {
          -- {
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
            color = { fg = "#ff9e64" },
          },
          -- {
          --   require("noice").api.status.mode.get,
          --   cond = require("noice").api.status.mode.has,
          --   color = { fg = "#ff9e64" },
          -- },
          -- {
          --   require("noice").api.status.search.get,
          --   cond = require("noice").api.status.search.has,
          --   color = { fg = "#ff9e64" },
          -- },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'%f %m'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            symbols = {
              modified = ' ●',
              alternate_file = '󰮲 ',
              directory =  '',
            }
          }
        },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
