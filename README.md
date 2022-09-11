![Theme screenshot](https://user-images.githubusercontent.com/50273941/189177820-b496e6d8-6747-4310-84fc-2a6e016f67a4.png)

## Configuration

```lua
vim.g.fluoromachine_italic_comments = true
vim.g.fluoromachine_italic_functions = true
vim.g.fluoromachine_italic_keywords = false
vim.g.fluoromachine_italic_variables = false
```

| option      | default            | description                                        |
| ----------- | ------------------ | -------------------------------------------------- |
| transparent | `false`            | enable and disable background transparency         |
| brightness  | `0.15`             | The value should be a float value from 0 to 1      |
| colors      | `{}` or `function` | You can add new colors or override the default     |
| highlights  | `{}` or `function` | You can add new highlights or override the default |

## Customization

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  transparent = false,
  brightness = 0.15,
  colors = {
    dracula = {
      green = '#50fa7b'
    }
  },
  highlights = function(colors, darken, blend)
    local alpha = fluoromachine.config.brightness

    return {
      TSTag = { fg = colors.dracula.green, bg = blend(colors.dracula.green, colors.bg, alpha) }
    }
  end,
}

vim.cmd 'colorscheme fluoromachine'
```

or

```lua
fluoromachine.setup {
  transparent = false,
  brightness = 0.15,
  colors = function (colors, _, blend)
    local green = '#50fa7b'
    local alpha = fluoromachine.config.brightness

    return {
      dracula = {
        green = green,
        green_bg = blend(green, colors.bg, alpha)
      }
    }
  end,
  highlights = function(colors)
    return {
      TSTag = { fg = colors.dracula.green, bg = colors.dracula.green_bg }
    }
  end,
}
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

## Credit & References

- [synthwave-x-fluoromachine](https://github.com/webrender/synthwave-x-fluoromachine)
- [synthwave84](https://github.com/LunarVim/synthwave84.nvim)
