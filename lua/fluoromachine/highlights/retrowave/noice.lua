---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  hl('NoiceFormatProgressTodo', { fg = c.cyan, bg = c.bgdark })
  hl('NoiceFormatProgressDone', { fg = c.cyan, reverse = true })
  hl('NoiceLspProgressSpinner', { fg = c.red })
  hl('NoiceLspProgressClient', { fg = c.red })
  hl('NoiceLspProgressTitle', { fg = c.yellow, bold = config.glow }, { glow = config.glow })
end

return M
