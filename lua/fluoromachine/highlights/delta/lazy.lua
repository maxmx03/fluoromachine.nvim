---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local blend = opts.color.blend

  hl('LazyButton', {
    fg = c.fg,
    bg = c.editor.selection,
  })
  hl('LazyButtonActive', {
    fg = c.red,
    bg = blend(c.red, c.bgdark, 0.2),
  })
  hl('LazyCommitIssue', { fg = c.git.delete })
  hl('LazyH1', { fg = c.red })
  hl('LazySpecial', { fg = c.pink })
  hl('LazyDir', { link = 'Directory' })
  hl('LazyValue', { fg = c.purple })
  hl('LazyProp', { fg = c.pink })
  hl('LazyProgressDone', { fg = c.pink })
  hl('LazyProgressTodo', { fg = blend(c.pink, c.bgdark, 0.2) })
end

return M
