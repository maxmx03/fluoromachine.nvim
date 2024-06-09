---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local blend = opts.color.blend

  hl('LazyButton', {
    fg = c.purple,
    bg = blend(c.purple, c.bgdark, 0.2),
  })
  hl('LazyButtonActive', {
    fg = c.yellow,
    bg = blend(c.yellow, c.bgdark, 0.2),
  })
  hl('LazyCommitIssue', { fg = c.diag.error })
  hl('LazyH1', { fg = c.yellow })
  hl('LazySpecial', { fg = c.pink })
  hl('LazyDir', { link = 'Directory' })
  hl('LazyValue', { fg = c.cyan })
  hl('LazyProp', { fg = c.pink })
  hl('LazyProgressDone', { fg = c.pink })
  hl('LazyProgressTodo', { fg = blend(c.pink, c.bgdark, 0.2) })
end

return M
