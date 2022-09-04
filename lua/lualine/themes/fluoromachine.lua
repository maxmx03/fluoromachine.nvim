local fluoromachine = require 'fluoromachine'
local colors = fluoromachine.colors
local colortool = require 'fluoromachine.colortool'
local darken = colortool.darken

local M = {
  normal = {
    a = { fg = darken(colors.blue), bg = colors.blue, gui = 'bold' },
    b = { fg = darken(colors.content), bg = colors.content },
    c = { fg = colors.content, bg = fluoromachine:is_transparent(colors.bg_alt) },
    z = { fg = darken(colors.primary), bg = colors.blue },
  },
  insert = {
    a = { fg = darken(colors.green), bg = colors.green },
  },
  visual = {
    a = { fg = darken(colors.pink), bg = colors.pink },
  },
  replace = {
    a = { fg = darken(colors.red), bg = colors.red },
  },
  command = {
    a = { fg = colors.blue, bg = darken(colors.blue) },
  },
}

return M
