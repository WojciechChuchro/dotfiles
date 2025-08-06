return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup({})
  end,

  keys = function()
    local harpoon = require 'harpoon'
    local keys = {
      {
        '<leader>H',
        function()
          harpoon:list():add()
        end,
        desc = 'Harpoon File',
      },
      {
        '<C-e>',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Quick Menu',
      },
    }

    for i = 1, 9 do
      table.insert(keys, {
        '<C-' .. i .. '>',
        function()
          harpoon:list():select(i)
        end,
        desc = 'Harpoon to File ' .. i,
      })
    end

    table.insert(keys, {
      '<C-0>',
      function()
        harpoon:list():select(10)
      end,
      desc = 'Harpoon to File 10',
    })

    return keys
  end,
}
