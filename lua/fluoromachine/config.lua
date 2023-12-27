local palette = require('fluoromachine.palette')
local fluoromachine = require('fluoromachine.highlights')
local utils = require('fluoromachine.utils')
local colorhelper = require('fluoromachine.utils.colors')
local M = {}

M.config = nil
M.colors = nil

function M.default_config()
  return {
    theme = 'fluoromachine',
    brightness = 0.05,
    glow = true,
    transparent = false,
    styles = {
      comments = {},
      functions = {},
      variables = {},
      numbers = {},
      constants = {},
      parameters = {},
      keywords = {},
      types = {},
    },
    colors = {},
    overrides = {},
    plugins = {
      bufferline = true,
      cmp = true,
      dashboard = true,
      diagnostic = true,
      editor = true,
      gitsign = true,
      hop = true,
      illuminate = true,
      indentblankline = true,
      lsp = true,
      semantic = true,
      syntax = true,
      treesitter = true,
    },
  }
end

function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.default_config(), opts or {})

  utils.on_config({
    tbl = function()
      M.colors = palette.extend_colors(M.config.colors)
    end,
    fnc = function()
      local colors = palette.get_colors()
      M.colors = palette.extend_colors(M.config.colors(colors, colorhelper))
    end,
  }, M.config.colors)
end

function M.load()
  if vim.g.colors_name then
    vim.cmd('hi clear')
  end

  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'fluoromachine'

  local colors = palette.get_colors()
  fluoromachine.load(M.colors or colors, M.config or M.default_config())
end

return M
