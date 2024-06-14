local utils = require('fluoromachine.utils.test')
local colors = {}

local nvim_get_hl = utils.nvim_get_hl

describe('Delta', function()
  setup(function()
    require('fluoromachine').setup({
      theme = 'delta',
      glow = true,
      transparent = true,
      colors = {
        bglight = '#ffffff',
      },
      overrides = function(c)
        return {
          Directory = { fg = c.red },
        }
      end,
    })
    vim.cmd.colorscheme('fluoromachine')
  end)

  before_each(function()
    colors = require('fluoromachine.palette').get_colors()
  end)

  test('colors_name', function()
    assert.equal('fluoromachine', vim.g.colors_name)
  end)

  test('config.glow', function()
    local blend = require('fluoromachine.utils.color').blend
    local expect = blend(colors.yellow, colors.bg, 0.05):upper()
    local output = nvim_get_hl('Function')
    assert.equal(colors.yellow, output.fg)
    assert.equal(expect, output.bg)
  end)

  test('config.colors', function()
    local output = require('fluoromachine.config').colors.bglight
    local expect = '#ffffff'
    assert.equal(expect, output)
  end)

  test('config.overrides', function()
    local output = nvim_get_hl('Directory')
    local expected = colors.red
    assert.equal(expected, output.fg)
  end)

  test('editor highlight', function()
    local output = nvim_get_hl('Normal')

    assert.equal(colors.fg, output.fg)
    assert.equal(nil, output.bg)
  end)

  test('syntax highlight', function()
    local output = nvim_get_hl('string')
    assert.equal(colors.purple, output.fg)
  end)

  test('semantic highlight', function()
    local output = nvim_get_hl('@lsp.type.class')
    assert.equal('Type', output.link)
  end)
  --
  test('treesitter highlight', function()
    local output = nvim_get_hl('@comment')
    assert.equal('Comment', output.link)
  end)

  -- test('bufferline highlight', function()
  --   local output = nvim_get_hl('BufferLineFill')
  --   local darken = require('fluoromachine.utils.color').darken
  --   local expect = darken(colors.bg, 25):upper()
  --   assert.equal(expect, output.bg)
  -- end)
  --
  test('cmp highlight', function()
    local output = nvim_get_hl('CmpItemKindClass')
    assert.equal('Type', output.link)
  end)

  test('dashboard highlight', function()
    local output = nvim_get_hl('DashboardHeader')
    assert.equal(colors.red, output.fg)
  end)

  test('gitsign highlight', function()
    local output = nvim_get_hl('GitSignsAdd')
    assert.equal(colors.git.add, output.fg)
  end)
  --
  -- test('hop highlight', function()
  --   local output = nvim_get_hl('HopNextKey')
  --   assert.equal(colors.red, output.fg)
  -- end)

  test('illuminate highlight', function()
    local output = nvim_get_hl('illuminatedWord')
    assert.equal(colors.editor.selection, output.bg)
  end)

  test('indentblankline highlight', function()
    local output = nvim_get_hl('IblIndent')
    local expect = colors.editor.currentline
    assert.equal(expect, output.fg)
  end)

  test('Lazy highlight', function()
    local output = nvim_get_hl('LazyH1')
    local expect = colors.red
    assert.equal(expect, output.fg)
  end)
  --
  test('MiniCursor highlight', function()
    local output = nvim_get_hl('MiniCursorword')
    local expect = colors.editor.selection
    assert.equal(expect, output.bg)
  end)

  test('MiniStarter highlight', function()
    local output = nvim_get_hl('MiniStarterHeader')
    local expect = colors.red
    assert.equal(expect, output.fg)
  end)

  test('MiniStatusline highlight', function()
    local output = nvim_get_hl('MiniStatuslineModeNormal')
    local expect = colors.pink
    assert.equal(expect, output.bg)
  end)

  test('MiniTabline highlight', function()
    local output = nvim_get_hl('MiniTablineCurrent')
    local expect = {
      fg = colors.fg,
      bg = colors.bg,
    }
    assert.equal(expect.fg, output.fg)
    assert.equal(expect.bg, output.bg)
  end)

  test('Navic highlight', function()
    local output = nvim_get_hl('NavicIconsFile')
    local expect = colors.fg
    assert.equal(expect, output.fg)
  end)

  test('Neogit highlight', function()
    local output = nvim_get_hl('NeogitBranch')
    local expect = colors.pink
    assert.equal(expect, output.fg)
  end)

  test('Neotree highlight', function()
    local output = nvim_get_hl('NeoTreeNormal')
    assert.equal(colors.fg, output.fg)
    assert.equal(colors.bgdark, output.bg)
  end)

  test('Noice highlight', function()
    local output = nvim_get_hl('NoiceLspProgressSpinner')
    local expect = colors.pink
    assert.equal(expect, output.fg)
  end)
  --
  -- test('Notify highlight', function()
  --   local output = nvim_get_hl('NotifyERRORBorder')
  --   local expect = 'NotifyERRORBody'
  --   assert.equal(expect, output.link)
  -- end)

  test('Telescope highlight', function()
    local output = nvim_get_hl('TelescopeTitle')
    local expect = colors.pink
    assert.equal(expect, output.fg)
  end)

  test('Nvim-tree highlight', function()
    local output = nvim_get_hl('NvimTreeFolderIcon')
    local expect = 'Directory'
    assert.equal(expect, output.link)
  end)
end)
