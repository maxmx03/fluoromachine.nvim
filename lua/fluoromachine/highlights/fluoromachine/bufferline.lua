local function bufferline(c, config)
  local utils = require('fluoromachine.utils')
  local colors = require('fluoromachine.utils.colors')
  local hl = utils.set_hl
  local darken = colors.darken
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
end

return bufferline
