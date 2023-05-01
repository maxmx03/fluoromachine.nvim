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

function M:set_blended_colors()
  local b = utils.blend
  local blended_colors = {}
  local ignore_colors = {
    'fg',
    'bg',
    'bgdark',
    'alt_bg',
    'currentline',
    'selection',
    'comment',
    'cursor_fg',
    'cursor_bg',
  }

  for color_name, color_value in pairs(self.colors) do
    if not vim.tbl_contains(ignore_colors, color_name) then
      local blended_color = b(color_value, self.colors.bg, self.brightness)
      local blended_name = 'blended_' .. color_name

      blended_colors[blended_name] = blended_color
    end
  end

  self.colors = vim.tbl_extend('keep', self.colors, blended_colors)
end

function M:set_colors()
  if self.user_config.theme ~= 'retrowave' then
    self.colors = require 'fluoromachine.palettes'
  else
    self.colors = require 'fluoromachine.palettes.retrowave'
  end
end

function M:set_user_colors()
  if type(self.user_config.colors) == 'table' then
    self.colors = vim.tbl_extend('force', self.colors, self.user_config.colors)
  elseif type(self.user_config.colors) == 'function' then
    self.colors = vim.tbl_extend('force', self.colors, self.user_config.colors(self.colors))
  end
end

function M:set_theme()
  if self.user_config.theme ~= 'retrowave' then
    self.theme = require 'fluoromachine.themes'
  else
    self.theme = require 'fluoromachine.themes.retrowave'
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
    if self.user_config.theme ~= 'retrowave' then
      self.colors.bg = '#200933'
      self.colors.alt_bg = utils.darken(self.colors.bg, 10)
    end
    self:set_blended_colors()
  end
end

function M:set_brightness()
  if type(self.user_config.brightness) == 'number' then
    self.brightness = self.user_config.brightness
  end
end

function M:load(user_config)
  if vim.tbl_isempty(self.user_config) then
    self.user_config = user_config or {}
  end

  self:set_transparent()
  self:set_brightness()
  self:set_colors()
  self:set_glow()
  self:set_theme()
  self:set_user_colors()
end

return M
