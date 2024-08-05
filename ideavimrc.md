# Ideavimrc Key Mapping Guide

**Nmap** - Normal Mode Mapping:
Assigns a key combination to perform a specified action when in normal mode. Normal mode is the default mode where you
can execute editor commands.
Example: `nmap <F2> :w<cr>` maps the F2 key to save the current file in normal mode.

**vmap** - Visual Mode Mapping:
Maps keys to perform actions in visual mode, where a text can be selected and manipulated.
Example: `vmap <F2> :w<cr>` would save the file while some text is selected.

**xmap** - Visual Mode Mapping (specific to visual selection):
Similar to vmap, but applies specifically to visual mode selections, not to visual line or block modes.
Example: `xmap <F2> :w<cr>` would only work when a text is selected in visual mode (not line or block).

**imap** - Insert Mode Mapping:
Defines key mappings for actions while in insert mode.
Example: `imap jk <Esc>` allows pressing `jk` in insert mode to exit back to normal mode.

**omap** - Operator Pending Mode Mapping:
Maps keys to actions that follow an operator (like `d` for delete) in operator pending mode.
Example: `omap h ^` would map the `h` key to jump to the beginning of the line after an operator command.

**cmap** - Command Mode Mapping:
Defines mappings for commands entered in command mode.
Example: `cmap wq wq!<cr>` would map `wq` to `wq!`, forcing a quit without prompting for unsaved changes.

**nnoremap** - Non-Recursive Normal Mode Mapping:
Similar to nmap, but non-recursive, meaning it won't trigger other mappings. Useful to avoid unexpected behavior if
mappings call each other.
Example: `nnoremap <F2> :w<cr>` ensures that F2 only performs the specified save command in normal mode without
triggering other mappings.

**vnoremap** - Non-Recursive Visual Mode Mapping:
Same as vmap, but non-recursive, preventing the trigger of other visual mode mappings.
Example: `vnoremap <F2> :w<cr>` ensures the F2 key saves the file in visual mode without causing any other mappings to
execute.

**xnoremap** - Non-Recursive Visual Selection Mode Mapping:
Non-recursive mappings specific to visual mode selections.
Example: `xnoremap <F2> :w<cr>` guarantees that F2 will save the file only in selected visual mode without other
mappings executing.

**inoremap** - Non-Recursive Insert Mode Mapping:
Like imap but non-recursive. It defines actions in insert mode that will not trigger additional mappings.
Example: `inoremap jk <Esc>` ensures `jk` quickly exits insert mode to normal mode, without a recursion.

### General Vim Settings

- **set scrolloff=5**:
  Sets the minimum number of lines to keep above and below the cursor, improving readability and context while
  scrolling.

- **set surround**:
  Enables the ability to change, delete, and add surroundings like parentheses, brackets, quotes, XML tags, etc., with
  ease.

- **set easymotion**:
  Enables the EasyMotion plugin in Vim, which provides a faster way to move around with search targets highlighted on
  the screen.

- **set ideajoin**:
  Configures Vim to use the IdeaVim plugin's `join` functionality, enhancing the capabilities of text manipulation
  and editing.

## Table of Key Mappings

### JetBrains NERDTree [GitHub](https://github.com/JetBrains/ideavim/wiki/NERDTree-support)

