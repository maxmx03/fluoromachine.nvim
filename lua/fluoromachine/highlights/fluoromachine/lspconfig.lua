---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local blend = opts.color.blend
  local darken = opts.color.darken
  local alpha = 0.15
  local config = opts.config

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
  hl('DiagnosticError', { fg = c.diag.error })
  hl('DiagnosticWarn', { fg = c.diag.warning })
  hl('DiagnosticInfo', { fg = c.diag.info })
  hl('DiagnosticHint', { fg = c.diag.hint })
  hl('DiagnosticOk', { fg = c.diag.ok })
  hl('DiagnosticVirtualTextError', { fg = c.diag.error, bg = blend(c.diag.error, c.bg, alpha) })
  hl('DiagnosticVirtualTextWarn', { fg = c.diag.warning, bg = blend(c.diag.warning, c.bg, alpha) })
  hl('DiagnosticVirtualTextInfo', { fg = c.diag.info, bg = blend(c.diag.info, c.bg, alpha) })
  hl('DiagnosticVirtualTextHint', { fg = c.diag.hint, bg = blend(c.diag.hint, c.bg, alpha) })
  hl('DiagnosticVirtualTextOk', { fg = c.diag.ok, bg = blend(c.diag.ok, c.bg, alpha) })
  hl('DiagnosticUnderlineError', { fg = c.diag.error, underline = true })
  hl('DiagnosticUnderlineWarn', { fg = c.diag.warning, underline = true })
  hl('DiagnosticUnderlineInfo', { fg = c.diag.info, underline = true })
  hl('DiagnosticUnderlineHint', { fg = c.diag.hint, underline = true })
  hl('DiagnosticUnderlineOk', { fg = c.diag.ok, underline = true })
  hl('LspReferenceText', { link = 'Visual' }) -- used for highlighting "text" references
  hl('LspReferenceRead', { link = 'Visual' }) -- used for highlighting "read" references
  hl('LspReferenceWrite', { link = 'Visual' }) -- used for highlighting "write" references
  hl('LspInlayHint', { fg = darken(c.yellow, 35) }) -- used for highlighting inlay hints
end

return M
