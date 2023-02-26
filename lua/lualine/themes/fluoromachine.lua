local fluoromachine = require 'fluoromachine'
local colors = fluoromachine.colors
local colortool = require 'fluoromachine.colortool'
local blend = colortool.blend
local darken = colortool.darken

local M = {
  normal = {
    a = { fg = colors.purple, bg = blend(colors.purple, colors.bg, 0.15), gui = 'bold' },
    b = { fg = colors.purple, bg = darken(colors.purple, 20) },
    c = { fg = colors.fg, bg = colors.bg },
    z = { fg = colors.purple, bg = blend(colors.purple, colors.bg, 0.15) },
  },
  insert = {
    a = { fg = colors.pink, bg = blend(colors.pink, colors.bg, 0.15), gui = 'bold' },
  },
  visual = {
    a = { fg = colors.blue, bg = blend(colors.blue, colors.bg, 0.15), gui = 'bold' },
  },
  replace = {
    a = { fg = colors.orange, bg = blend(colors.orange, colors.bg, 0.15), gui = 'bold' },
  },
  command = {
    a = { fg = colors.purple, bg = darken(colors.purple, 20), gui = 'bold' },
  },
}

return M
