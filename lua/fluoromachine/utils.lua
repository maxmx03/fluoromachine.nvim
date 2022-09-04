---@diagnostic disable: cast-local-type
local M = {}

function M.set_highlights(highlight_groups)
  for group_name, group in pairs(highlight_groups) do
    local val = {
      fg = 'NONE',
      bg = 'NONE',
    }

    val = vim.tbl_extend('force', val, group)

    vim.api.nvim_set_hl(0, group_name, val or {})
  end
end

return M
