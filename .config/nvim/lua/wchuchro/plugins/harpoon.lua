return {
  -- https://github.com/ThePrimeagen/harpoon
  'ThePrimeagen/harpoon',
  branch = 'master',
  event = 'VeryLazy',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
  },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    tabline = true,
  },
  config = function()
    vim.opt.showtabline = 2

    -- Keymaps
    vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file)
    vim.keymap.set('n', '<C-e>', require('harpoon.ui').toggle_quick_menu)

    -- Your highlight customizations (these are correctly placed)
    vim.cmd 'highlight! HarpoonInactive guibg=NONE guifg=#63698c'
    vim.cmd 'highlight! HarpoonActive guibg=NONE guifg=white'
    vim.cmd 'highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7'
    vim.cmd 'highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7'
    vim.cmd 'highlight! TabLineFill guibg=NONE guifg=white'

    for i = 1, 9 do
      vim.keymap.set('n', '<C-' .. i .. '>', function()
        require('harpoon.ui').nav_file(i)
      end, { desc = 'Harpoon file ' .. i })
    end
  end,
}
