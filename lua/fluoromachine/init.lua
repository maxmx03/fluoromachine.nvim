require 'fluoromachine.autocmd'
local utils = require 'fluoromachine.utils'
local Config = require 'fluoromachine.config'
local M = Config:new()

function M:apply_transparency()
  local groups = {
    Normal = { bg = 'NONE' },
    SignColumn = { bg = 'NONE' },
    CursorLineNr = { bg = 'NONE' },
    LineNr = { bg = 'NONE' },
  }

  if self.transparent then
    if self.transparent == 'full' then
      local groups2 = {
        NormalFloat = { bg = 'NONE' },
        WinSeparator = { bg = 'NONE' },
        NvimTreeWinSeparator = { link = 'WinSeparator' },
        StatusLine = { bg = 'NONE' },
        StatusLineNC = { bg = 'NONE' },
        NvimTreeStatusLine = { bg = 'NONE' },
      }

      groups = vim.tbl_extend('keep', groups, groups2)
    end

    return groups
  end
end

function M:apply_glow()
  local groups = {}

  if not self.glow then
    return
  end

  if self.user_config.theme == "fluoromachine" or not self.user_config.theme then
    groups.LineNr = { fg = utils.darken(self.colors.purple, 50) }
    groups.CursorLineNr = { fg = self.colors.purple, bold = true }
  end

  local glow_groups = {
    '@keyword',
    '@function',
    '@boolean',
    '@tag',
    '@constructor',
    '@constructor.tsx',
    '@constructor.javascript',
  }

  for _, name in pairs(glow_groups) do
    local hl_group = utils.get_hl(name)

    if hl_group and hl_group.fg then
      local fg = utils.decimal_to_hash(hl_group.fg)
      local bg = utils.blend(fg, self.colors.bg, self.brightness)

      groups[name] = { bg = bg, bold = true }
    end
  end

  return groups
end

M.setup = function(user_config)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.o.background = 'dark'

  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'fluoromachine'

  M:load(user_config)

  M.theme.set_highlights(M.colors)

  if type(M.user_config.overrides) == 'function' then
    M.user_config.overrides = M.user_config.overrides(M.colors, utils.darken, utils.lighten, utils.blend)
  end

  utils.update_highlight_groups(M.user_config.overrides)
  utils.update_highlight_groups(M:apply_glow())
  utils.update_highlight_groups(M:apply_transparency())
end

return M
