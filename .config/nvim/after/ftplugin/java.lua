vim.bo.tabstop = 4
vim.opt.shiftwidth = 4
local home = os.getenv 'HOME'
local workspace_path = home .. '/.local/share/nvim/jdtls-workspace/'
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = workspace_path .. project_name

local bundles = {
  vim.fn.glob(home .. '/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/.local/share/nvim/mason/share/java-test/*.jar', 1), '\n'))

local status, jdtls = pcall(require, 'jdtls')
if not status then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',
    '-javaagent:' .. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
    '-jar',
    vim.fn.glob(home .. '/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar'),
    '-configuration',
    home .. '/.local/share/nvim/mason/packages/jdtls/config_mac',
    '-data',
    workspace_dir,
  },
  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = extendedClientCapabilities,
      maven = {
        downloadSources = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all',
        },
      },
      format = {
        enabled = false,
      },
      completion = {
        favoriteStaticMembers = {
          'org.assertj.core.api.Assertions.*',
          'org.junit.jupiter.api.Assertions.*',
          'org.junit.Assert.*',
          'org.mockito.Mockito.*',
          'org.mockito.ArgumentMatchers.*',
          'org.mockito.Answers.*',
          'org.mockito.BDDMockito.*',
          'java.util.UUID.randomUUID',
          'java.util.Collections.*',
          'java.util.Arrays.*',
          'java.lang.Math.*',
          'java.time.LocalDateTime.*',
          'java.time.LocalDate.*',
        },
        filteredTypes = {
          'com.sun.*',
          'io.micrometer.shaded.*',
          'java.awt.*',
          'jdk.*',
          'sun.*',
        },
        guessMethodArguments = true,
        maxResults = 0,
        importOrder = {
          'java',
          'javax',
          'org',
          'com',
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      -- Add content assist settings
      contentProvider = { preferred = 'fernflower' },
      -- Ensure proper classpath resolution
      project = {
        referencedLibraries = {
          'lib/**/*.jar',
          '**/target/dependency/*.jar',
        },
      },
    },
  },
  init_options = {
    bundles = bundles,
    extendedClientCapabilities = extendedClientCapabilities,
  },
}

require('jdtls').start_or_attach(config)

-- Key mappings
vim.keymap.set('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
vim.keymap.set('v', '<leader>cv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
vim.keymap.set('n', '<leader>cr', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>cc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
vim.keymap.set('v', '<leader>cm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })

-- Additional helpful keymaps for imports
vim.keymap.set('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code Action' })
vim.keymap.set('n', '<leader>ci', "<Cmd>lua require('jdtls').organize_imports()<CR>", { desc = 'Add Missing Imports' })
