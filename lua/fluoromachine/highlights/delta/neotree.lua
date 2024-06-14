---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('NeoTreeNormal', { fg = c.fg, bg = c.bgdark })
  hl('NeoTreeNormalNC', { link = 'NeoTreeNormal' })
  hl('NeoTreeDotFile', { fg = c.comment })
  hl('NeoTreeFileStats', { fg = c.comment })
  hl('NeoTreeIndentMarker', { fg = c.comment })
  hl('NeoTreeFileNameOpened', { link = 'Directory' })
  hl('NeoTreeFloatBorder', { link = 'WinSeparator' })
  hl('NeoTreeFloatTitle', { link = 'Title' })
  hl('NeoTreeGitAdded', { fg = c.git.add })
  hl('NeoTreeGitConflict', { fg = c.git.change })
  hl('NeoTreeGitDeleted', { fg = c.git.delete })
  hl('NeoTreeGitIgnored', { fg = c.comment })
  hl('NeoTreeGitModified', { fg = c.git.change })
  hl('NeoTreeGitUnstaged', { fg = c.git.change })
  hl('NeoTreeGitUntracked', { fg = c.git.change })
  hl('NeoTreeGitStaged', { fg = c.git.add })
end

return M
