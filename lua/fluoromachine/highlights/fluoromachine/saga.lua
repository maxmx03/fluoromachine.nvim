local function saga(c, config)
  local utils = require('fluoromachine.utils')
  local hl = utils.set_hl

  -- Float window
  hl('SagaNormal', { link = 'Pmenu' })
  hl(
    'TitleString',
    { fg = c.yellow, bold = true, bg = c.bgdark },
    { transparent = config.transparent }
  )

  hl('SagaWinbarModule', { link = '@namespace' })
  hl('SagaWinbarInterface', { link = 'Type' })
  hl('SagaWinbarConstructor', { link = '@constructor' })
  hl('SagaWinbarStruct', { link = 'Structure' })
  hl('SagaWinbarObject', { link = '@field' })
  hl('SagaWinbarUnit', { link = 'Number' })
  hl('SagaWinbarFile', { fg = c.fg })
  hl('SagaWinbarSnippet', { link = 'Keyword' })
  hl('SagaWinbarText', { fg = c.fg })
  hl('SagaWinbarTypeAlias', { link = 'Type' })
  hl('SagaWinbarEvent', { fg = c.yellow })
  hl('SagaWinbarParameter', { link = '@parameter' })
  hl('SagaWinbarKey', { link = '@field' })
  hl('SagaWinbarValue', { fg = c.fg })
  hl('SagaWinbarMacro', { link = 'Macro' })
  hl('SagaWinbarNumber', { link = 'Number' })
  hl('SagaWinbarConstant', { link = 'Constant' })
  hl('SagaWinbarFunction', { link = 'Function' })
  hl('SagaWinbarEnum', { link = 'Type' })
  hl('SagaWinbarField', { link = '@field' })
  hl('SagaWinbarProperty', { link = '@field' })
  hl('SagaWinbarMethod', { link = 'Function' })
  hl('SagaWinbarClass', { link = 'Type' })
  hl('SagaWinbarFolder', { link = 'Directory' })
  hl('SagaWinbarPackage', { link = 'Directory' })
  hl('SagaWinbarStaticMethod', { link = 'Function' })
  hl('SagaWinbarTypeParameter', { link = 'Type' })
  hl('SagaWinbarEnumMember', { link = 'Constant' })
  hl('SagaWinbarOperator', { link = 'Operator' })
  hl('SagaWinbarNull', { link = 'Constant' })
  hl('SagaWinbarNamespace', { link = '@namespace' })
  hl('SagaWinbarArray', { link = 'Delimiter' })
  hl('SagaWinbarBoolean', { link = 'Boolean' })
  hl('SagaWinbarString', { link = 'String' })
  hl('SagaWinbarVariable', { link = 'Identifier' })
  hl('SagaWinbarFilename', { fg = c.fg })
  hl('SagaWinbarFolderName', { fg = c.fg })
  hl('SagaWinbarFileIcon', { link = 'Directory' })
  hl('SagaWinbarSep', { link = 'Keyword' })
end

return saga
