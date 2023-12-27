local function indentblankline(c)
  local utils = require('fluoromachine.utils')
  local colors = require('fluoromachine.utils.colors')
  local darken = colors.darken
  local hl = utils.set_hl

  hl('IndentBlanklineChar', { fg = darken(c.purple, 20) }) -- Highlight of indent character. Default: Whitespace
  hl('IndentBlanklineSpaceChar', { link = 'IndentBlanklineChar' }) -- Highlight of space character. Default: Whitespace
  hl('IndentBlanklineContextChar', { fg = darken(c.pink, 10) }) -- Highlight of indent character when base of current context. Default: Label
  hl('IndentBlanklineContextSpaceChar', { link = 'IndentBlanklineContextChar' }) -- Highlight of space characters one indent level of the current context. Default: Label
  hl('IblIndent', { fg = darken(c.purple, 20), nocombine = true })
  hl('IblScope', { fg = darken(c.pink, 10), nocombine = true })

  -- hl('IndentBlanklineSpaceCharBlankline', {}) -- Highlight of space character on blank lines. Default: Whitespace
  -- hl('IndentBlanklineContextStart', {}) -- Highlight of the first line of the current context. Default: Label
end

return indentblankline
