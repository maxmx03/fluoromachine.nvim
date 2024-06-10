local utils = require('fluoromachine.utils')
local color = require('fluoromachine.utils.color')
local M = {}

function M.load_highlights(colors, config)
  for plugin, enabled in pairs(config.plugins) do
    if enabled then
      local path = string.format('fluoromachine.highlights.%s.%s', config.theme, plugin)
      local ok, highlight = pcall(require, path)

      if not ok then
        return
      end

      highlight.load({
        colors = colors,
        config = config,
        utils = utils,
        color = color,
      })
    end
  end
end

function M.overrides(highlights)
  for hl_name, hl_val in pairs(highlights) do
    local highlight = utils.get_hl(hl_name)
    local val = {}

    if highlight.link then
      val = hl_val
    else
      val = vim.tbl_extend('force', highlight, hl_val)
    end

    vim.api.nvim_set_hl(0, hl_name, val)
  end
end

function M.load(colors, config)
  M.load_highlights(colors, config)
  utils.on_config({
    tbl = function()
      M.overrides(config.overrides)
    end,
    fnc = function()
      M.overrides(config.overrides(colors, color))
    end,
  }, config.overrides)
end

return M
