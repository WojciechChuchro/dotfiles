-- Neo-tree is a Neovim plugin to browse the file system

return {
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  enabled = false,
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    -- https://github.com/nvim-lua/plenary.nvim
    'nvim-lua/plenary.nvim',
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
    -- https://github.com/MunifTanjim/nui.nvim
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show all filtered items in the tree
        hide_dotfiles = false, -- Show dotfiles (e.g., .git, .env)
        hide_gitignored = false, -- Show files ignored by .gitignore
      },
      window = {
        position = 'right', -- <<< Move Neo-tree to the right side
        width = 40, -- Width of the file explorer window
        mappings = {
          ['\\'] = 'close_window', -- Use '\' to close Neo-tree
          ['<space>'] = 'toggle_node', -- Expand/collapse folder
          ['l'] = 'open', -- Open file/folder
          ['h'] = 'close_node', -- Collapse folder
          ['E'] = function(state)
            local node = state.tree:get_node()
            require('neo-tree.sources.filesystem.commands').expand_all_nodes(state, node)
          end,
          ['C'] = function(state)
            local renderer = require 'neo-tree.ui.renderer'
            for _, node in ipairs(state.tree.nodes) do
              if node.type == 'directory' and node:is_expanded() then
                renderer.collapse_node(state, node)
              end
            end
          end,
        },
      },
      follow_current_file = {
        enabled = true, -- Automatically focus on the file in the buffer
        leave_dirs_open = true, -- Keep parent dirs open
      },
    },

    default_component_configs = {
      indent = {
        with_markers = true, -- Show folder indent markers
        indent_size = 2,
      },
    },
  },
}
