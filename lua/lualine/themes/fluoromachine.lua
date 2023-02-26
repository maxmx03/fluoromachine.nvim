local fluoromachine = require 'fluoromachine'
local chromatic = require 'fluoromachine.chromatic'

local colors = fluoromachine.colors
local blend = chromatic.blend
local darken = chromatic.darken

local M = {
  normal = {
    a = { fg = colors.purple, bg = blend(colors.purple, colors.bg, 0.15), gui = 'bold' },
    b = { fg = colors.purple, bg = darken(colors.purple, 50) },
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
    a = { fg = colors.rurple, bg = darken(colors.purple, 50), gui = 'bold' },
  },
}

return M