| Key     | Description                                            | Map Setting                    |
|---------|--------------------------------------------------------|--------------------------------|
| `o`     | Open files, directories, and bookmarks                 | `g:NERDTreeMapActivateNode`    |
| `go`    | Open selected file, but leave cursor in the NERDTree   | `g:NERDTreeMapPreview`         |
| `t`     | Open selected node/bookmark in a new tab               | `g:NERDTreeMapOpenInTab`       |
| `T`     | Same as 't' but keep the focus on the current tab      | `g:NERDTreeMapOpenInTabSilent` |
| `i`     | Open selected file in a split window                   | `g:NERDTreeMapOpenSplit`       |
| `gi`    | Same as `i`, but leave the cursor on the NERDTree      | `g:NERDTreeMapPreviewSplit`    |
| `s`     | Open selected file in a new vertical split             | `g:NERDTreeMapOpenVSplit`      |
| `gs`    | Same as `s`, but leave the cursor on the NERDTree      | `g:NERDTreeMapPreviewVSplit`   |
| `O`     | Recursively open the selected directory                | `g:NERDTreeMapOpenRecursively` |
| `x`     | Close the current node's parent                        | `g:NERDTreeMapCloseDir`        |
| `X`     | Recursively close all children of the current node     | `g:NERDTreeMapCloseChildren`   |
| `P`     | Jump to the root node                                  | `g:NERDTreeMapJumpRoot`        |
| `p`     | Jump to current node's parent                          | `g:NERDTreeMapJumpParent`      |
| `K`     | Jump up inside directories at the current tree depth   | `g:NERDTreeMapJumpFirstChild`  |
| `J`     | Jump down inside directories at the current tree depth | `g:NERDTreeMapJumpLastChild`   |
| `<C-J>` | Jump down to next sibling of the current directory     | `g:NERDTreeMapJumpNextSibling` |
| `<C-K>` | Jump up to previous sibling of the current directory   | `g:NERDTreeMapJumpPrevSibling` |
| `r`     | Recursively refresh the current directory              | `g:NERDTreeMapRefresh`         |
| `R`     | Recursively refresh the current root                   | `g:NERDTreeMapRefreshRoot`     |
| `m`     | Display the NERDTree menu                              | `g:NERDTreeMapMenu`            |
| `q`     | Close the NERDTree window                              | `g:NERDTreeMapQuit`            |
| `A`     | Zoom (maximize/minimize) the NERDTree window           | `g:NERDTreeMapToggleZoom`      |
| `d`     | Delete file or directory                               | `g:NERDTreeMapDelete`          |
| `n`     | Create File                                            | `g:NERDTreeMapNewFile`         |
| `N`     | Create Directory                                       | `g:NERDTreeMapNewDir`          |

### Usefully

| Key     | Description                                 | Command                                  |
|---------|---------------------------------------------|------------------------------------------|
| `jk`    | Exit visual mode                            | `imap jk <Esc>`                          |
| `<C-d>` | Scroll down                                 | `nnoremap <C-d> <C-d>zz`                 |
| `<C-u>` | Scroll up                                   | `nnoremap <C-u> <C-u>zz`                 |
| **zc**  | Collapses the current code region or block. | `nnoremap zc :action CollapseRegion<cr>` |
| **zo**  | Expands the collapsed code region or block. | `nnoremap zo :action ExpandRegion<cr>`   |

### Actions

| Key     | Description             | Command                             |
|---------|-------------------------|-------------------------------------|
| `[[`    | Move to previous method | `nmap [[ <Action>(MethodUp)`        |
| `]]`    | Move to next method     | `nmap ]] <Action>(MethodDown)`      |
| `gh`    | Show hover information  | `nmap gh <Action>(ShowHoverInfo)`   |
| `<C-j>` | Move current line down  | `nmap <C-j> <Action>(MoveLineDown)` |
| `<C-k>` | Move current line up    | `nmap <C-k> <Action>(MoveLineUp)`   |

### Git

| Key          | Description     | Command                                          |
|--------------|-----------------|--------------------------------------------------|
| `<leader>vp` | Push changes    | `nmap <leader>vp :action Vcs.Push<cr>`           |
| `<leader>vc` | Checkin project | `nmap <leader>vc :action Vcs.CheckinProject<cr>` |
| `<leader>vu` | Update project  | `nmap <leader>vu :action Vcs.UpdateProject<cr>`  |
| `<leader>vB` | Git Branches    | `nmap <leader>vB :action Git.Branches<cr>`       |

### Navigation

### File

