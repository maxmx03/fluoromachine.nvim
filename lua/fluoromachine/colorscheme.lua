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
  green = '#2FFC1D',
  orange = '#FD8902',
  yellow = '#FFCC00',
  red = '#F44747',
  cyan = '#4B9695',
  gray = '#73817D',
  info = '#6796E6',
  warn = '#CD9731',
  hint = '#f92AAd',
  error = '#F44747',
  add = '#2FFC1D',
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
