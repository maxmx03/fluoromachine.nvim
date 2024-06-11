---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  hl('Comment', { fg = c.comment }, { styles = config.styles.comments }) -- any comment
  hl('Constant', { fg = c.red, bold = config.glow }, { styles = config.styles.constants, glow = config.glow }) -- any constant
  hl('String', { fg = c.orange }) -- a string constant: "this is a string"
  hl('Character', { link = 'String' }) -- a character constant: 'c', '\n'
  hl('Number', { link = 'Constant' }, { styles = config.styles.numbers }) -- a number constant: 234, 0xff
  hl('Boolean', { link = 'Constant' }) -- a boolean constant: TRUE, false
  hl('Float', { link = 'Constant' }) -- a floating point constant: 2.3e10
  hl('Identifier', { fg = c.fg }, { styles = config.styles.variables }) -- any variable name
  hl('Function', { fg = c.yellow, bold = config.glow }, { styles = config.styles.functions, glow = config.glow }) -- function name (also: methods for classes)
  hl('Statement', { link = 'Keyword' }) -- any statement
  hl('Conditional', { link = 'Keyword' }) -- if, then, else, endif, switch, etc.
  hl('Repeat', { link = 'Keyword' }) -- for, do, while, etc.
  hl('Label', { link = 'Keyword' }) -- case, default, etc.
  hl('Operator', { link = 'Keyword' }) -- "sizeof", "+", "*", etc.
  hl('Keyword', { fg = c.green, bold = config.glow }, { styles = config.styles.keywords, glow = config.glow }) -- any other keyword
  hl('Exception', { link = 'Keyword' }) -- try, catch, throw
  hl('PreProc', { link = 'Keyword' }) -- generic Preprocessor
  hl('Include', { link = 'Keyword' }) -- preprocessor #include
  hl('Define', { link = 'Keyword' }) -- preprocessor #define
  hl('Macro', { link = 'Keyword' }) -- same as Define
  hl('PreCondit', { link = 'Keyword' }) -- preprocessor #if, #else, #endif, etc.
  hl('Type', { fg = c.pink }, { styles = config.styles.types }) -- int, long, char, etc.
  hl('StorageClass', { link = 'Keyword' }) -- static, register, volatile, etc.
  hl('Structure', { fg = c.yellow }) -- struct, union, enum, etc.
  hl('Typedef', { link = 'Keyword' }) -- A typedef
  hl('Special', { fg = c.yellow }) -- special symbol
  hl('SpecialChar', { fg = c.yellow }) -- special character in a constant
  hl('Tag', { link = 'Special' }) -- you can use CTRL-] on this
  hl('Delimiter', { fg = c.cyan }) -- character that needs attention
  hl('SpecialComment', { link = 'Keyword' }) -- special things inside a comment
  hl('Debug', { link = 'Keyword' }) -- debugging statements
  hl('Underlined', { fg = c.cyan, underline = true }) --text that stands out, HTML links
  hl('Ignore') --left blank, hidden  |hl-Ignore|
  hl('Error', { fg = c.diag.error }) --any erroneous construct
  hl('Todo', { fg = c.cyan, bold = true }) --anything that needs extra attention; mostly the keywords TODO FIXME and XXX
end

return M
