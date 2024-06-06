---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local config = opts.config
  local c = opts.colors

  -- Default highlight
  hl('@lsp.type.class', { link = 'Type' }) -- Type
  hl('@lsp.type.decorator', { link = 'Function' }) -- Function
  hl('@lsp.type.enum', { link = 'Type' }) -- Type
  hl('@lsp.type.enumMember', { link = 'Constant' }) -- Constant
  hl('@lsp.type.function', { link = 'Function' }) -- Function
  hl('@lsp.type.interface', { link = 'Type' }) -- Type
  hl('@lsp.type.macro', { link = 'Keyword' }) -- Keyword
  hl('@lsp.type.method', { link = 'Function' }) -- Function
  hl('@lsp.type.namespace', { link = 'Constant' }) -- Constant
  hl(
    '@lsp.type.parameter', -- function paramter
    { fg = c.cyan, italic = true },
    { styles = config.styles.parameters }
  )
  hl('@lsp.type.property', { fg = c.cyan }) -- Property
  hl('@lsp.type.struct', { link = 'Structure' }) -- Structure
  hl('@lsp.type.type', { link = 'Type' }) -- Type
  hl('@lsp.type.typeParameter', { link = 'Type' }) -- Type
  hl('@lsp.type.variable', { link = 'Identifier' }) -- Identifier

  -- Extra highlight
  hl('@lsp.typemod.variable.defaultLibrary', { link = 'Constant' }) -- ex: "vim".api.nvim_set_hl
  hl('@lsp.typemod.variable.readonly', { link = 'Constant' }) -- Constant variables ex: const hello = 'Hello World'
  hl('@lsp.typemod.variable.global', { link = 'Constant' }) -- Global variables ex: HELLO = 'Hello World'
  hl('@lsp.typemod.keyword.documentation', { link = 'Keyword' }) -- documentation comments
  hl('@lsp.typemod.class.documentation', { link = 'Type' }) -- documentation comments
  hl('@lsp.typemod.property.readonly', { link = 'Constant' }) -- Ex: System."out".println()
end

return M
