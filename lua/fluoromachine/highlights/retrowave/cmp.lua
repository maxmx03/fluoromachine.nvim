---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  -- hl('CmpItemAbbr') -- Highlight group for unmatched characters of each completion field.
  hl('CmpItemAbbrDeprecated', { fg = c.comment, strikethrough = true }) -- Highlight group for unmatched characters of each deprecated completion field.
  hl('CmpItemAbbrMatch', { fg = c.cyan }, { glow = config.glow }) -- Highlight group for matched characters of each completion field.
  hl('CmpItemAbbrMatchFuzzy', { fg = c.cyan }, { glow = config.glow }) -- Highlight group for fuzzy-matched characters of each completion field.
  -- hl('CmpItemKind') -- Highlight group for the kind of the field.
  -- hl('CmpItemMenu') -- The menu field's highlight group.

  hl('CmpItemKindText', { link = 'String' })
  hl('CmpItemKindMethod', { link = 'Function' })
  hl('CmpItemKindFunction', { link = 'Function' })
  hl('CmpItemKindField', { fg = c.cyan })
  hl('CmpItemKindVariable', { link = 'Identifier' })
  hl('CmpItemKindClass', { link = 'Type' })
  hl('CmpItemKindInterface', { link = 'Type' })
  hl('CmpItemKindModule', { link = 'Type' })
  hl('CmpItemKindProperty', { link = 'Identifier' })
  hl('CmpItemKindUnit', { link = 'Number' })
  hl('CmpItemKindEnum', { link = 'Type' })
  hl('CmpItemKindKeyword', { link = 'Keyword' })
  hl('CmpItemKindSnippet', { link = 'Keyword' })
  hl('CmpItemKindColor', { fg = c.green })
  hl('CmpItemKindFile', { fg = c.fg })
  hl('CmpItemKindReference', { link = 'Underlined' })
  hl('CmpItemKindFolder', { link = 'Directory' })
  hl('CmpItemKindEnumMember', { link = 'Constant' })
  hl('CmpItemKindConstant', { link = 'Constant' })
  hl('CmpItemKindStruct', { link = 'Identifier' })
  hl('CmpItemKindEvent', { link = 'Function' })
  hl('CmpItemKindOperator', { link = 'Operator' })
  hl('CmpItemKindTypeParameter', { link = 'Type' })
  hl('CmpItemKindValue', { link = 'String' })
end

return M
