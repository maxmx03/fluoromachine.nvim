local utils = require('fluoromachine.utils')
local color = require('fluoromachine.utils.color')
local M = {}

function M.load_highlights(colors, config)
  for plugin, enabled in pairs(config.plugins) do
    if enabled then
      ---@type fm.highlights
      local highlight = require(
        string.format('fluoromachine.highlights.%s.%s', config.theme, plugin)
      )

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
    local val = vim.tbl_extend('force', highlight, hl_val)
    vim.api.nvim_set_hl(0, hl_name, val)
  end
end

function M.load(colors, config)
  if config.theme == 'fluoromachine' and config.glow then
    colors.bg = '#200933'
    colors.bgdark = color.darken('#200933', 10)
  end

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
