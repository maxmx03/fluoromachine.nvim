local M = {}

M.highlights = {}
M.colors = {
  bg = '#262335',
  fg = '#8BA7A7',
  alt_bg = '#241b2f',
  comment = '#495495',
  selection = '#463465',
  blue = '#61E2FF',
  purple = '#AF6DF9',
  pink = '#F92AAD',
  green = '#3CCF4E',
  orange = '#FD8902',
  yellow = '#FFCC00',
  red = '#F44747',
  gray = '#73817D',
  info = '#6796E6',
  warn = '#CD9731',
  hint = '#61E2FF',
  error = '#F44747',
  add = '#3CCF4E',
  changed = '#FD8902',
  deleted = '#F92AAD',
  removed = '#F44747',
}
M.config = {
  transparen = false,
  brightness = 0.15,
}

function M:new()
  local t = {}

  self.__index = self
  setmetatable(t, self)

  return t
end

function M:is_transparent(color)
  if self.config.transparent then
    return 'NONE'
  end

  return color
end

function M:is_not_transparent(color)
  if not self.config.transparent then
    return 'NONE'
  end

  return color
end

local colorscheme = M:new()

return colorscheme
