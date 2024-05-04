---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken
  local blend = opts.color.blend
  local alpha = 0.2
  local percentage = 25

  -- MiniCursor
  hl('MiniCursorword', { bg = c.editor.selection })

  -- MiniStatusLine
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

  -- MiniTabLine
  hl('MiniTablineCurrent', { fg = c.fg, bg = c.bg })
  hl('MiniTablineVisible', { fg = c.fg, bg = c.bg })
  hl('MiniTablineHidden', { fg = c.comment, bg = c.bg })
  hl('MiniTablineModifiedCurrent', { link = 'MiniTabLineCurrent' })
  hl('MiniTablineModifiedVisible', { link = 'MiniTablineVisible' })
  hl('MiniTablineModifiedHidden', { link = 'MiniTablineHidden' })
  hl('MiniTablineFill', { fg = c.fg, bg = darken(c.bg, percentage) })
  hl('MiniTablineTabpagesection', { fg = c.fg, bg = darken(c.bg, percentage) })

  -- MiniStarter
  hl('MiniStarterCurrent', { link = 'CursorLine' })
  hl('MiniStarterHeader', { fg = c.red })
  hl('MiniStarterFooter', { fg = c.comment })
  hl('MiniStarterItem', { fg = c.fg })
  hl('MiniStarterItemBullet', { fg = c.yellow })
  hl('MiniStarterItemPrefix', { fg = c.yellow })
  hl('MiniStarterSection', { link = 'Title' })
  hl('MiniStarterQuery', { fg = c.red, bold = true })
end

return M
