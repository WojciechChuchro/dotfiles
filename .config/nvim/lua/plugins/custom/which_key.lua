-- https://github.com/folke/which-key.nvim
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      mappings = false,
    },
    spec = {

      { '<leader>c', group = '[C]ode' },
      { '<leader>D', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk' },
      { '<leader>b', group = '[B]Breakpoints' },
      { '<leader>d', group = '[D]ebugger' },
      { '<leader>x', group = 'E[x]ecute' },
    },
  },
}
