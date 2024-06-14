local function get_colors()
  local config = require('fluoromachine.config').config
  local theme = (config or { theme = 'fluoromachine' }).theme
  local colors = require(string.format('fluoromachine.colors.%s', theme))

  if config and config.theme == 'fluoromachine' and config.glow then
    local color = require('fluoromachine.utils.color')
    colors.bg = '#200933'
    colors.bgdark = color.darken('#200933', 10)
  end

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
