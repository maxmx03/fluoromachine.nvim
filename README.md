# FluoroMachine.nvim
FluoroMachine theme for neovim base on

![Theme screenshot](https://repository-images.githubusercontent.com/184457193/69dcff00-14d2-11ea-90e1-4bdf6fef80ca)

## Configuration

```lua
vim.g.fluoromachine_italic_comments = true
vim.g.fluoromachine_italic_functions = true
vim.g.fluoromachine_italic_keywords = false
vim.g.fluoromachine_italic_variables = false
```

| option      | default            | description                                                |
| ----------- | ------------------ | ---------------------------------------------------------- |
| transparent | `false`            | enable and disable background transparency                 |
| brightness | `0.15`            | The value should be a float value from 0 to 1          |
| colors      | `{}` or `function` | You can add new colors or override the default             |
| highlights  | `{}` or `function` | You can add new highlights or override the default         |

## Customization

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  transparent = false,
  brightness = 0.15,
  colors = function (c)
    local colors = {
      fg = c.cyan, -- override the default foreground color
      indigo = '#4B0082', -- new color
    }

    return colors
  end,
  highlights = function(colors)
    local highlights = {
      CmpItemKindTabnine = { fg = colors.pink },
      CmpItemKindEmoji = { fg = colors.yellow },
      LineNr = { bg = fluoromachine:is_transparent(colors.bg_alt) }, -- bg_alt if fluoromachine is not transparent
      CursorLineNr = { fg = colors.indigo }, -- new color being used
    }

    return highlights
  end,
}

vim.cmd 'colorscheme fluoromachine'
```
### Customization - Darken Function

Darken hex colors

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  transparent = true,
  highlights = function(colors, darken)
    return {
      DiagnosticVirtualTextError = { fg = colors.danger, bg = darken(colors.error) },
      DiagnosticVirtualTextWarn = { fg = colors.warning, bg = darken(colors.warn) },
      DiagnosticVirtualTextInfo = { fg = colors.info, bg = darken(colors.info) },
      DiagnosticVirtualTextHint = { fg = colors.hint, bg = darken(colors.hint) },
    }
  end,
}

vim.cmd 'colorscheme fluoromachine'
```

### Customization - Blend Function

Blend hex colors, based on [colorblender.py](https://github.com/ChristianChiarulli/colorblender)

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  transparent = false,
  highlights = function(colors, _, blend)
    local background = colors.bg
    local alpha = 0.15

    return {
      Statement = { fg = colors.green, bg = blend(colors.green, background, alpha) },
      PreProc = { fg = colors.orange, bg = blend(colors.orange, background, alpha) },
      Type = { fg = colors.yellow, bg = blend(colors.yellow, background, alpha) },
      Special = { fg = colors.red, bg = blend(colors.red, background, alpha) },
    }
  end,
}

vim.cmd 'colorscheme fluoromachine'
```

## [Lualine](https://github.com/nvim-lualine/lualine.nvim)

```lua
local success, lualine = pcall(require, 'lualine')

if not success then
  return
end

lualine.setup {
  options = {
    theme = 'fluoromachine'
  }
}
```

## Contributing 😳

Pull requests are welcome.
