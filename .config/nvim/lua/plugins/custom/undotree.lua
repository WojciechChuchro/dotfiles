return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1
    -- Optional keymap
    vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>', { desc = 'Toggle Undotree' })
  end,
}
