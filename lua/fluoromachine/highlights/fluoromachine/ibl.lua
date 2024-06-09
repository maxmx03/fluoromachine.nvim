---@type fm.highlights
local M = {}

M.load = function(opts)
  local darken = opts.color.darken
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('IblIndent', { fg = darken(c.purple, 20), nocombine = true })
  hl('IblScope', { fg = darken(c.pink, 10), nocombine = true })
end

return M
