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
    hl('BufferLineBufferSelected', { fg = c.fg, bold = true })
    hl('BufferLineBufferVisible', { fg = c.comment })
    hl('BufferLineBuffer', { fg = c.comment })
    hl('BufferLineSeparator', { fg = background })
    hl('BufferLineSeparatorSelected', { fg = background })
    hl('BufferLineSeparatorVisible', { fg = background })
  end
end

return M
