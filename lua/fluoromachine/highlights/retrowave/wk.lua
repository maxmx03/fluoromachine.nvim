---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  hl('WhichKey', { fg = c.pink })
  hl('WhichKeyFloat', { fg = c.fg, bg = c.bgdark }, { transparent = config.transparent })
  hl('WhichKeyDesc', { fg = c.fg, italic = true })
  hl('WhichKeySeparator', { fg = c.comment })
  hl('WhichKeyGroup', { fg = c.cyan })
end

return M
