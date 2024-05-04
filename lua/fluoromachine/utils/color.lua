---@type fm.color
local M = {}

function M.hex_to_rgb(hex)
  local red = tonumber(hex:sub(2, 3), 16)
  local green = tonumber(hex:sub(4, 5), 16)
  local blue = tonumber(hex:sub(6, 7), 16)
  return red, green, blue
end

function M.rgb_to_hex(red, green, blue)
  return string.format('#%02x%02x%02x', red, green, blue)
end

function M.darken(hex, percentage)
  local red, green, blue = M.hex_to_rgb(hex)
  local i = 1
  local result = {
    red = red * (1 - (percentage / 100) * i),
    green = green * (1 - (percentage / 100) * i),
    blue = blue * (1 - (percentage / 100) * i),
  }
  return M.rgb_to_hex(result.red, result.green, result.blue)
end

function M.lighten(color, percentage)
  local red, green, blue = M.hex_to_rgb(color)
  local i = 1
  local result = {
    red = red + (255 - red) * i * (percentage / 100),
    green = green + (255 - green) * i * (percentage / 100),
    blue = blue + (255 - blue) * i * (percentage / 100),
  }
  return M.rgb_to_hex(result.red, result.green, result.blue)
end

function M.shade(hex, i)
  local red, green, blue = M.hex_to_rgb(hex)
  local result = {
    red = red * (1 - 0.1 * i),
    green = green * (1 - 0.1 * i),
    blue = blue * (1 - 0.1 * i),
  }
  return M.rgb_to_hex(result.red, result.green, result.blue)
end

function M.tint(hex, i)
  local red, green, blue = M.hex_to_rgb(hex)
  local result = {
    red = red + (255 - red) * i * 0.1,
    green = green + (255 - green) * i * 0.1,
    blue = blue + (255 - blue) * i * 0.1,
  }
  return M.rgb_to_hex(result.red, result.green, result.blue)
end

---@param fg number
---@param bg number
---@param alpha number
---@return number
local function blend_channel(fg, bg, alpha)
  local ret = alpha * fg + ((1 - alpha) * bg)
  local min = math.min
  local max = math.max
  local floor = math.floor
  return floor(min(max(0, ret), 255) + 0.5)
end

function M.blend(fg, bg, alpha)
  local red_bg, green_bg, blue_bg = M.hex_to_rgb(bg)
  local red_fg, green_fg, blue_fg = M.hex_to_rgb(fg)
  return M.rgb_to_hex(
    blend_channel(red_fg, red_bg, alpha),
    blend_channel(green_fg, green_bg, alpha),
    blend_channel(blue_fg, blue_bg, alpha)
  )
end

return M
