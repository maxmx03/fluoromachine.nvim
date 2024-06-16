---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  hl('NavicIconsFile', { fg = c.fg })
  hl('NavicIconsModule', { link = 'Identifier' })
  hl('NavicIconsNamespace', { link = 'Identifier' })
  hl('NavicIconsPackage', { link = 'Directory' })
  hl('NavicIconsClass', { link = 'Type' })
  hl('NavicIconsMethod', { link = 'Function' })
  hl('NavicIconsProperty', { fg = c.cyan })
  hl('NavicIconsField', { fg = c.cyan })
  hl('NavicIconsConstructor', { link = 'Keyword' })
  hl('NavicIconsEnum', { link = 'Type' })
  hl('NavicIconsInterface', { link = 'Type' })
  hl('NavicIconsFunction', { link = 'Function' })
  hl('NavicIconsVariable', { link = 'Identifier' })
  hl('NavicIconsConstant', { link = 'Constant' })
  hl('NavicIconsString', { link = 'String' })
  hl('NavicIconsNumber', { link = 'Number' })
  hl('NavicIconsBoolean', { link = 'Boolean' })
  hl('NavicIconsArray', { link = 'Delimiter' })
  hl('NavicIconsObject', { fg = c.cyan })
  hl('NavicIconsKey', { link = 'Identifier' })
  hl('NavicIconsNull', { link = 'Constant' })
  hl('NavicIconsEnumMember', { link = 'Constant' })
  hl('NavicIconsStruct', { link = 'Type' })
  hl('NavicIconsEvent', { link = 'Function' })
  hl('NavicIconsOperator', { link = 'Operator' })
  hl('NavicIconsTypeParameter', { link = 'Type' })
  hl('NavicText', { fg = c.fg })
  hl('NavicSeparator', { link = 'Keyword' })
end

return M