| Key          | Description          | Command                                             |
|--------------|----------------------|-----------------------------------------------------|
| `<leader>fs` | Go to symbol         | `nnoremap <Space>fs :action GotoSymbol<cr>`         |
| `<leader>fa` | Go to action         | `nnoremap <Space>fa :action GotoAction<cr>`         |
| `<leader>ff` | Go to file           | `noremap <Space>ff :action GotoFile<cr>`            |
| `<leader>ft` | Go to test           | `noremap <Space>ft :action GotoTest<cr>`            |
| `<leader>fe` | Search everywhere    | `noremap <Space>fe :action SearchEverywhere<cr>`    |
| `<leader>fp` | Find in path         | `noremap <Space>fp :action FindInPath<cr>`          |
| `<leader>ne` | Go to next error     | `noremap <Space>ne :action GotoNextError<cr>`       |
| `<leader>rF` | Recent changed files | `noremap <Space>rF :action RecentChangedFiles<cr>`  |
| `<leader>rf` | Recent files         | `noremap <Space>rf :action RecentFiles<cr>`         |
| `<leader>fs` | File structure popup | `nnoremap <Space>fs :action FileStructurePopup<cr>` |
| `<S-h>`      | Previous tab         | `nnoremap <S-h> :action PreviousTab<cr>`            |
| `<S-l>`      | Next tab             | `nnoremap <S-l> :action NextTab<cr>`                |

### Refactor

| Key          | Description                                                           | Command                                                   |
|--------------|-----------------------------------------------------------------------|-----------------------------------------------------------|
| `<leader>rc` | Reformat code                                                         | `nnoremap <Space>rc :action ReformatCode<cr>`             |
| `<leader>sw` | Surround with                                                         | `nnoremap <Leader>sw :action SurroundWith<cr>`            |
| `<leader>oi` | Optimize imports                                                      | `nnoremap <Leader>oi :action OptimizeImports<cr>`         |
| `<leader>tz` | Toggle zen mode                                                       | `nnoremap <Leader>tz :action ToggleZenMode<cr>`           |
| `<leader>ns` | New scratch file                                                      | `nnoremap <leader>ns :action NewScratchFile<cr>`          |
| `<leader>ic` | Inspect code                                                          | `nnoremap <Leader>ic :action InspectCode<cr>`             |
| `<leader>re` | Rename element                                                        | `noremap <Space>re :action RenameElement<cr> """`         |
| `<leader>iv` | Introduce Variable: Extracts selected expression into a new variable. | `noremap <leader>iv :action IntroduceVariable<cr>`        |
| `<leader>em` | Extract Method: Creates a new method from selected code block.        | `noremap <leader>em :action ExtractMethod<cr>`            |
| `<leader>ic` | Introduce Constant: Refactors selected literal into a named constant. | `noremap <leader>ic :action IntroduceConstant<cr>`        |
| `<leader>ip` | Introduce Parameter: Introduces a new parameter for a function.       | `noremap <leader>ip :action IntroduceParameter<cr>`       |
| `<leader>if` | Introduce Field: Introduces a new field in a class.                   | `noremap <leader>if :action IntroduceField<cr>`           |
| `<leader>po` | Introduce Parameter Object: Extracts parameters into an object.       | `noremap <leader>po :action IntroduceParameterObject<cr>` |
| `<leader>rc` | Reformat code: Reformats the current file or selection.               | `nnoremap <Space>rc :action ReformatCode<cr>`             |

### Window Management

| Key          | Description          | Command                                                               |
|--------------|----------------------|-----------------------------------------------------------------------|
| `<leader>wd` | Close current window | `nnoremap <Space>wd :action CloseContent<cr>` " Delete Current Window |
| `<leader>wD` | Close all windows    | `nnoremap <Space>wD :action CloseAllEditors<cr>` " Delete All Windows |
| `<leader>sv` | Split vertically     | `nnoremap <Space>sv :action SplitVertically<cr>`                      |
| `<leader>sh` | Split horizontally   | `nnoremap <Space>sh :action SplitHorizontally<cr>`                    |
