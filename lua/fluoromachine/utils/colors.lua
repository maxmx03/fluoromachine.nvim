local M = {}

--- Convert a hexadecimal color code to RGB color values
---
--- @param hex string     The hexadecimal color code (e.g., "#RRGGBB" or "RRGGBB")
--- @return number red    The red component of the RGB color (0-255)
--- @return number green  The green component of the RGB color (0-255)
--- @return number blue   The blue component of the RGB color (0-255)
function M.hex_to_rgb(hex)
  local red = tonumber(hex:sub(2, 3), 16)
  local green = tonumber(hex:sub(4, 5), 16)
  local blue = tonumber(hex:sub(6, 7), 16)

  return red, green, blue
end

--- Convert rgb to hex
---
--- @param red number
--- @param green number
--- @param blue number
--- @return string color
function M.rgb_to_hex(red, green, blue)
  return string.format('#%02x%02x%02x', red, green, blue)
end

--- Darken a color by a given distance
---
--- @param color string   The color to be darkened in any valid color format
--- @param percentage number The distance by which the color should be darkened (between 1 and 10)
--- @return string color  The resulting darkened color in the same format as the input color
function M.darken(color, percentage)
  local red, green, blue = M.hex_to_rgb(color)
  local i = 1
  local result = {
    red = red * (1 - (percentage / 100) * i),
    green = green * (1 - (percentage / 100) * i),
    blue = blue * (1 - (percentage / 100) * i),
  }

  return M.rgb_to_hex(result.red, result.green, result.blue)
end

--- Lighten a color by a given percentage
---
--- @param color string   The color to be lightened in any valid color format
--- @param percentage number The percentage by which the color should be lightened (between 1 and 10)
--- @return string color  The resulting lightened color in the same format as the input color
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

--- Blend two colors with a given alpha value
---
--- @param hex_fg string The foreground color in hexadecimal format (e.g., "#RRGGBB")
--- @param hex_bg string The background color in hexadecimal format (e.g., "#RRGGBB")
--- @param alpha number The alpha value between 0 and 1, indicating the blending ratio
--- @return string color The resulting blended color in hexadecimal format
function M.blend(hex_fg, hex_bg, alpha)
  local red_bg, green_bg, blue_bg = M.hex_to_rgb(hex_bg)
  local red_fg, green_fg, blue_fg = M.hex_to_rgb(hex_fg)

  local min = math.min
  local max = math.max
  local floor = math.floor

  local function blend_channel(fg, bg)
    local ret = alpha * fg + ((1 - alpha) * bg)

    return floor(min(max(0, ret), 255) + 0.5)
  end

  return M.rgb_to_hex(
    blend_channel(red_fg, red_bg),
    blend_channel(green_fg, green_bg),
    blend_channel(blue_fg, blue_bg)
  )
end

return M
