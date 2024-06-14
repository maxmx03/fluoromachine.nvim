---@type fm.highlights
local M = {}

M.load = function(opts)
  local darken = opts.color.darken
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('IblIndent', { fg = c.editor.currentline, nocombine = true })
  hl('IblScope', { fg = darken(c.green, 50), nocombine = true })
end

return M
