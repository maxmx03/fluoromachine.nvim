local c = require('fluoromachine.palette').get_colors()
local colors = require('fluoromachine.utils.color')
local darken = colors.darken

return {
  normal = {
    a = { bg = c.pink, fg = darken(c.pink, 50), gui = 'bold' },
    b = { bg = c.fg, fg = c.bg },
    c = { bg = c.bgdark, fg = c.fg },
  },
  insert = {
    a = { bg = c.green, fg = darken(c.green, 50), gui = 'bold' },
  },
  visual = {
    a = { bg = c.purple, fg = darken(c.editor.selection, 50), gui = 'bold' },
  },
  replace = {
    a = { bg = c.red, fg = darken(c.red, 50), gui = 'bold' },
  },
  command = {
    a = { bg = c.orange, fg = darken(c.orange, 50), gui = 'bold' },
  },
}
