return {
  'github/copilot.vim',
  event = 'InsertEnter',
  config = function()
    -- Optional Copilot config here
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      noremap = true,
      desc = 'Copilot Accept Suggestion',
    })
  end,
}
