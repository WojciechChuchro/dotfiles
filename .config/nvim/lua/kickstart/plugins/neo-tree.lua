-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    {
      '<leader>z',
      function()
        if vim.bo.filetype ~= 'neo-tree' then
          vim.cmd 'Neotree close' -- Close Neo-tree if you're not focused on the Neo-tree window
        end
      end,
      desc = 'Close NeoTree if focused on a file',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered items (like dotfiles)
        hide_dotfiles = false, -- Do not hide dotfiles
        hide_gitignored = false, -- Optional: show gitignored files
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
