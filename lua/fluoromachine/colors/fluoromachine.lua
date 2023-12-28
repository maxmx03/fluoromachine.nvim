---@type fm.colors
local M = {
  fg = '#8BA7A7',
  bg = '#262335',
  bgdark = '#241B2F',
  cyan = '#61E2FF',
  green = '#72F1B8',
  orange = '#FF8B39',
  pink = '#FC199A',
  purple = '#AF6DF9',
  red = '#FE4450',
  yellow = '#FFCC00',
  comment = '#495495',
  editor = {
    cursor_fg = '#282A36',
    cursor_bg = '#8BA7A7',
    currentline = '#463465',
    selection = '#463465',
    separator = '#495495',
  },
  diagnostic = {
    info = '#61E2FF',
    hint = '#61E2FF',
    warning = '#FF8B39',
    error = '#FE4450',
    ok = '#72F1B8',
  },
  git = {
    add = '#72F1B8',
    change = '#FF8B39',
    delete = '#FE4450',
  },
  lsp = {
    inlay_hint = '#8C57C7',
  },
}

return M
