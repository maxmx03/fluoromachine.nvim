---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local blend = opts.color.blend
    local c = opts.colors
    local alpha = 0.2

    local debug = c.pink
    local trace = c.purple

    hl('NotifyBackground', { bg = c.bgdark })
    hl('NotifyERRORIcon', { fg = c.diagnostic.error })
    hl('NotifyWARNIcon', { fg = c.diagnostic.warning })
    hl('NotifyINFOIcon', { fg = c.diagnostic.info })
    hl('NotifyDEBUGIcon', { fg = debug })
    hl('NotifyTRACEIcon', { fg = trace })
    hl('NotifyERRORTitle', { fg = c.diagnostic.error })
    hl('NotifyWARNTitle', { fg = c.diagnostic.warning })
    hl('NotifyINFOTitle', { fg = c.diagnostic.info })
    hl('NotifyDEBUGTitle', { fg = debug })
    hl('NotifyTRACETitle', { fg = trace })
    hl('NotifyERRORBody', {
      fg = c.diagnostic.error,
      bg = blend(c.diagnostic.error, c.bgdark, alpha),
    })
    hl('NotifyWARNBody', {
      fg = c.diagnostic.warning,
      bg = blend(c.diagnostic.warning, c.bgdark, alpha),
    })
    hl(
      'NotifyINFOBody',
      { fg = c.diagnostic.info, bg = blend(c.diagnostic.info, c.bgdark, alpha) }
    )
    hl('NotifyDEBUGBody', { fg = debug, bg = blend(debug, c.bgdark, alpha) })
    hl('NotifyTRACEBody', { fg = trace, bg = blend(trace, c.bgdark, alpha) })
    hl('NotifyERRORBorder', { link = 'NotifyERRORBody' })
    hl('NotifyWARNBorder', { link = 'NotifyWARNBody' })
    hl('NotifyINFOBorder', { link = 'NotifyINFOBody' })
    hl('NotifyDEBUGBorder', { link = 'NotifyDEBUGBody' })
    hl('NotifyTRACEBorder', { link = 'NotifyTRACEBody' })
  end,
}

return M
