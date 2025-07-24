-- https://github.com/folke/which-key.nvim
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      mappings = false,
    },
    spec = {

      { '<leader>c', group = 'Code' },
      { '<leader>D', group = 'Document' },
      { '<leader>r', group = 'Rename' },
      { '<leader>s', group = 'Search' },
      { '<leader>w', group = 'Workspace' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>h', group = 'Git Hunk' },
      { '<leader>b', group = 'BBreakpoints' },
      { '<leader>d', group = 'Debugger' },
      { '<leader>x', group = 'Execute' },
    },
  },
}
