-- Markdown specific settings
local keymap = vim.keymap
local opt = vim.opt

opt.wrap = true -- Wrap text
opt.breakindent = true -- Match indent on line break
opt.linebreak = true -- Line break on whole words

-- Allow j/k when navigating wrapped lines
keymap.set("n", "j", "gj")
keymap.set("n", "k", "gk")

-- Spell check
opt.spelllang = 'en_us'
opt.spell = true
