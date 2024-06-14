---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken

  hl('HopNextKey', { fg = c.pink })
  hl('HopNextKey1', { fg = c.green })
  hl('HopNextKey2', { fg = darken(c.green, 30) })
  hl('HopUnmatched', { fg = c.comment })
end

return M
