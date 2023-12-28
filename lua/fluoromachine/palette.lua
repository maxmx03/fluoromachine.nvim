local function get_colors()
  local config = require('fluoromachine.config').config
  local theme = (config or { theme = 'fluoromachine' }).theme
  local colors = require(string.format('fluoromachine.colors.%s', theme))
  return colors
end

local function extend_colors(colors)
  local default_colors = get_colors()
  return vim.tbl_deep_extend('force', default_colors, colors)
end

---@type fm.palette
local M = {
  get_colors = get_colors,
  extend_colors = extend_colors,
}

return M
