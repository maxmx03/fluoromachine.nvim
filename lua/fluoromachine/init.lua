local config = require('fluoromachine.config')

---@class fluoromachine
---@field setup fun(opts: fm.config.default)

---@type fluoromachine
local M = {
  setup = config.setup,
}

return M
