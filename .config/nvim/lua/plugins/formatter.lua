return {
  -- https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require("conform").setup({
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports' },
      sql = { 'pg_format' },
      python = { 'isort', 'black' },
      javascript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescript = { 'prettier' },
      json = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      yaml = { 'prettier' },
      java = { 'google-java-format' },
    },
    formatters = {
      ['google-java-format'] = {
        command = 'google-java-format',
        args = { '--aosp', '-' }, -- Use AOSP style for 4-space indentation
      },
    },
    })

    vim.keymap.set('n', '<leader>cf', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, { desc = 'Format buffer' })
  end,
}
