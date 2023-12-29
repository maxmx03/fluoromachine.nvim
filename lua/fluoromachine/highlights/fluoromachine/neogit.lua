---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local c = opts.colors
    local darken = opts.color.darken
    local percentage = 40

    hl('NeogitCursorLine', { link = 'CursorLine' })
    hl('NeogitBranch', { fg = c.red })
    hl('NeogitRemote', { fg = c.orange })
    hl('NeogitHunkHeader', { fg = c.yellow, bg = darken(c.yellow, percentage) })
    hl('NeogitHunkHeaderHighlight', { link = 'Title' })
    hl('NeogitDiffContextHighlight', { fg = c.fg, bg = c.bg })
    hl('NeogitDiffContext', { fg = c.fg, bg = c.bgdark })
    hl(
      'NeogitDiffDeleteHighlight',
      { fg = c.git.delete, bg = darken(c.git.delete, percentage) }
    )
    hl('NeogitDiffDelete', { fg = c.git.delete })
    hl(
      'NeogitDiffAddHighlight',
      { fg = c.git.add, bg = darken(c.git.add, percentage) }
    )
    hl('NeogitDiffAdd', { fg = c.git.add })
  end,
}

return M
