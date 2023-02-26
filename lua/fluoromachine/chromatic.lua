local chromatic = {}

local function hex_to_rgb(hex)
  -- Remove the "#" character if present
  hex = hex:gsub('#', '')

  -- Split the hex code into separate red, green, and blue components
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Return the color values as three separate integers
  return { r, g, b }
end

local function rgb_to_hex(red, green, blue)
  return string.format('#%02X%02X%02X', red, green, blue)
end

function chromatic.darken(color, percent)
  local r = tonumber(color:sub(2, 3), 16)
  local g = tonumber(color:sub(4, 5), 16)
  local b = tonumber(color:sub(6, 7), 16)

  r = math.max(0, math.floor(r * (1 - percent / 100)))
  g = math.max(0, math.floor(g * (1 - percent / 100)))
  b = math.max(0, math.floor(b * (1 - percent / 100)))

  return string.format('#%02X%02X%02X', r, g, b)
end

function chromatic.lighten(color, percent)
  local r = tonumber(color:sub(2, 3), 16)
  local g = tonumber(color:sub(4, 5), 16)
  local b = tonumber(color:sub(6, 7), 16)

  r = math.min(255, math.floor(r * (1 + percent / 100)))
  g = math.min(255, math.floor(g * (1 + percent / 100)))
  b = math.min(255, math.floor(b * (1 + percent / 100)))

  return string.format('#%02X%02X%02X', r, g, b)
end

function chromatic.blend(hex_fg, hex_bg, alpha)
  local rgb_bg = hex_to_rgb(hex_bg)
  local rgb_fg = hex_to_rgb(hex_fg)
  local min = math.min
  local max = math.max
  local floor = math.floor

  local function blend_channel(channel)
    local blended_channel = alpha * rgb_fg[channel] + ((1 - alpha) * rgb_bg[channel])

    return floor(min(max(0, blended_channel), 255) + 0.5)
  end

  return rgb_to_hex(blend_channel(1), blend_channel(2), blend_channel(3))
end

function chromatic.glow(hex_color)
  local lighter_color = chromatic.lighten(hex_color, 20)

  return chromatic.blend(hex_color, lighter_color, 0.7)
end

return chromatic
