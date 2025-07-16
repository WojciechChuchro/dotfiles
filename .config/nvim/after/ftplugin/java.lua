-- ftplugin/java.lua
-- Enhanced JDTLS setup for Java files

-- Only attach to Java files
if vim.bo.filetype ~= 'java' then
  return
end

local jdtls = require 'jdtls'
local home = os.getenv 'HOME'
local mason_registry = require 'mason-registry'
local jdtls_path = mason_registry.get_package('jdtls'):get_install_path()

-- Find root directory (usually the maven or gradle project root)
local root_markers = { 'mvnw', 'gradlew', 'pom.xml', 'build.gradle', '.git', 'build.gradle.kts' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if not root_dir then
  root_dir = vim.fn.getcwd()
end

local project_name = vim.fn.fnamemodify(root_dir, ':p:h:t')
local workspace_dir = home .. '/.cache/jdtls/workspace/' .. project_name

-- Get the mason jdtls launcher jar location
local path_to_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
if #path_to_jar == 0 then
  path_to_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar', 1, 1)[1]
end

-- Properly handle macOS configuration path
local config_path
if vim.fn.has 'mac' == 1 then
  config_path = jdtls_path .. '/config_mac'
elseif vim.fn.has 'unix' == 1 then
  config_path = jdtls_path .. '/config_linux'
else
  config_path = jdtls_path .. '/config_win'
end

-- Explicitly use Java 21 installation
local java_cmd = '/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home/bin/java'
-- Fallback to java in PATH if the specific path doesn't exist
if vim.fn.executable(java_cmd) ~= 1 then
  print 'Specified Java path not found, falling back to system Java'
  java_cmd = 'java'
end

-- Command that starts the language server
local cmd = {
  java_cmd,
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
  '-jar',
  path_to_jar,
  '-configuration',
  config_path,
  '-data',
  workspace_dir,
}

-- Include bundles from the classpath
local bundles = {}

-- Capabilities and settings
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup configuration
local config = {
  cmd = cmd,
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      completion = {
        favoriteStaticMembers = {
          'org.hamcrest.MatcherAssert.assertThat',
          'org.hamcrest.Matchers.*',
          'org.junit.Assert.*',
          'java.util.Objects.requireNonNull',
          'java.util.Objects.requireNonNullElse',
        },
        filteredTypes = {
          'com.sun.*',
          'io.micrometer.shaded.*',
          'java.awt.*',
          'jdk.*',
          'sun.*',
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          -- Specify Java 21 runtime
          { name = 'JavaSE-21', path = '/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home' },
          -- Add fallbacks for project requirements
          { name = 'JavaSE-17', path = '/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home' }, -- For backwards compatibility
        },
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = 'all', -- literals, all, none
        },
      },
      format = {
        enabled = true,
      },
    },
  },
  capabilities = capabilities,
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = bundles,
  },
}

-- Start the JDTLS server
jdtls.start_or_attach(config)

-- Setup additional Java-specific key mappings
-- These enhance what you already have globally
local opts = { noremap = true, silent = true, buffer = vim.api.nvim_get_current_buf() }
vim.keymap.set('n', '<A-o>', jdtls.organize_imports, { buffer = vim.api.nvim_get_current_buf(), desc = 'Organize Imports' })
vim.keymap.set('n', '<leader>df', jdtls.test_class, { buffer = vim.api.nvim_get_current_buf(), desc = 'Test Class' })
vim.keymap.set('n', '<leader>dn', jdtls.test_nearest_method, { buffer = vim.api.nvim_get_current_buf(), desc = 'Test Nearest Method' })
vim.keymap.set('n', 'crv', jdtls.extract_variable, { buffer = vim.api.nvim_get_current_buf(), desc = 'Extract Variable' })
vim.keymap.set('v', 'crv', function()
  jdtls.extract_variable(true)
end, { buffer = vim.api.nvim_get_current_buf(), desc = 'Extract Variable' })
vim.keymap.set('n', 'crc', jdtls.extract_constant, { buffer = vim.api.nvim_get_current_buf(), desc = 'Extract Constant' })
vim.keymap.set('v', 'crc', function()
  jdtls.extract_constant(true)
end, { buffer = vim.api.nvim_get_current_buf(), desc = 'Extract Constant' })
vim.keymap.set('v', 'crm', function()
  jdtls.extract_method(true)
end, { buffer = vim.api.nvim_get_current_buf(), desc = 'Extract Method' })
