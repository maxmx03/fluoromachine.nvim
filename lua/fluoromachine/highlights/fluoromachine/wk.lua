---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('WhichKey', { fg = c.pink })
  hl('WhichKeyDesc', { fg = c.fg, italic = true })
  hl('WhichKeySeparator', { fg = c.comment })
  hl('WhichKeyGroup', { fg = c.yellow })
end

return M
