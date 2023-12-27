local function cmp(c, config)
  local utils = require('fluoromachine.utils')
  local hl = utils.set_hl

  -- hl('CmpItemAbbr') -- Highlight group for unmatched characters of each completion field.
  hl('CmpItemAbbrDeprecated', { fg = c.comment, strikethrough = true }) -- Highlight group for unmatched characters of each deprecated completion field.
  hl('CmpItemAbbrMatch', { fg = c.yellow }, { glow = config.glow }) -- Highlight group for matched characters of each completion field.
  hl('CmpItemAbbrMatchFuzzy', { fg = c.yellow }, { glow = config.glow }) -- Highlight group for fuzzy-matched characters of each completion field.
  -- hl('CmpItemKind') -- Highlight group for the kind of the field.
  -- hl('CmpItemMenu') -- The menu field's highlight group.

  hl('CmpItemKindReference', { link = 'Underlined' })
  hl('CmpItemKindUnit', { link = 'Number' })
  hl('CmpItemKindEnum', { link = 'Type' })
  hl('CmpItemKindField', { link = '@field' })
  hl('CmpItemKindClass', { link = 'Type' })
  hl('CmpItemKindFile', { fg = c.fg })
  hl('CmpItemKindProperty', { link = '@field' })
  hl('CmpItemKindMethod', { link = 'Function' })
  hl('CmpItemKindKeyword', { link = 'Keyword' })
  hl('CmpItemKindFolder', { link = 'Directory' })
  hl('CmpItemKindSnippet', { link = 'Keyword' })
  hl('CmpItemKindVariable', { link = 'Identifier' })
  hl('CmpItemKindStruct', { link = 'Structure' })
  hl('CmpItemKindInterface', { link = 'Type' })
  hl('CmpItemKindTypeParameter', { link = 'Type' })
  hl('CmpItemKindEnumMember', { link = 'Constant' })
  hl('CmpItemKindEvent', { fg = c.base2 })
  hl('CmpItemKindConstructor', { link = '@constructor' })
  hl('CmpItemKindConstant', { link = 'Constant' })
  hl('CmpItemKindModule', { link = '@namespace' })
  hl('CmpItemKindValue', { fg = c.fg })
  hl('CmpItemKindColor', { fg = c.orange })
  hl('CmpItemKindFunction', { link = 'Function' })
  hl('CmpItemKindText', { link = 'String' })
end

return cmp
