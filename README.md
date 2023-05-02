# Fluoromachine for [Neovim](https://neovim.io)

> Created with [colorgen](https://github.com/ChristianChiarulli/colorgen-nvim)

Fluoromachine is a fork of the popular Synthwave84 color scheme, which is inspired by the
aesthetics of the 1980s and the retro-futuristic genre known as synthwave. Fluoromachine (Colorscheme)
incorporates this neon-drenched style into its design, with a glowing effect that adds a touch of
sci-fi to your coding experience.

![preview](https://user-images.githubusercontent.com/50273941/235521835-847f5720-4f88-4349-a2e9-2c8fa0dd4590.png)

<details>
    <summary>Install</summary>

To install fluoromachine you need a plugin manager.

- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Packer](https://github.com/wbthomason/packer.nvim)

Example with Lazy.nvim

```lua
return {
    {
        'maxmx03/fluoromachine.nvim',
        config = function ()
         local fm = require 'fluoromachine'

         fm.setup {
            glow = false,
            theme = 'fluoromachine'
         }

         vim.cmd.colorscheme 'fluoromachine'
        end
    }
}
```

</details>

<details>
    <summary>Configuration</summary>

| Name        | type           | default value   | Description                                                                              |
| ----------- | -------------- | --------------- | ---------------------------------------------------------------------------------------- |
| glow        | boolean        | `false`         | Enable and disable the glow effect                                                       |
| brightness  | number         | `0.05`          | The value should be a float value from 0 to 1                                            |
| theme       | string         | `fluoromachine` | Change the theme of the colorscheme, you can choose between fluoromachine and retrowave  |
| transparent | boolean/string | `false`         | Change the background to transparent, you can set "full" to make everything transparent. |
| colors      | table/callback | `{}`            | Add or override to fluoromachine colors                                                  |
| overrides   | table/callback | `{}`            | Update or add new highlight groups.                                                      |

example:

```lua
local fm = require 'fluoromachine'

fm.setup {
  glow = true,
  theme = 'retrowave',
  transparent = 'full',
}

vim.cmd.colorscheme('fluoromachine')
```

</details>

<details>
    <summary>Customization</summary>

Fluoromachine is a fully customizable colorscheme, you can even create a colorscheme within
fluoromachine. You can add new colors, add new highlight groups, and update highlight groups.

examples

Changing the colorscheme style.

```lua
local fm = require 'fluoromachine'

fm.setup {
    overrides = {
       ['@type'] = { italic = true, bold = false },
       ['@function'] = { italic = false, bold = false },
       ['@comment'] = { italic = true },
       ['@keyword'] = { italic = false },
       ['@constant'] = { italic = false, bold = false },
       ['@variable'] = { italic = true },
       ['@field'] = { italic = true },
       ['@parameter'] = { italic = true },
   }
}

vim.cmd.colorscheme 'fluoromachine'
```

Customizing Telescope.

The "callback overrides" function receives "colors", "darken", "lighten", and "blend" as
parameters. The "darken" function takes two arguments: the color you want to make darker and the
percentage of darkness. The "lighten" function works the same way as "darken". The "blend" function
takes three arguments: color, background, and alpha.

```lua
local fm = require 'fluoromachine'

function overrides(c)
    return {
     TelescopeResultsBorder = { fg = c.alt_bg, bg = c.alt_bg },
     TelescopeResultsNormal = { bg = c.alt_bg },
     TelescopePreviewNormal = { bg = c.bg },
     TelescopePromptBorder = { fg = c.alt_bg, bg = c.alt_bg },
     TelescopeTitle = { fg = c.fg, bg = c.comment },
     TelescopePromptPrefix = { fg = c.purple },
    }
end

fm.setup {
  overrides = overrides
}

```

Customizing colors

You can customize colors in the same way you customize highlight groups.
The color callback function receives the same parameters as overrides.
The added or customized colors can be used later in overrides.

```lua
local fm = require 'fluoromachine'

fm.setup {
 colors = function (c, _, lighten)

    return {
      bg = lighten(c.bg, 10)
    }
 end
}

vim.cmd.colorscheme 'fluoromachine'
```

</details>

<details>
    <summary>Lualine</summary>

themes: `fluoromachine` `retrowave`
```lua
local lualine = require 'lualine'

lualine.setup {
  options = {
    theme = 'fluoromachine'
  }
}
```

</details>

<details>
    <summary>Contribution</summary>

Pull requests are welcome.\
To learn more about the colorscheme, please read the [SPECIFICATION.md](https://github.com/maxmx03/FluoroMachine.nvim/blob/main/SPECIFICATION.md)

</details>

## Maintainers

| [![Max](https://github.com/maxmx03.png?size=100)](https://github.com/maxmx03) |
| ----------------------------------------------------------------------------- |
| Max Miliano                                                                   |

## License

[MIT License](./LICENSE)
