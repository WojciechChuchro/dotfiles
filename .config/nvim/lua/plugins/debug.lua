-- debug.lua
return {
  -- Virtual text for DAP
  {
    'theHamsta/nvim-dap-virtual-text',
    lazy = true,
    opts = {
      commented = true,
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
          return ' = ' .. variable.value
        else
          return variable.name .. ' = ' .. variable.value
        end
      end,
    },
  },

  -- DAP UI
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-telescope/telescope-dap.nvim',
    },
    opts = {
      controls = {
        element = 'repl',
        enabled = false,
        icons = {
          disconnect = '',
          pause = '',
          play = '',
          run_last = '',
          step_back = '',
          step_into = '',
          step_out = '',
          step_over = '',
          terminate = '',
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = 'single',
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = '',
        current_frame = '',
        expanded = '',
      },
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.50 },
            { id = 'stacks', size = 0.30 },
            { id = 'watches', size = 0.10 },
            { id = 'breakpoints', size = 0.10 },
          },
          size = 40,
          position = 'left',
        },
        {
          elements = { 'repl', 'console' },
          size = 10,
          position = 'bottom',
        },
      },
      mappings = {
        edit = 'e',
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        repl = 'r',
        toggle = 't',
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    },
    config = function(_, opts)
      local dap = require 'dap'
      require('dapui').setup(opts)

      -- Highlight groups for breakpoints and stopped line
      vim.api.nvim_set_hl(0, 'DapStoppedHl', { fg = '#98BB6C', bg = '#2A2A2A', bold = true })
      vim.api.nvim_set_hl(0, 'DapStoppedLineHl', { bg = '#204028', bold = true })

      -- Define DAP signs
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStoppedHl', linehl = 'DapStoppedLineHl' })
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticSignWarn' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignError' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo' })

      -- vim.keymap.set('n', '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = 'Dap Frames' })
      -- vim.keymap.set('n', '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = 'Dap Help' })
      -- vim.keymap.set('n', '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = ' Breakpoint List' })
      -- Auto open/close dapui
      dap.listeners.after.event_initialized['dapui_config'] = function()
        require('dapui').open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        -- Commented to prevent UI auto-close
        -- require('dapui').close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        -- Commented to prevent UI auto-close
        -- require('dapui').close()
      end

      -- Java DAP configurations (customize `mainClass`)
      dap.configurations.java = {
        {
          name = 'Debug Launch (2GB)',
          type = 'java',
          request = 'launch',
          vmArgs = '-Xmx2g ',
        },
        {
          name = 'Debug Attach (8000)',
          type = 'java',
          request = 'attach',
          hostName = '127.0.0.1',
          port = 8000,
        },
        {
          name = 'Debug Attach (5005)',
          type = 'java',
          request = 'attach',
          hostName = '127.0.0.1',
          port = 5005,
        },
        {
          name = 'My Custom Java Run Configuration',
          type = 'java',
          request = 'launch',
          mainClass = 'replace.with.your.fully.qualified.MainClass',
          vmArgs = '-Xmx2g ',
        },
      }
    end,
  },
}
