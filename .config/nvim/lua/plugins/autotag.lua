return {
  -- https://github.com/windwp/nvim-ts-autotag
  'windwp/nvim-ts-autotag',
  event = 'InsertEnter',

  -- https://github.com/nvim-treesitter/nvim-treesitter
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        html = {
          enable_close = false,
        },
      },
    }
  end,
}
