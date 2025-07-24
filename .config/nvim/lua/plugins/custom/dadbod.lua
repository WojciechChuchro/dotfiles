return {
  -- https://github.com/tpope/vim-dadbod
  'tpope/vim-dadbod',

  -- https://github.com/kristijanhusak/vim-dadbod-completion
  'kristijanhusak/vim-dadbod-completion',

  -- https://github.com/kristijanhusak/vim-dadbod-ui
  {
    'kristijanhusak/vim-dadbod-ui',
    config = function()
      vim.g.db_ui_execute_on_save = 0
    end,
  },
}
