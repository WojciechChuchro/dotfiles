return {
  -- https://github.com/mfussenegger/nvim-jdtls
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    -- test
    vim.keymap.set('n', '<leader>tc', function()
      if vim.bo.filetype == 'java' then
        require('jdtls').test_class()
      end
    end, { desc = 'Test class' })

    vim.keymap.set('n', '<leader>tm', function()
      if vim.bo.filetype == 'java' then
        require('jdtls').test_nearest_method()
      end
    end, { desc = 'Test nearest method' })
  end,
}
