---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  -- h: :h group-name
  hl('Comment', { fg = c.comment }, { styles = config.styles.comments })
  hl('Constant', { fg = c.red, bold = config.glow }, { styles = config.styles.constants, glow = config.glow })
  hl('String', { fg = c.orange })
  hl('Character', { link = 'String' })
  hl('Number', { link = 'Constant' }, { styles = config.styles.numbers })
  hl('Boolean', { link = 'Constant' })
  hl('Float', { link = 'Constant' })
  hl('Identifier', { fg = c.fg }, { styles = config.styles.variables })
  hl('Function', { fg = c.yellow, bold = config.glow }, { styles = config.styles.functions, glow = config.glow })
  hl('Statement', { link = 'Keyword' })
  hl('Conditional', { link = 'Keyword' })
  hl('Repeat', { link = 'Keyword' })
  hl('Label', { link = 'Keyword' })
  hl('Operator', { link = 'Keyword' })
  hl('Keyword', { fg = c.green, bold = config.glow }, { styles = config.styles.keywords, glow = config.glow })
  hl('Exception', { link = 'Keyword' })
  hl('PreProc', { link = 'Keyword' })
  hl('Include', { link = 'Keyword' })
  hl('Define', { link = 'Keyword' })
  hl('Macro', { link = 'Keyword' })
  hl('PreCondit', { link = 'Keyword' })
  hl('Type', { fg = c.pink }, { styles = config.styles.types })
  hl('StorageClass', { link = 'Keyword' })
  hl('Structure', { fg = c.yellow })
  hl('Typedef', { link = 'Keyword' })
  hl('Special', { fg = c.yellow })
  hl('SpecialChar', { fg = c.yellow })
  hl('Tag', { link = 'Special' })
  hl('Delimiter', { fg = c.purple })
  hl('SpecialComment', { link = 'Keyword' })
  hl('Debug', { link = 'Keyword' })
  hl('Underlined', { fg = c.cyan, underline = true })
  hl('Ignore')
  hl('Error', { fg = c.diag.error })
  hl('Todo', { fg = c.cyan, bold = true })
end

return M
