return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {
    style = "moon", -- styles: storm night moon
  },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd("colorscheme tokyonight")
  end
}
