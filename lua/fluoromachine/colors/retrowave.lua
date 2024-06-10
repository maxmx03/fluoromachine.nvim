---@type fm.colors
local M = {
  fg = '#f8f8f8',
  bg = '#241B2F',
  bgdark = '#262335',
  cyan = '#61E2FF',
  green = '#72F1B8',
  orange = '#FF8b39',
  pink = '#FF7EDB',
  purple = '#AF6DF9',
  red = '#FE4450',
  yellow = '#FFCC00',
  comment = '#495495',
  editor = {
    cursor_fg = '#282a36',
    cursor_bg = '#F8F8F8',
    currentline = '#463465',
    selection = '#463465',
    separator = '#495495',
  },
  diag = {
    info = '#61E2FF',
    hint = '#61E2FF',
    warning = '#FF8b39',
    error = '#FE4450',
    ok = '#AF6DF9',
  },
  git = {
    add = '#72F1B8',
    change = '#FF8B39',
    delete = '#FE4450',
  },
}

return M
