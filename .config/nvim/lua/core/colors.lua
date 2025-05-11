--local colorscheme = 'cyberdream'
-- local colorscheme = "tokyonight-storm"
local colorscheme = 'catppuccin'

local function set_colorscheme()
  local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if not status_ok then
    vim.notify('Colorscheme ' .. colorscheme .. ' not found, using default', vim.log.levels.WARN)
    vim.cmd.colorscheme 'habamax' -- Fallback to built-in theme
  end
end

-- Call the function to set the colorscheme
set_colorscheme()

-- Any custom highlight modifications go here
-- (These will apply after the colorscheme is loaded)
local function set_highlights()
  -- Examples:
  -- vim.api.nvim_set_hl(0, 'LineNr', { fg = '#707070' })
end

set_highlights()

return {
  set_colorscheme = set_colorscheme,
  set_highlights = set_highlights,
}
