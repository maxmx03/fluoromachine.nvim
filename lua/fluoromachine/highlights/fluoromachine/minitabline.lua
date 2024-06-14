---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken
  local percentage = 25

  hl('MiniTablineCurrent', { fg = c.fg, bg = c.bg })
  hl('MiniTablineVisible', { fg = c.fg, bg = c.bg })
  hl('MiniTablineHidden', { fg = c.comment, bg = c.bg })
  hl('MiniTablineModifiedCurrent', { link = 'MiniTabLineCurrent' })
  hl('MiniTablineModifiedVisible', { link = 'MiniTablineVisible' })
  hl('MiniTablineModifiedHidden', { link = 'MiniTablineHidden' })
  hl('MiniTablineFill', { fg = c.fg, bg = darken(c.bg, percentage) })
  hl('MiniTablineTabpagesection', { fg = c.fg, bg = darken(c.bg, percentage) })
end

return M
