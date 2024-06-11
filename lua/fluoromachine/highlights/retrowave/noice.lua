---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local darken = opts.color.darken
  local c = opts.colors

  hl('NoiceFormatProgressTodo', { fg = c.cyan, bg = darken(c.yellow, 50) })
  hl('NoiceFormatProgressDone', { fg = c.cyan, reverse = true })
  hl('NoiceLspProgressSpinner', { fg = c.red })
  hl('NoiceLspProgressClient', { fg = c.red })
  hl('NoiceLspProgressTitle', { link = 'Title' })
end

return M
