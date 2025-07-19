return {
  -- https://github.com/scottmckendry/cyberdream.nvim
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    require('tokyonight').setup {
      style = 'night',
    }
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
