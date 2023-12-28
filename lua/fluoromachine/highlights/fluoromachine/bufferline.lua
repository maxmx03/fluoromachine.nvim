---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local c = opts.colors
    local darken = opts.color.darken
    local config = opts.config
    local background = darken(c.bg, 25)

    -- When `termguicolors` is enabled, this plugin is designed to work automatically,
    -- deriving colours from the user's theme.
    --
    -- My attempt to fix bufferline on transparent background
    if config.transparent then
      hl('BufferLineFill', { bg = background })
      hl('BufferLineBufferSelected', { fg = c.yellow, italic = true })
      hl('BufferLineSeparator', { fg = background })
      hl('BufferLineSeparatorSelected', { fg = background })
      hl('BufferLineSeparatorVisible', { fg = background })
    end
  end,
}

return M
