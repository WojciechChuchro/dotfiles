return {
  -- https://github.com/mfussenegger/nvim-dap
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local nvim_dap_virtual_text = require("nvim-dap-virtual-text")

    dapui.setup()
    nvim_dap_virtual_text.setup({})

    -- Highlight groups for breakpoints and stopped line
    vim.api.nvim_set_hl(0, 'DapStoppedHl', { fg = '#98BB6C', bg = '#2A2A2A', bold = true })
    vim.api.nvim_set_hl(0, 'DapStoppedLineHl', { bg = '#204028', bold = true })

    -- breakpoints ui
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStoppedHl', linehl = 'DapStoppedLineHl' })
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.keymap.set('n', '<leader>bb', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>bc', function()
      dap.set_breakpoint(vim.fn.input 'Condition: ')
    end, { desc = 'Conditional Breakpoint' })
    vim.keymap.set('n', '<leader>bl', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log: ')
    end, { desc = 'Log Breakpoint' })
    vim.keymap.set('n', '<leader>br', dap.clear_breakpoints, { desc = 'Reset Breakpoints' })

    vim.keymap.set('n', '<F1>', dap.continue)
    vim.keymap.set('n', '<F2>', dap.step_into)
    vim.keymap.set('n', '<F3>', dap.step_over)
    vim.keymap.set('n', '<F4>', dap.step_out)
    vim.keymap.set('n', '<F5>', dap.step_back)
    vim.keymap.set('n', '<F6>', dap.restart)
    vim.keymap.set('n', '<F7>', dap.run_to_cursor)

    vim.keymap.set('n', '<leader>dt', function()
      dap.terminate()
      dapui.close()
    end, { desc = ' Terminate Debugger' })
    vim.keymap.set('n', '<leader>dd', function()
      dap.disconnect()
      dapui.close()
    end, { desc = 'Close' })
    vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = 'Run Last' })

    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Repl Toggle' })
    vim.keymap.set('n', '<leader>di', function()
      require('dap.ui.widgets').hover()
    end, { desc = 'Hover Widgets' })
    vim.keymap.set('n', '<leader>d?', function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = 'Centered Float' })

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
