vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>wq", ":wq<CR>", {desc = "Save and quit file"}) -- save and quit
keymap.set("n", "<leader>qq", ":q!<CR>", {desc = "Quit without saving"}) -- quit without saving
keymap.set("n", "<leader>ww", ":w<CR>", {desc = "Save file"}) -- save
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", {desc = "Open URL under cursor"}) -- open URL under cursor
-- Clear search highlights mapping
keymap.set("n", "<leader>nn", ":nohlsearch<CR>", { desc = "Clear search highlights" })


-- Vim REST Console 
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", {desc = "Run REST query"}) -- Run REST query

-- GIT
-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", {desc = "Put diff from current to other during diff"}) -- put diff from current to other during diff
keymap.set("n", "<leader>cj", ":diffget 1<CR>", {desc = "Get diff from left (local) during merge"}) -- get diff from left (local) during merge
keymap.set("n", "<leader>ck", ":diffget 3<CR>", {desc = "Get diff from right (remote) during merge"}) -- get diff from right (remote) during merge
keymap.set("n", "<leader>cn", "]c", {desc = "Next diff hunk"}) -- next diff hunk
keymap.set("n", "<leader>cp", "[c", {desc = "Previous diff hunk"}) -- previous diff hunk

-- Diff View
keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", {desc = "Previous diff hunk"}) -- previous diff hunk
keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", {desc = "Previous diff hunk"}) -- previous diff hunk

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", {desc = "Toggle git blame"}) -- toggle git blame

-- neo Git 
keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>", { desc = "Open neogit menu" })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", {desc = "Open quickfix list"}) -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>", {desc = "Jump to first quickfix list item"}) -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>", {desc = "Jump to next quickfix list item"}) -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>", {desc = "Jump to previous quickfix list item"}) -- jump to previous quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>", {desc = "Jump to last quickfix list item"}) -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>", {desc = "Close quickfix list"}) -- close quickfix list

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {desc = "Toggle file explorer"}) -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", {desc = "Toggle focus to file explorer"}) -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", {desc = "Find file in file explorer"}) -- find file in file explorer
keymap.set(
    "n",
    "<leader>ef",
    "<cmd>NvimTreeFindFileToggle<CR>",
    { desc = "Toggle file explorer on current file" }
) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- Telescope
keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, {desc = "Find files"})
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {desc = "Live grep"})
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({default_text=":method:"}) end, {desc = "Find treesitter method"})
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, {desc = "Harpoon add file"})
keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, {desc = "Harpoon toggle quick menu"})
keymap.set("n", "<leader>1", function() require("harpoon.ui").nav_file(1) end, {desc = "Harpoon navigate to file 1"})
keymap.set("n", "<leader>2", function() require("harpoon.ui").nav_file(2) end, {desc = "Harpoon navigate to file 2"})
keymap.set("n", "<leader>3", function() require("harpoon.ui").nav_file(3) end, {desc = "Harpoon navigate to file 3"})
keymap.set("n", "<leader>4", function() require("harpoon.ui").nav_file(4) end, {desc = "Harpoon navigate to file 4"})
keymap.set("n", "<leader>5", function() require("harpoon.ui").nav_file(5) end, {desc = "Harpoon navigate to file 5"})
--substitute TODO: What is this doing??
-- local substitute = require("substitute")
-- keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
-- keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
-- keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
-- keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
-- Trouble
keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', { desc = "Open trouble workspace diagnostics" })
keymap.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = "Open trouble document diagnostics" })
keymap.set('n', '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', { desc = "Open trouble quickfix list" })
keymap.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', { desc = "Open trouble location list" })
keymap.set('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>', { desc = "Open todos in trouble" })
-- LSP
keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = "LSP definition"})
keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {desc = "LSP code action"})
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {desc = "LSP references"})
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {desc = "LSP implementation"})

keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>', {desc = "LSP hover"})
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {desc = "LSP declaration"})
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {desc = "LSP type definition"})
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {desc = "LSP signature help"})
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', {desc = "LSP rename"})
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', {desc = "LSP format"})
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', {desc = "LSP format selected"})
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', {desc = "LSP diagnostics float"})
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {desc = "LSP previous diagnostic"})
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {desc = "LSP next diagnostic"})
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {desc = "LSP document symbol"})
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>', {desc = "LSP completion"})

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
keymap.set("n", "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>")
keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>")
keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>')
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>")
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>")
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>")
keymap.set("n", '<leader>dd', function() require('dap').disconnect(); require('dapui').close(); end)
keymap.set("n", '<leader>dt', function() require('dap').terminate(); require('dapui').close(); end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end)
keymap.set("n", '<leader>d?', function() local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes) end)
keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>')
keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>')
keymap.set("n", '<leader>de', function() require('telescope.builtin').diagnostics({default_text=":E:"}) end)

-- Filetype-specific keymaps (these can be done in the ftplugin directory instead if you prefer)
keymap.set("n", '<leader>oi', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').organize_imports();
  end
end, {desc ="Organize imports"})

keymap.set("n", '<leader>gu', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').update_projects_config();
  end
end, {desc ="Update projects config"})

keymap.set("n", '<leader>tc', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_class();
  end
end, {desc ="Test class"})

keymap.set("n", '<leader>tm', function()
  if vim.bo.filetype == 'java' then
    require('jdtls').test_nearest_method();
  end
end, {desc ="Test method"})

-- todo-comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" })

-- WARNING: 
-- what is this doing here? do i really need those keymaps?
keymap.set("n", "<leader>l", function()
    require("lint").try_lint()
end, { desc = "Trigger linting for current file" })
-- Split window management
-- keymap.set("n", "<leader>sv", "<C-w>v", {desc = "Split window vertically"}) -- split window vertically
-- keymap.set("n", "<leader>sh", "<C-w>s", {desc = "Split window horizontally"}) -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=", {desc = "Make split windows equal width"}) -- make split windows equal width
-- keymap.set("n", "<leader>sx", ":close<CR>", {desc = "Close split window"}) -- close split window
-- keymap.set("n", "<leader>sj", "<C-w>-", {desc = "Make split window height shorter"}) -- make split window height shorter
-- keymap.set("n", "<leader>sk", "<C-w>+", {desc = "Make split windows height taller"}) -- make split windows height taller
-- keymap.set("n", "<leader>sl", "<C-w>>5", {desc = "Make split windows width bigger"}) -- make split windows width bigger 
-- keymap.set("n", "<leader>sh", "<C-w><5", {desc = "Make split windows width smaller"}) -- make split windows width smaller

-- Tab management
-- keymap.set("n", "<leader>to", ":tabnew<CR>", {desc = "Open a new tab"}) -- open a new tab
-- keymap.set("n", "<leader>tx", ":tabclose<CR>", {desc = "Close current tab"}) -- close a tab
-- keymap.set("n", "<leader>tn", ":tabn<CR>", {desc = "Next tab"}) -- next tab
-- keymap.set("n", "<leader>tp", ":tabp<CR>", {desc = "Previous tab"}) -- previous tab
