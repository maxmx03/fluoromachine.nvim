local function bufferline(c, config)
  local utils = require('fluoromachine.utils')
  local hl = utils.set_hl

  -- When `termguicolors` is enabled, this plugin is designed to work automatically,
  -- deriving colours from the user's theme.
  --
  -- My attempt to fix bufferline on transparent background
  if config.transparent then
    hl('BufferLineFill', { bg = c.bgdark })
    hl('BufferLineBufferSelected', { fg = c.yellow, italic = true })
    hl('BufferLineSeparator', { fg = c.bgdark })
    hl('BufferLineSeparatorSelected', { fg = c.bgdark })
    hl('BufferLineSeparatorVisible', { fg = c.bgdark })
  end
end

return bufferline
