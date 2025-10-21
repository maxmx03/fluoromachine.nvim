---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  local kinds = {
    keys = {
      'Text',
      'Method',
      'Function',
      'Field',
      'Variable',
      'Class',
      'Interface',
      'Module',
      'Property',
      'Unit',
      'Enum',
      'Keyword',
      'Snippet',
      'Color',
      'File',
      'Reference',
      'Folder',
      'EnumMember',
      'Constant',
      'Struct',
      'Event',
      'Operator',
      'TypeParameter',
      'Value',
    },
    values = {
      Text = { link = 'String' },
      Method = { link = 'Function' },
      Function = { link = 'Function' },
      Field = { fg = c.cyan },
      Variable = { link = 'Identifier' },
      Class = { link = 'Type' },
      Interface = { link = 'Type' },
      Module = { link = 'Type' },
      Property = { link = 'Identifier' },
      Unit = { link = 'Number' },
      Enum = { link = 'Type' },
      Keyword = { link = 'Keyword' },
      Snippet = { link = 'Keyword' },
      Color = { fg = c.green },
      File = { fg = c.fg },
      Reference = { link = 'Underlined' },
      Folder = { link = 'Directory' },
      EnumMember = { link = 'Constant' },
      Constant = { link = 'Constant' },
      Struct = { link = 'Type' },
      Event = { link = 'Function' },
      Operator = { link = 'Operator' },
      TypeParameter = { link = 'Type' },
      Value = { link = 'String' },
    },
  }

  ---@param root string
  ---@param kinds_to_iter table
  local function iterate(root, kinds_to_iter)
    ---@param key string
    vim.iter(kinds_to_iter.keys):each(function(key)
      hl(root .. key, kinds.values[key])
    end)
  end

  -- INFO: NvimCmp
  --
  hl('CmpItemMenu', { link = 'Pmenu' }) -- The menu field's highlight group.
  -- hl('CmpItemAbbr') -- Highlight group for unmatched characters of each completion field.
  hl('CmpItemAbbrDeprecated', { fg = c.comment, strikethrough = true }) -- Highlight group for unmatched characters of each deprecated completion field.
  hl('CmpItemAbbrMatch', { fg = c.yellow }, { glow = config.glow }) -- Highlight group for matched characters of each completion field.
  hl('CmpItemAbbrMatchFuzzy', { fg = c.yellow }, { glow = config.glow }) -- Highlight group for fuzzy-matched characters of each completion field.
  hl('CmpItemKind', { link = 'PmenuKind' }) -- Highlight group for the kind of the field.
  iterate('CmpItemKind', kinds)

  -- INFO: BlinkCmp
  --
  -- NOTE: better change Pmenu HL group,
  -- or if it has to be conditional - make tables for each group and vim.iter:each over them.
  -- + TransparentPmenu for bg = nil
  hl('BlinkCmpMenu', { link = 'Pmenu' }) -- NOTE: default: Pmenu
  hl('BlinkCmpMenuBorder', { link = 'Pmenu' }) -- NOTE: default: Pmenu
  hl('BlinkCmpMenuSelection', { link = 'CursorLine' }) -- NOTE: default: PmenuSel
  hl('BlinkCmpScrollBarThumb', { link = 'Keyword' }) -- NOTE: default: PmenuThumb
  hl('BlinkCmpScrollBarGutter', { link = 'PmenuSbar' }) -- NOTE: default: PmenuSbar
  hl('BlinkCmpLabel', { link = 'String' }) -- NOTE: default: Pmenu
  hl('BlinkCmpLabelDeprecated', { fg = c.comment, strikethrough = true }) -- NOTE: default: PmenuExtra
  hl('BlinkCmpLabelMatch', { fg = c.yellow }, { glow = config.glow }) -- NOTE: default: Pmenu
  hl('BlinkCmpLabelDetail', { link = 'PmenuExtra' }) -- NOTE: default: PmenuExtra
  hl('BlinkCmpLabelDescription', { link = 'PmenuExtra' }) -- NOTE: default: PmenuExtra

  hl('BlinkCmpKind', { link = 'String' }) -- NOTE: default: PmenuKind
  iterate('BlinkCmpKind', kinds) -- NOTE: default: PmenuKind

  hl('BlinkCmpSource', { fg = c.diag.hint, bold = true }) -- NOTE: default: PmenuExtra
  hl('BlinkCmpGhostText', { link = 'LspInlayHint' }) -- NOTE: default: NonText
  hl('BlinkCmpDoc', { link = 'NormalFloat' }) -- NOTE: default: NormalFloat
  hl('BlinkCmpDocBorder', { link = 'NormalFloat' }) -- NOTE: default: NormalFloat
  hl('BlinkCmpDocSeparator', { link = 'NormalFloat' }) -- NOTE: default: NormalFloat
  hl('BlinkCmpDocCursorLine', { link = 'CursorLine' }) -- NOTE: default: Visual
  hl('BlinkCmpSignatureHelp', { link = 'NormalFloat' }) -- NOTE: default: NormalFloat
  hl('BlinkCmpSignatureHelpBorder', { link = 'NormalFloat' }) -- NOTE: default: NormalFloat
  hl('BlinkCmpSignatureHelpActiveParameter', { link = 'LspSignatureActiveParameter' }) -- NOTE: default: LspSignatureActiveParameter
end

return M
