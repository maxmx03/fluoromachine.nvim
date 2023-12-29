---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local c = opts.colors
    local darken = opts.color.darken

    -- MiniCursor
    hl('MiniCursorword', { bg = c.editor.selection })

    -- MiniStatusLine
    hl('MiniStatuslineModeNormal', { fg = c.bg, bg = c.purple })
    hl('MiniStatuslineModeInsert', { fg = c.bg, bg = c.green })
    hl('MiniStatuslineModeVisual', { fg = c.bg, bg = c.yellow })
    hl('MiniStatuslineModeReplace', { fg = c.bg, bg = c.red })
    hl('MiniStatuslineModeCommand', { fg = c.bg, bg = c.orange })
    hl('MinistatusLineFileName', { fg = c.fg, bg = c.bgdark })
    hl('MiniStatuslineDevinfo', { fg = c.bg, bg = c.comment })
    hl('MiniStatuslineFileinfo', { fg = c.bg, bg = c.comment })
    hl('MiniStatuslineInactive', { fg = c.comment, bg = c.bg })

    -- MiniTabLine
    hl('MiniTablineCurrent', { fg = c.fg, bg = c.bg })
    hl('MiniTablineVisible', { fg = c.fg, bg = c.bg })
    hl('MiniTablineHidden', { fg = c.comment, bg = c.bg })
    hl('MiniTablineModifiedCurrent', { link = 'MiniTabLineCurrent' })
    hl('MiniTablineModifiedVisible', { link = 'MiniTablineVisible' })
    hl('MiniTablineModifiedHidden', { link = 'MiniTablineHidden' })
    hl('MiniTablineFill', { fg = c.fg, bg = darken(c.bg, 25) })
    hl('MiniTablineTabpagesection', { fg = c.fg, bg = darken(c.bg, 25) })

    -- MiniStarter
    hl('MiniStarterCurrent', { link = 'CursorLine' })
    hl('MiniStarterHeader', { fg = c.red })
    hl('MiniStarterFooter', { fg = c.comment })
    hl('MiniStarterItem', { fg = c.fg })
    hl('MiniStarterItemBullet', { fg = c.yellow })
    hl('MiniStarterItemPrefix', { fg = c.yellow })
    hl('MiniStarterSection', { link = 'Title' })
    hl('MiniStarterQuery', { fg = c.red, bold = true })
  end,
}

return M
