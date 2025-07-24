local set = vim.keymap.set

set('n', '<Esc>', '<cmd>nohlsearch<CR>')
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Quickfix listInstant' })

set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Uncomment these for moving windows (not just navigating), if your terminal supports Shift+Ctrl
set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

set('n', '<space>ex', '<cmd>source %<CR>', { desc = 'Execute whole file' })
set('n', '<space>el', ':.lua<CR>', { desc = 'Execute one line' })
set('v', '<space>es', ':lua<CR>', { desc = 'Execute selected lines' })
