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
}
