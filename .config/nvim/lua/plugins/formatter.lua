return {
  -- https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    vim.keymap.set('n', '<leader>f', function()
      require('conform').format { async = true, lsp_format = 'fallback' }
    end, { desc = 'Format buffer' })
  end,
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
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
  },
}
