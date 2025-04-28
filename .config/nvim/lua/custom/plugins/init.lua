return {
  {
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

      -- Navigation keymaps
      vim.keymap.set('n', '<leader>1', function()
        require('harpoon.ui').nav_file(1)
      end)
      vim.keymap.set('n', '<leader>2', function()
        require('harpoon.ui').nav_file(2)
      end)
      vim.keymap.set('n', '<leader>3', function()
        require('harpoon.ui').nav_file(3)
      end)
      vim.keymap.set('n', '<leader>4', function()
        require('harpoon.ui').nav_file(4)
      end)
      vim.keymap.set('n', '<leader>5', function()
        require('harpoon.ui').nav_file(5)
      end)
      vim.keymap.set('n', '<leader>6', function()
        require('harpoon.ui').nav_file(6)
      end)
      vim.keymap.set('n', '<leader>7', function()
        require('harpoon.ui').nav_file(7)
      end)
      vim.keymap.set('n', '<leader>8', function()
        require('harpoon.ui').nav_file(8)
      end)
      vim.keymap.set('n', '<leader>9', function()
        require('harpoon.ui').nav_file(9)
      end)
    end,
  },
  {
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
  },
}
