return {
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  dependencies = {
    -- https://github.com/mason-org/mason.nvim
    { 'williamboman/mason.nvim', opts = {} },
    -- https://github.com/mason-org/mason-lspconfig.nvim
    'williamboman/mason-lspconfig.nvim',
    -- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },
    -- https://github.com/hrsh7th/cmp-nvim-lsp
    'hrsh7th/cmp-nvim-lsp', -- Allows extra capabilities provided by nvim-cmp
  },
  config = function()
    -- Function that gets run when an LSP attaches to a particular buffer.
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Key mappings for LSP features
        -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('<leader>ti', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, '[T]oggle [I]nlay Hints')
        map('<leader>tv', function()
          local config = vim.diagnostic.config()
          vim.diagnostic.config {
            virtual_text = not config.virtual_text,
          }
        end, '[T]oggle [V]irtual Text diagnostics')
        -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        -- map('<leader>Ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        --map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- Additional client and method support configurations
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- Highlight references when the cursor holds on a word
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- Diagnostic Configuration
    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    -- Create a client with additional capabilities from nvim-cmp
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- Configure LSP servers
    local servers = {
      kotlin_language_server = {},
      gopls = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim', 'Snacks' } },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    -- Ensure the servers are installed
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'typescript-language-server',
      'ast_grep',
      'goimports',
      'sqls',
      'jdtls',
      'java-debug-adapter',
      'java-test',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          if server_name == 'jdtls' then
            return -- Do NOT setup jdtls here, it's handled manually in ftplugin/java.lua
          end
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
