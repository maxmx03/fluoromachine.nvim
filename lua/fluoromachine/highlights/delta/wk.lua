---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('WhichKey', { fg = c.red })
  hl('WhichKeyDesc', { fg = c.fg, italic = true })
  hl('WhichKeySeparator', { fg = c.pink })
  hl('WhichKeyGroup', { fg = c.green })
end

return M
