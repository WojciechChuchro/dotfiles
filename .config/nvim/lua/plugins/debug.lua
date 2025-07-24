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

      vim.keymap.set('n', '<leader>bb', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = ' Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>bc', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<cr>", { desc = ' Conditional Breakpoint' })
      vim.keymap.set('n', '<leader>bl', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log: '))<cr>", { desc = '󰎠 Log Breakpoint' })
      vim.keymap.set('n', '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = '󰆴 Clear Breakpoints' })
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
