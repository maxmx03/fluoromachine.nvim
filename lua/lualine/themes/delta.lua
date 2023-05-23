local fluoromachine = require 'fluoromachine'
local colors = fluoromachine.colors
local utils = require 'fluoromachine.utils'
local d = utils.darken

if colors == nil then
  colors = require 'fluoromachine.palettes.delta'
end

return {
  normal = {
    a = { bg = colors.pink, fg = d(colors.pink, 50), gui = 'bold' },
    b = { bg = colors.comment, fg = colors.fg },
    c = { bg = colors.alt_bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = d(colors.green, 50), gui = 'bold' },
  },
  visual = {
    a = { bg = colors.purple, fg = d(colors.selection, 50), gui = 'bold' },
  },
  replace = {
    a = { bg = colors.red, fg = d(colors.red, 50), gui = 'bold' },
  },
  command = {
    a = { bg = colors.orange, fg = d(colors.orange, 50), gui = 'bold' },
  },
}
