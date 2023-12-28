local palette = require('fluoromachine.palette')
local fluoromachine = require('fluoromachine.highlights')
local utils = require('fluoromachine.utils')
local colorhelper = require('fluoromachine.utils.color')

local M = {}

M.config = nil
M.colors = nil

---@return fm.config.default
function M.default_config()
  ---@class fm.config.default
  local config = {
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
      bufferline = false,
      cmp = false,
      diagnostic = false,
      editor = true,
      gitsign = false,
      hop = false,
      illuminate = false,
      indentblankline = false,
      lsp = false,
      navic = false,
      saga = false,
      semantic = false,
      syntax = true,
      treesitter = true,
    },
  }
  return config
end

---@param opts fm.config.default
function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.default_config(), opts or {})

  utils.on_config({
    tbl = function()
      ---@diagnostic disable-next-line: param-type-mismatch
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
