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

-- test
vim.keymap.set('n', '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class()
  end
end)

vim.keymap.set('n', '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method()
  end
end)
vim.keymap.set('n', '<leader>nd', ':NoiceDismiss<CR>', { desc = 'Dismiss Noice Message' })

-- debugging
vim.keymap.set('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = ' Toggle Breakpoint' })
vim.keymap.set('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<cr>", { desc = ' Conditional Breakpoint' })
vim.keymap.set('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log: '))<cr>", { desc = '󰎠 Log Breakpoint' })
vim.keymap.set('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = '󰆴 Clear Breakpoints' })
vim.keymap.set('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = ' Breakpoint List' })
vim.keymap.set('n', '<leader>dc', "<cmd>lua require'dap'.continue()<cr>", { desc = ' Continue' })
vim.keymap.set('n', '<leader>dj', "<cmd>lua require'dap'.step_over()<cr>", { desc = ' Step Over' })
vim.keymap.set('n', '<leader>dk', "<cmd>lua require'dap'.step_into()<cr>", { desc = ' Step Into' })
vim.keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_out()<cr>", { desc = ' Step Out' })
vim.keymap.set('n', '<leader>dt', function()
  require('dap').terminate()
  require('dapui').close()
end, { desc = ' Terminate Debugger' })
vim.keymap.set('n', '<leader>dd', function()
  require('dap').disconnect()
  require('dapui').close()
end, { desc = 'Close' })
vim.keymap.set('n', '<leader>dr', "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = 'Repl Toggle' })
vim.keymap.set('n', '<leader>dl', "<cmd>lua require'dap'.run_last()<cr>", { desc = 'Run Last' })
vim.keymap.set('n', '<leader>di', function()
  require('dap.ui.widgets').hover()
end, { desc = 'Hover Widgets' })
vim.keymap.set('n', '<leader>d?', function()
  local widgets = require 'dap.ui.widgets'
  widgets.centered_float(widgets.scopes)
end, { desc = 'Centered Float' })
vim.keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = 'Dap Frames' })
vim.keymap.set('n', '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = 'Dap Help' })
vim.keymap.set('n', '<leader>de', function()
  require('telescope.builtin').diagnostics { default_text = ':E:' }
end)
