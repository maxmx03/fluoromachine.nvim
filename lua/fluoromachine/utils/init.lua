local colors = require('fluoromachine.utils.colors')
local M = {}

--- Sets a highlight group
--- @param name string
--- @param val? table
--- @param opts? table The opts object..
---       - opts.transparent: (boolean) Specifies whether transparency is enabled.
---       - opts.styles: (table) A table of custom styles for various elements.
---@return nil
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
      local config = require('fluoromachine.config')
      local palette = require('fluoromachine.palette').get_colors()
      local brightness = (
        (config.config or config.default_config()).brightness or 0.17
      )
      local bg = palette.bg

      val.bg = colors.blend(val.fg, bg, brightness)
    end
  end

  vim.api.nvim_set_hl(0, name, val)
end

--- get highlight group
--- @param highlight_name string
--- @return table highlight
function M.get_hl(highlight_name)
  local highlight =
    vim.api.nvim_get_hl(0, { name = highlight_name, link = true })

  if highlight.link then
    return M.get_hl(highlight.link)
  end

  return highlight
end

--- @param opts table The user-specified custom configuration
---       - fnc (function): callback type configuration
---       - tbl (function): table type configuration
--- @param config (table|function): config to be used
function M.on_config(opts, config)
  if type(config) == 'table' and not vim.tbl_isempty(config) then
    opts.tbl()
  elseif type(config) == 'function' then
    opts.fnc()
  end
end

return M
