---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('GitSignsAdd', { fg = c.git.add })
  hl('GitSignsChange', { fg = c.git.change })
  hl('GitSignsDelete', { fg = c.git.delete })
end

return M
