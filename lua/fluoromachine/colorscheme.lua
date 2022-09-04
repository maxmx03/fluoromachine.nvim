local M = {}

M.highlights = {}
M.colors = {
	bg = "#262335",
	fg = "#8BA7A7",
  comment = '#495495',
	selection = "#463465",
	blue = "#61E2FF",
	purple = "#8A2DC0",
	pink = "#F92AAD",
	green = "#2FFC1D",
	orange = "#FD8902",
	yellow = "#FFCC00",
	red = "#F44747",
	cyan = "#36f9f6",
	gray = "#73817D",
  info = '#6796E6',
  warn = '#CD9731',
  hint = '#8BA7A7',
  error = '#F44747',
  add = '#2FFC1D',
  changed = '#FD8902',
  deleted = '#F92AAD',
  removed = '#F44747',
}
M.config = {
	mode = "dark",
	theme = "vim",
	transparent = false,
}

function M:new()
	local t = {}

	self.__index = self
	setmetatable(t, self)

	return t
end

function M:is_transparent(color)
	if self.config.transparent then
		return "NONE"
	end

	return color
end

function M:is_not_transparent(color)
	if not self.config.transparent then
		return "NONE"
	end

	return color
end

local colorscheme = M:new()

return colorscheme
