---@param decimal number
---@return string
local function to_hex(decimal)
  local hex = string.format('#%06x', decimal)
  return hex:upper()
end

--- @param name string
---@return table
local function nvim_get_hl(name)
  local output = vim.api.nvim_get_hl(0, { name = name, link = false })
  local t = {}

  for key, value in pairs(output) do
    t[key] = to_hex(value)
  end

  return t
end

local colors = require('fluoromachine.palette').get_colors()

describe('Fluoromachine', function()
  setup(function()
    vim.cmd.colorscheme('fluoromachine')
  end)

  test('Loads without encoutering any errors', function()
    assert.equal('fluoromachine', vim.g.colors_name)
    assert.is_true(vim.o.termguicolors)
  end)

  test('Highlights for editor is being applied', function()
    local output = nvim_get_hl('Normal')
    assert.equal(colors.fg, output.fg)
    assert.equal(colors.bg, output.bg)
  end)

  test('Highlights for syntax is being applied', function()
    local output = nvim_get_hl('string')
    assert.equal(colors.purple, output.fg)
  end)

  test('Glow is being applied', function()
    require('fluoromachine').setup({ glow = true })
    vim.cmd.colorscheme('fluoromachine')
    local blend = require('fluoromachine.utils.colors').blend
    local expect = blend(colors.yellow, colors.bg, 0.17):upper()
    local output = nvim_get_hl('Function')
    assert.equal(colors.yellow, output.fg)
    assert.equal(expect, output.bg)
  end)
end)
