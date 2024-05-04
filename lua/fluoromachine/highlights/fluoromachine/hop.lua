---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken

  hl('HopNextKey', { fg = c.pink })
  hl('HopNextKey1', { fg = c.cyan })
  hl('HopNextKey2', { fg = darken(c.cyan, 20) })
  hl('HopUnmatched', { fg = c.comment })
end

return M
