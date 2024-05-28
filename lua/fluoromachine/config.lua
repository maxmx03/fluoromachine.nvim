local utils = require 'fluoromachine.utils'

local M = {}

function M:new()
  local config = {
    transparent = false,
    glow = false,
    brightness = 0.05,
    colors = nil,
    theme = nil,
    user_config = {},
  }

  setmetatable(config, self)
  self.__index = self

  return config
end

function M:set_colors()
  if self.user_config.theme == 'retrowave' then
    self.colors = require 'fluoromachine.palettes.retrowave'
  elseif self.user_config.theme == 'delta' then
    self.colors = require 'fluoromachine.palettes.delta'
  else
    self.colors = require 'fluoromachine.palettes'
  end
end

function M:set_user_colors()
  if type(self.user_config.colors) == 'table' then
    self.colors = vim.tbl_extend('force', self.colors, self.user_config.colors)
  elseif type(self.user_config.colors) == 'function' then
    self.colors = vim.tbl_extend(
      'force',
      self.colors,
      self.user_config.colors(self.colors, utils.darken, utils.lighten, utils.blend)
    )
  end
end

function M:set_theme()
  if self.user_config.theme == 'retrowave' then
    self.theme = require 'fluoromachine.themes.retrowave'
  elseif self.user_config.theme == 'delta' then
    self.theme = require 'fluoromachine.themes.delta'
  else
    self.theme = require 'fluoromachine.themes'
  end
end

function M:set_transparent()
  if self.user_config.transparent then
    self.transparent = self.user_config.transparent
  end
end

function M:set_glow()
  if type(self.user_config.glow) == 'boolean' then
    self.glow = self.user_config.glow
  end

  if self.glow then
    if self.user_config.theme == 'fluoromachine' or not self.user_config.theme then
      self.colors.bg = '#200933'
      self.colors.alt_bg = utils.darken(self.colors.bg, 10)
    end
  end
end

function M:set_brightness()
  if type(self.user_config.brightness) == 'number' then
    self.brightness = self.user_config.brightness
  end
end

function M:load(user_config)
  -- extend the internal `user_config`. Allows calling `setup` multiple times and changing the current setup
  if user_config and not vim.tbl_isempty(user_config) then
    self.user_config = vim.tbl_deep_extend('force', self.user_config, user_config)
  end

  self:set_transparent()
  self:set_brightness()
  self:set_colors()
  self:set_glow()
  self:set_user_colors()
  self:set_theme()
end

return M
