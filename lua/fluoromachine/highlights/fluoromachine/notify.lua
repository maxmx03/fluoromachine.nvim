---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local blend = opts.color.blend
  local c = opts.colors
  local alpha = 0.2

  local debug = c.pink
  local trace = c.purple

  hl('NotifyBackground', { bg = c.bgdark })
  hl('NotifyERRORIcon', { fg = c.diag.error })
  hl('NotifyWARNIcon', { fg = c.diag.warning })
  hl('NotifyINFOIcon', { fg = c.diag.info })
  hl('NotifyDEBUGIcon', { fg = debug })
  hl('NotifyTRACEIcon', { fg = trace })
  hl('NotifyERRORTitle', { fg = c.diag.error })
  hl('NotifyWARNTitle', { fg = c.diag.warning })
  hl('NotifyINFOTitle', { fg = c.diag.info })
  hl('NotifyDEBUGTitle', { fg = debug })
  hl('NotifyTRACETitle', { fg = trace })
  hl('NotifyERRORBody', {
    fg = c.diag.error,
    bg = blend(c.diag.error, c.bgdark, alpha),
  })
  hl('NotifyWARNBody', {
    fg = c.diag.warning,
    bg = blend(c.diag.warning, c.bgdark, alpha),
  })
  hl('NotifyINFOBody', { fg = c.diag.info, bg = blend(c.diag.info, c.bgdark, alpha) })
  hl('NotifyDEBUGBody', { fg = debug, bg = blend(debug, c.bgdark, alpha) })
  hl('NotifyTRACEBody', { fg = trace, bg = blend(trace, c.bgdark, alpha) })
  hl('NotifyERRORBorder', { link = 'NotifyERRORBody' })
  hl('NotifyWARNBorder', { link = 'NotifyWARNBody' })
  hl('NotifyINFOBorder', { link = 'NotifyINFOBody' })
  hl('NotifyDEBUGBorder', { link = 'NotifyDEBUGBody' })
  hl('NotifyTRACEBorder', { link = 'NotifyTRACEBody' })
end

return M
