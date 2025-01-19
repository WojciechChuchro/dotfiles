# Neovim Plugin Setup

This README provides an overview of the plugins currently installed in my Neovim configuration.
Each plugin is briefly described to help you understand its purpose and functionality.

## Loaded Plugins

- **lazy.nvim**: A plugin loader that helps to optimize Neovim startup time by loading plugins only when necessary.

### Appearance

- **dressing.nvim**: Provides improved UI components for Neovim, such as better input and select dialogs, enhancing the overall user interface experience.
- **git-blame.nvim**: Displays git blame information at the end of the current line, making it easy to see who made changes and when.
- **indent-blankline.nvim**: Adds indentation guides to all lines (including empty ones), making code structure clearer and more readable.
- **kanagawa.nvim**: A Neovim colorscheme inspired by Japanese art, providing a visually pleasing coding environment.
- **lualine.nvim**: A fast and easy-to-configure statusline plugin for Neovim, offering a variety of customizable components.
- **cmp**: Extension that provides autocomplete

### LSP

- **fidget.nvim**: A plugin that shows LSP progress in a minimal, unobtrusive way, helping you keep track of background processes.
- **cmp-nvim-lsp**: Completion source for nvim-cmp that provides LSP completion, enhancing your coding efficiency with language server protocol support.
- **lsp-progress.nvim**: Integrates with lualine to display LSP progress, providing a visual indication of LSP activities in the status line.
- **mason-lspconfig.nvim**: Bridges Mason and nvim-lspconfig, allowing for automatic installation of LSP servers.
- **nvim-lspconfig**: A collection of common configurations for Neovim’s built-in LSP client, making it easier to set up language servers.

### Navigation

- **harpoon**: A tool for quick file navigation and project management, allowing you to mark and jump between important files easily.
- **telescope-dap.nvim**: Extends Telescope.nvim with DAP integration, enabling fuzzy finding for debugging sessions.
- **telescope-fzf-native.nvim**: FZF sorter for Telescope written in C, providing fast and efficient sorting.
- **telescope.nvim**: A highly extendable fuzzy finder over lists, making it easy to search and navigate files, buffers, and more.
- **vim-tmux-navigator**: Seamlessly navigates between Neovim and tmux splits, improving workflow efficiency.

### Utils

- **diffview.nvim**: A plugin for viewing git diffs in Neovim, offering a side-by-side view of changes for better version control management.
- **mason-tool-installer.nvim**: Automates the installation of various development tools managed by Mason, simplifying setup and maintenance.
- **mason.nvim**: A package manager for Neovim, designed to manage LSP servers, DAP servers, linters, and formatters.
- **mini.nvim**: A collection of small, independent modules that enhance Neovim functionality, such as improved motion, surround, and more.
- **neodev.nvim**: Provides enhanced Neovim configuration support for the Neovim Lua development environment.
- **neogit**: A Magit-inspired Git interface for Neovim, offering a comprehensive set of Git integration features within the editor.
- **nvim-dap**: Debug Adapter Protocol client implementation for Neovim, enabling debugging capabilities.
- **nvim-dap-ui**: A UI for nvim-dap, providing visual elements to make debugging more intuitive and user-friendly.
- **nvim-dap-virtual-text**: Displays virtual text for debugging information, helping to visualize variable values and other debugging data inline.
- **nvim-nio**: Adds asynchronous job and process management capabilities to Neovim, improving performance for background tasks.
- **nvim-surround**: A plugin to easily manipulate surroundings (parentheses, brackets, quotes, etc.) in Neovim, streamlining text editing.
- **nvim-tree.lua**: A file explorer tree for Neovim written in Lua, providing a familiar and powerful file management interface.
- **nvim-treesitter**: Uses Tree-sitter for better syntax highlighting and code understanding, providing a more accurate and performant experience.
- **nvim-ts-autotag**: Autotags for nvim-treesitter, automatically closing and renaming HTML/XML tags.
- **nvim-web-devicons**: Provides file type icons for Neovim plugins such as nvim-tree.lua and lualine, enhancing the visual appearance.
- **plenary.nvim**: A library of Lua functions used by various Neovim plugins, providing essential utilities for plugin development.
- **quickfixdd**: Enhances the quickfix window in Neovim, adding more features and improving usability.
- **render-markdown**: Improves the rendering of Markdown files in Neovim, offering better syntax highlighting and formatting.
- **vim-commentary**: Simplifies the process of commenting and uncommenting code in Neovim, supporting multiple languages.
- **vim-maximizer**: Maximizes and restores the current window in Neovim, helping to focus on a single file.
- **vim-rest-console**: A plugin for sending HTTP requests and viewing responses directly in Neovim, useful for API testing and development.
- **which-key.nvim**: Displays available keybindings in a popup, helping you learn and remember shortcuts.
- **diffview.nvim**: Shows difference between your files in one place.

## Not Loaded Plugins

- **bigfile.nvim**: Optimizes performance for handling large files in Neovim, loaded only when needed.
- **cmp-buffer**: Buffer completion source for nvim-cmp, providing word completion from the current buffer.
- **cmp-cmdline**: Command line completion source for nvim-cmp, enhancing command-line editing.
- **cmp-path**: Path completion source for nvim-cmp, aiding in file path completion.
- **cmp_luasnip**: LuaSnip completion source for nvim-cmp, integrating snippet completions.
- **friendly-snippets**: A set of preconfigured snippets for different languages, used with snippet plugins like LuaSnip.
- **LuaSnip**: A snippet engine for Neovim written in Lua, providing a powerful and flexible way to manage snippets.
- **nvim-autopairs**: Automatically inserts matching pairs of characters, like brackets and quotes, in Neovim.
- **nvim-cmp**: A completion plugin for Neovim written in Lua, providing an extensible completion framework.
- **nvim-lint**: A linter plugin for Neovim, running configured linters on the current buffer.
- **substitute.nvim**: Provides enhanced substitution capabilities in Neovim, offering more flexible and powerful text replacements.
- **vim-be-good.nvim**: Game to train vim skill

These plugins enhance Neovim's functionality, making it a powerful and versatile text editor for various development needs.

surround
Old text Command New text

---

    surr*ound_words             ysiw)           (surround_words)
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
