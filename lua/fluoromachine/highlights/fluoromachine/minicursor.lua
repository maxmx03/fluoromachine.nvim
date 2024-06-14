---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('MiniCursorword', { bg = c.editor.selection })
end

return M
