---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local c = opts.colors

    hl('illuminatedWord', { bg = c.editor.selection })
    hl('illuminatedCurWord', { link = 'illuminatedWord' })
    hl('IlluminatedWordText', { link = 'illuminatedWord' })
    hl('IlluminatedWordRead', { link = 'illuminatedWord' })
    hl('IlluminatedWordWrite', { link = 'illuminatedWord' })
  end,
}

return M
