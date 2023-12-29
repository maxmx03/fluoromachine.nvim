---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local c = opts.colors

    hl('NeoTreeNormal', { fg = c.fg, bg = c.bgdark })
    hl('NeoTreeNormalNC', { link = 'NeoTreeNormal' })
    hl('NeoTreeEndOfBuffer', { fg = c.bgdark })
    hl('NeoTreeRootName', { link = 'Directory' })
    hl('NeoTreeFileName', { fg = c.fg })
    hl('NeoTreeFileNameOpened', { link = 'Directory' })
    hl('NeoTreeFloatBorder', { link = 'WinSeparator' })
    hl('NeoTreeFloatTitle', { link = 'Title' })
    hl('NeoTreeGitAdded', { fg = c.git.add, bg = 'NONE' })
    hl('NeoTreeGitConflict', { fg = c.git.change })
    hl('NeoTreeGitDeleted', { fg = c.git.delete })
    hl('NeoTreeGitIgnored', { fg = c.comment, italic = true })
    hl('NeoTreeGitModified', { fg = c.git.change })
    hl('NeoTreeGitUnstaged', { fg = c.git.change })
    hl('NeoTreeGitUntracked', { fg = c.git.change })
    hl('NeoTreeGitStaged', { fg = c.git.add })
    hl('NeoTreeIndentMarker', { fg = c.comment })
  end,
}

return M
