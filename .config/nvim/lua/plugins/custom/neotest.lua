return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'rcasia/neotest-java',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-java' {
          -- Optional configuration for neotest-java
          ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
          -- junit_jar will be auto-downloaded if not found
          junit_jar = nil, -- let neotest-java handle the path automatically
        },
      },

      -- General neotest configuration
      discovery = {
        enabled = true,
        concurrent = 1,
      },

      -- Customize output window
      output = {
        enabled = true,
        open_on_run = 'short', -- "short" | "long" | false
      },

      -- Quickfix settings
      quickfix = {
        enabled = true,
        open = false, -- open quickfix when tests fail
      },

      -- Status configuration
      status = {
        enabled = true,
        virtual_text = true,
        signs = true,
      },

      -- Icons for test results
      icons = {
        child_indent = '│',
        child_prefix = '├',
        collapsed = '─',
        expanded = '╮',
        failed = '✖',
        final_child_indent = ' ',
        final_child_prefix = '╰',
        non_collapsible = '─',
        passed = '✓',
        running = '⟳',
        running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
        skipped = '○',
        unknown = '?',
      },

      -- Floating window configuration
      floating = {
        border = 'rounded',
        max_height = 0.6,
        max_width = 0.6,
        options = {},
      },

      -- Summary window configuration
      summary = {
        enabled = true,
        animated = true,
        follow = true,
        expand_errors = true,
        mappings = {
          attach = 'a',
          clear_marked = 'M',
          clear_target = 'T',
          debug = 'd',
          debug_marked = 'D',
          expand = { '<CR>', '<2-LeftMouse>' },
          expand_all = 'e',
          jumpto = 'i',
          mark = 'm',
          next_failed = 'J',
          output = 'o',
          prev_failed = 'K',
          run = 'r',
          run_marked = 'R',
          short = 'O',
          stop = 'u',
          target = 't',
          watch = 'w',
        },
      },
    }
  end,
  keys = function()
    local neotest = require 'neotest'

    -- Test running keymaps
    vim.keymap.set('n', '<leader>tn', function()
      neotest.run.run()
    end, { desc = 'Run nearest test' })

    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Run current file tests' })

    vim.keymap.set('n', '<leader>ts', function()
      neotest.run.run { suite = true }
    end, { desc = 'Run test suite' })

    vim.keymap.set('n', '<leader>tl', function()
      neotest.run.run_last()
    end, { desc = 'Run last test' })

    -- Debug keymaps
    vim.keymap.set('n', '<leader>td', function()
      neotest.run.run { strategy = 'dap' }
    end, { desc = 'Debug nearest test' })

    vim.keymap.set('n', '<leader>tD', function()
      neotest.run.run { vim.fn.expand '%', strategy = 'dap' }
    end, { desc = 'Debug current file tests' })

    -- Test navigation
    vim.keymap.set('n', ']t', function()
      neotest.jump.next { status = 'failed' }
    end, { desc = 'Jump to next failed test' })

    vim.keymap.set('n', '[t', function()
      neotest.jump.prev { status = 'failed' }
    end, { desc = 'Jump to previous failed test' })

    -- Output and summary
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open { enter = true, auto_close = true }
    end, { desc = 'Show test output' })

    vim.keymap.set('n', '<leader>tO', function()
      neotest.output_panel.toggle()
    end, { desc = 'Toggle output panel' })

    vim.keymap.set('n', '<leader>tt', function()
      neotest.summary.toggle()
    end, { desc = 'Toggle test summary' })

    -- Stop running tests
    vim.keymap.set('n', '<leader>tS', function()
      neotest.run.stop()
    end, { desc = 'Stop running tests' })

    vim.keymap.set('n', '<leader>ta', function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = 'Run all tests in project' })
    -- Watch tests (useful for TDD)
    vim.keymap.set('n', '<leader>tw', function()
      neotest.watch.toggle(vim.fn.expand '%')
    end, { desc = 'Watch current file for changes' })

    -- Clear test results
    vim.keymap.set('n', '<leader>tc', function()
      neotest.run.stop()
      neotest.summary.close()
      neotest.output_panel.close()
    end, { desc = 'Clear and close all test windows' })

    -- Additional useful mappings
    vim.keymap.set('n', '<leader>tm', function()
      neotest.run.run { suite = false, extra_args = { '--update-snapshots' } }
    end, { desc = 'Run tests with modified args' })

    -- Show test status in statusline (optional)
    vim.keymap.set('n', '<leader>tq', function()
      local results = neotest.state.status_counts(vim.fn.expand '%')
      if results then
        print(string.format('Tests: %d passed, %d failed, %d skipped', results.passed or 0, results.failed or 0, results.skipped or 0))
      else
        print 'No test results available'
      end
    end, { desc = 'Show test status counts' })
  end,
}
