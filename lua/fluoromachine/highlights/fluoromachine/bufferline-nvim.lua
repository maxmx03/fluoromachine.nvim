---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken
  local lighten = opts.color.lighten
  local config = opts.config
  local background = darken(c.bg, 25)

  -- When `termguicolors` is enabled, this plugin is designed to work automatically,
  -- deriving colours from the user's theme.
  --
  -- My attempt to fix bufferline on transparent background
  if config.transparent then
    hl('BufferLineFill', { bg = background })
    if config.glow then
      hl('BufferLineBufferSelected', { fg = c.purple, bold = true })
      hl('BufferLineBufferVisible', { fg = darken(c.purple, 50) })
    else
      hl('BufferLineBufferSelected', { fg = lighten(c.comment, 20), bold = true })
    end
    hl('BufferLineSeparator', { fg = background })
    hl('BufferLineSeparatorSelected', { fg = background })
    hl('BufferLineSeparatorVisible', { fg = background })
  end
end

return M
