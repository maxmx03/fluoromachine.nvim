---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local darken = opts.color.darken
  local c = opts.colors

  hl('NoiceFormatProgressTodo', { fg = c.green, bg = darken(c.green, 50) })
  hl('NoiceFormatProgressDone', { fg = c.yellow, reverse = true })
  hl('NoiceLspProgressSpinner', { fg = c.pink })
  hl('NoiceLspProgressClient', { fg = c.pink })
  hl('NoiceLspProgressTitle', { link = 'Title' })
end

return M
