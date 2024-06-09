---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

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
