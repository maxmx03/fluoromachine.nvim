# Fluoromachine (Colorscheme)

Fluoromachine is a fork of the popular Synthwave84 color scheme, which is inspired by the aesthetics of the 1980s and the retro-futuristic genre known as synthwave.
Fluoromachine (Colorscheme) incorporates this neon-drenched style into its design, with a glowing effect that adds a touch of sci-fi to your coding experience.

![Theme screenshot](https://user-images.githubusercontent.com/50273941/189177820-b496e6d8-6747-4310-84fc-2a6e016f67a4.png)

## Features

- Designed for use in the Neovim text editor
- Based on the Synthwave84 color scheme, which is inspired by the aesthetics of the 1980s and the retro-futuristic genre known as synthwave
- Provides a high-contrast, visually pleasing color scheme for coding and other tasks


## Installation

Fluoromachine can be installed using a plugin manager such as [Packer](https://github.com/wbthomason/packer.nvim).

### Packer

To install Fluoromachine using Packer, add the following line to your plugin list in your `init.lua` or `init.vim` file:

```lua
use 'maxmx03/FluoroMachine.nvim'
```

Then, create a new file in your Neovim configuration directory called ftdetect/fluoromachine.lua, 
and add the following code:

```lua
local success, fluoromachine = pcall(require, 'fluoromachine')

if not success then
  return
end

fluoromachine.setup {}

vim.cmd 'colorscheme fluoromachine'
```

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
| glow        | `false`             | Enable and disable the glow effect                 |
| colors      | `{}` or `function` | You can add new colors or override the default     |
| highlights  | `{}` or `function` | You can add new highlights or override the default |

## Customization

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  config = {
   transparent = false,
   brightness = 0.15,
   glow = true,
  },
  colors = {
    dracula = {
      green = '#50fa7b'
    }
  },
  highlights = function(colors, darken, lighten, blend)
    local alpha = fluoromachine.config.brightness

    return {
      ['tag'] = { fg = colors.dracula.green, bg = blend(colors.dracula.green, colors.bg, alpha) }
    }
  end,
}

vim.cmd 'colorscheme fluoromachine'
```

<p>before</p>

![before](https://user-images.githubusercontent.com/50273941/189538463-1e0aee04-585b-4854-addf-b284a85aaa2c.png)

<p>after</p>

![after](https://user-images.githubusercontent.com/50273941/189538457-473fc325-0d53-4eab-bb01-914b985253c2.png)

or

```lua
fluoromachine.setup {
  config = {
   transparent = false,
   brightness = 0.15,
  },
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
      ['@tag'] = { fg = colors.dracula.green, bg = colors.dracula.green_bg }
    }
  end,
}
```

<p>same result</p>

![after](https://user-images.githubusercontent.com/50273941/189538457-473fc325-0d53-4eab-bb01-914b985253c2.png)

### Customization - Darken Function

Darken hex colors

```lua
local fluoromachine = require 'fluoromachine'

fluoromachine.setup {
  config = {
   transparent = false,
   brightness = 0.15,
  },
  highlights = function(colors, darken)
    return {
      DiagnosticVirtualTextError = { fg = colors.danger, bg = darken(colors.error, 30) },
      DiagnosticVirtualTextWarn = { fg = colors.warning, bg = darken(colors.warn, 30) },
      DiagnosticVirtualTextInfo = { fg = colors.info, bg = darken(colors.info, 30) },
      DiagnosticVirtualTextHint = { fg = colors.hint, bg = darken(colors.hint, 30) },
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
