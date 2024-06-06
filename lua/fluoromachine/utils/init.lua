---@type fm.utils
local M = {}

function M.on_config(opts, config)
  if type(config) == 'table' and not vim.tbl_isempty(config) then
    opts.tbl()
  elseif type(config) == 'function' then
    opts.fnc()
  end
end

function M.get_hl(name)
  local highlight = vim.api.nvim_get_hl(0, { name = name, link = true })

  if highlight.link then
    return M.get_hl(highlight.link)
  end

  return highlight
end

function M.set_hl(name, val, opts)
  local default_val = { fg = 'NONE', bg = 'NONE' }
  val = val or {}

  if not val.link then
    val = vim.tbl_extend('force', default_val, val)
  end

  if opts then
    if opts.styles then
      val = vim.tbl_extend('force', val, opts.styles)
    end

    if opts.transparent then
      val.bg = 'NONE'
    end

    if opts.glow then
      local blend = require('fluoromachine.utils.color').blend
      local config = require('fluoromachine.config')
      local palette = require('fluoromachine.palette').get_colors()
      local brightness = ((config.config or config.default_config()).brightness or 0.17)
      local bg = palette.bg

      val.bg = blend(val.fg, bg, brightness)
    end
  end

  vim.api.nvim_set_hl(0, name, val)
end

return M
