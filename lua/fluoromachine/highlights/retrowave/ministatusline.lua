---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local blend = opts.color.blend
  local alpha = 0.2

  hl('MiniStatuslineModeNormal', { fg = c.bg, bg = c.cyan })
  hl('MiniStatuslineModeInsert', { fg = c.bg, bg = c.green })
  hl('MiniStatuslineModeVisual', { fg = c.bg, bg = c.purple })
  hl('MiniStatuslineModeReplace', { fg = c.red, bg = c.bg })
  hl('MiniStatuslineModeCommand', { fg = c.orange, bg = c.bg })
  hl('MinistatusLineFileName', {
    fg = c.fg,
    bg = c.bgdark,
  })
  hl('MiniStatuslineDevinfo', {
    fg = c.fg,
    bg = c.editor.selection,
  })
  hl('MiniStatuslineFileinfo', {
    fg = c.fg,
    bg = c.editor.selection,
  })
  hl('MiniStatuslineInactive', { fg = c.comment, bg = c.bg })
end

return M
