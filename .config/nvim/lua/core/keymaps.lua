-- This allows users to quickly remove search highlighting
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- <leader>q opens the location list with current diagnostics
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal mode escape
-- Pressing <Esc><Esc> in terminal mode exits to normal mode
-- More intuitive than <C-\><C-n>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- Easier split window navigation using Ctrl + hjkl
-- These mappings allow fast movement between Vim splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Uncomment these for moving windows (not just navigating), if your terminal supports Shift+Ctrl
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Auto command: Highlight text when yanked (copied)
-- Adds a brief visual indication when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<leader>th', ':Hardtime toggle<CR>', { noremap = true, silent = true, desc = 'Toggle Hardtime' })
vim.keymap.set('n', '<leader>tp', ':Precognition toggle<CR>', { noremap = true, silent = true, desc = 'Toggle Precognition' })

vim.keymap.set('n', '<leader>nd', ':NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })
