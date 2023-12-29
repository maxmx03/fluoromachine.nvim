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
    hl('NotifyERRORBorder', { fg = c.diagnostic.error })
    hl('NotifyWARNBorder', { fg = c.diagnostic.warning })
    hl('NotifyINFOBorder', { fg = c.diagnostic.info })
    hl('NotifyDEBUGBorder', { fg = debug })
    hl('NotifyTRACEBorder', { fg = trace })
    hl('NotifyERRORIcon', { link = 'NotifyERRORBorder' })
    hl('NotifyWARNIcon', { link = 'NotifyWARNBorder' })
    hl('NotifyINFOIcon', { link = 'NotifyINFOBorder' })
    hl('NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
    hl('NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })
    hl('NotifyERRORTitle', { link = 'NotifyERRORBorder' })
    hl('NotifyWARNTitle', { link = 'NotifyWARNBorder' })
    hl('NotifyINFOTitle', { link = 'NotifyINFOBorder' })
    hl('NotifyDEBUGTitle', { link = 'NotifyDEBUGTitle' })
    hl('NotifyTRACETitle', { link = 'NotifyTRACEBorder' })
    hl(
      'NotifyERRORBody',
      {
        fg = c.diagnostic.error,
        bg = blend(c.diagnostic.error, c.bgdark, alpha),
      }
    )
    hl(
      'NotifyWARNBody',
      {
        fg = c.diagnostic.warning,
        bg = blend(c.diagnostic.warning, c.bgdark, alpha),
      }
    )
    hl(
      'NotifyINFOBody',
      { fg = c.diagnostic.info, bg = blend(c.diagnostic.info, c.bgdark, alpha) }
    )
    hl('NotifyDEBUGBody', { fg = debug, bg = blend(debug, c.bgdark, alpha) })
    hl('NotifyTRACEBody', { fg = trace, bg = blend(trace, c.bgdark, alpha) })
  end,
}

return M
