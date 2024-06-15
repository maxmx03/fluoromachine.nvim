---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  hl('WhichKey', { fg = c.red })
  hl('WhichKeyFloat', { fg = c.fg, bg = c.bgdark }, { transparent = config.transparent })
  hl('WhichKeyDesc', { fg = c.fg, italic = true })
  hl('WhichKeySeparator', { fg = c.pink })
  hl('WhichKeyGroup', { fg = c.green })
end

return M
