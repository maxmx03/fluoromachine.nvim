local function get_colors(theme)
  local config = require('fluoromachine.config').config
  local colors = require(string.format('fluoromachine.colors.%s', theme))

  if config and config.theme == 'fluoromachine' and config.glow then
    local color = require('fluoromachine.utils.color')
    colors.bg = '#200933'
    colors.bgdark = color.darken('#200933', 10)
  end

  return colors
end

---@type fm.palette
local M = {
  get_colors = get_colors,
}

return M
