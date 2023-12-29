local c = require('fluoromachine.palette').get_colors()
local colors = require('fluoromachine.utils.color')
local darken = colors.darken

return {
  normal = {
    a = { bg = c.bg, fg = c.purple, gui = 'bold' },
    b = { bg = darken(c.purple, 50), fg = c.purple },
    c = { bg = c.bgdark, fg = c.fg },
  },
  insert = {
    a = { bg = c.bg, fg = c.yellow, gui = 'bold' },
    b = { bg = darken(c.yellow, 50), fg = c.yellow },
  },
  visual = {
    a = { bg = c.bg, fg = c.cyan, gui = 'bold' },
    b = { bg = darken(c.cyan, 50), fg = c.cyan },
  },
  replace = {
    a = { bg = c.bg, fg = c.red, gui = 'bold' },
    b = { bg = darken(c.red, 50), fg = c.red },
  },
  command = {
    a = { bg = c.bg, fg = c.orange, gui = 'bold' },
    b = { bg = darken(c.orange, 50), fg = c.orange },
  },
}
