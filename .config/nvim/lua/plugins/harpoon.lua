return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function(_, opts)
    local harpoon = require 'harpoon'
    harpoon:setup(opts)
  end,

  keys = function()
    local keys = {
      {
        '<leader>H',
        function()
          require('harpoon'):list():add()
          vim.cmd 'redrawtabline' -- Refresh tabline after adding
        end,
        desc = 'Harpoon File',
      },
      {
        '<C-e>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    }

    -- Add Ctrl+1-9 mappings
    for i = 1, 9 do
      table.insert(keys, {
        '<C-' .. i .. '>',
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end

    -- Add Ctrl+0 for 10th file
    table.insert(keys, {
      '<C-0>',
      function()
        require('harpoon'):list():select(10)
      end,
      desc = 'Harpoon to File 10',
    })

    return keys
  end,
}
