---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local darken = opts.color.darken
    local c = opts.colors

    hl('NoiceFormatProgressTodo', { fg = c.yellow, bg = darken(c.yellow, 50) })
    hl('NoiceFormatProgressDone', { fg = c.yellow, reverse = true })
    hl('NoiceLspProgressSpinner', { fg = c.purple })
    hl('NoiceLspProgressClient', { fg = c.purple })
    hl('NoiceLspProgressTitle', { link = 'Title' })
  end,
}

return M
