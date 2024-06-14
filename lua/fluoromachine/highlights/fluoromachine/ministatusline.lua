---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local blend = opts.color.blend
  local alpha = 0.2

  hl('MiniStatuslineModeNormal', { fg = c.bg, bg = c.purple })
  hl('MiniStatuslineModeInsert', { fg = c.bg, bg = c.green })
  hl('MiniStatuslineModeVisual', { fg = c.bg, bg = c.yellow })
  hl('MiniStatuslineModeReplace', { fg = c.bg, bg = c.red })
  hl('MiniStatuslineModeCommand', { fg = c.bg, bg = c.orange })
  hl('MinistatusLineFileName', {
    bg = c.bg,
    fg = c.purple,
  })
  hl('MiniStatuslineDevinfo', {
    bg = blend(c.purple, c.bg, alpha),
    fg = c.purple,
  })
  hl('MiniStatuslineFileinfo', {
    bg = blend(c.purple, c.bg, alpha),
    fg = c.purple,
  })
  hl('MiniStatuslineInactive', { fg = c.comment, bg = c.bg })
end

return M
