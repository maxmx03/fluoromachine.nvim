local utils = require('fluoromachine.utils')
local colorhelper = require('fluoromachine.utils.colors')
local M = {}

function M.load_highlights(colors, config)
  for plugin, enabled in pairs(config.plugins) do
    if enabled then
      local highlights = require(
        string.format('fluoromachine.highlights.%s.%s', config.theme, plugin)
      )

      highlights(colors, config)
    end
  end
end

function M.overrides(highlights)
  for hl_name, hl_val in pairs(highlights) do
    local highlight = utils.get_hl(hl_name)
    local val = vim.tbl_extend('force', highlight, hl_val)
    vim.api.nvim_set_hl(0, hl_name, val)
  end
end

function M.load(colors, config)
  M.load_highlights(colors, config)
  utils.on_config({
    tbl = function()
      M.overrides(config.highlights)
    end,
    fnc = function()
      M.overrides(config.highlights(colors, colorhelper))
    end,
  }, config.highlights)
end

return M
