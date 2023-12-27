local M = {}

---@param decimal number
---@return string | any
function M.to_hex(decimal)
  if type(decimal) ~= 'number' then
    return decimal
  end
  local hex = string.format('#%06x', decimal)
  return hex:upper()
end

--- @param name string
---@return table
function M.nvim_get_hl(name)
  local output = vim.api.nvim_get_hl(0, { name = name })

  if output and output.link then
    return output
  end

  local t = {}

  for key, value in pairs(output) do
    t[key] = M.to_hex(value)
  end

  return t
end

return M
