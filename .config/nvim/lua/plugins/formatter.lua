return {
  -- https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
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
        ['pg_format'] = {
          command = 'pg_format',
          args = {
            '--spaces',
            '2', -- Number of spaces for indentation (default: 4)
            '--maxlength',
            '120', -- Maximum line length (default: 79)
            '--comma-break', -- Add line break after comma in SELECT
            '--wrap-after',
            '3', -- Wrap after N items in SELECT
            '--no-extra-line', -- Remove extra blank lines
            '--keyword-case',
            '2', -- Keywords: 0=no change, 1=lowercase, 2=uppercase
            '--function-case',
            '1', -- Functions: 0=no change, 1=lowercase, 2=uppercase
          },
          stdin = true,
        },
      },
    }

    vim.keymap.set('n', '<leader>cf', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, { desc = 'Format buffer' })
  end,
}
