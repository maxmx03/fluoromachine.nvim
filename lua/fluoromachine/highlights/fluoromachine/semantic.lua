---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local config = opts.config
  local c = opts.colors

  hl('@lsp.type.class', { link = 'Type' })
  hl('@lsp.type.decorator', { link = 'Function' })
  hl('@lsp.type.enum', { link = 'Type' })
  hl('@lsp.type.enumMember', { link = 'Constant' })
  hl('@lsp.type.interface', { link = 'Type' })
  hl('@lsp.type.macro', { link = 'Keyword' })
  hl('@lsp.type.namespace', { fg = c.cyan })
  hl('@lsp.type.parameter', { fg = c.orange }, {
    styles = config.styles.parameters,
  })
  hl('@lsp.type.property', { fg = c.base0 })
  hl('@lsp.type.struct', { fg = c.cyan })
  hl('@lsp.type.type', { fg = c.cyan })
  hl('@lsp.type.typeParameter', { fg = c.cyan, italic = true })
  hl('@lsp.type.variable', { fg = c.base0 })
  hl('@lsp.typemod.variable.defaultLibrary', { link = 'Constant' })
  hl('@lsp.typemod.variable.readonly', { link = 'Constant' })
  hl('@lsp.typemod.variable.global', { link = 'Constant' })
  hl('@lsp.typemod.keyword.documentation', { link = 'Keyword' })
  hl('@lsp.typemod.class.documentation', { link = 'Type' })
  hl('@lsp.typemod.property.readonly', { link = 'Constant' })
end

return M
