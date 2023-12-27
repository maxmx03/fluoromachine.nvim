local function hop(c)
  local utils = require('fluoromachine.utils')
  local colors = require('fluoromachine.utils.colors')
  local darken = colors.darken
  local hl = utils.set_hl

  hl('HopNextKey', { fg = c.pink })
  hl('HopNextKey1', { fg = c.cyan })
  hl('HopNextKey2', { fg = darken(c.cyan, 20) })
  hl('HopUnmatched', { fg = c.comment })
end

return hop
