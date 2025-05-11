return {
  {
    'scottmckendry/cyberdream.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('cyberdream').setup {}
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('tokyonight').setup {
        styles = {},
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        transparent_background = false,
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          mason = true,
        },
      }
    end,
  },
}
