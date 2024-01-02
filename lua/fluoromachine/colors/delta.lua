---@type fm.colors
local M = {
  fg = '#EFEFFD',
  bg = '#2B2233',
  bgdark = '#251D2B',
  cyan = '#98FFFB',
  green = '#C0FF98',
  orange = '#FFD298',
  pink = '#FF67D4',
  purple = '#D598FF',
  red = '#FF98B3',
  yellow = '#EDFF98',
  comment = '#925393',
  editor = {
    cursor_fg = '#282a36',
    cursor_bg = '#F8F8F8',
    currentline = '#492949',
    selection = '#492949',
    separator = '',
  },
  diagnostic = {
    error = '#FF98B3',
    warning = '#ffd298',
    info = '#C0FF98',
    hint = '#C0FF98',
    ok = '#D598FF',
  },
  git = {
    add = '#C0FF98',
    change = '#FFD298',
    delete = '#FF98B3',
  },
}

return M
