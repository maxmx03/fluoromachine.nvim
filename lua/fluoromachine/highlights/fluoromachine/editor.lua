---@type fm.highlights
local M = {}

M.load = function(opts)
  local config = opts.config
  local hl = opts.utils.set_hl
  local c = opts.colors
  local darken = opts.color.darken
  local lighten = opts.color.lighten

  -- :h highlights-groups
  if config.transparent then
    hl('ColorColumn', { bg = c.bg })
  else
    hl('ColorColumn', { bg = c.bgdark })
  end

  if config.glow then
    hl('LineNr', { fg = darken(c.purple, 50), bg = c.bg }, { transparent = config.transparent })
    hl('CursorLineNr', { fg = c.purple, bg = c.bg, bold = true }, { transparent = config.transparent })
  else
    hl('LineNr', { fg = c.comment, bg = c.bg }, { transparent = config.transparent })
    hl('CursorLineNr', { fg = c.pink, bg = c.bg }, { transparent = config.transparent })
  end

  hl('Conceal', { fg = c.pink })
  hl('CurSearch', { fg = lighten(c.fg, 100), bg = c.editor.selection })
  hl('Cursor', { fg = c.editor.cursor_fg, bg = c.editor.cursor_bg })
  hl('lCursor', { link = 'Cursor' })
  hl('CursorIM', { link = 'Cursor' })
  hl('CursorColumn', { link = 'ColorColumn' })
  hl('CursorLine', { bg = c.editor.currentline })
  hl('Directory', { fg = c.yellow })
  hl('DiffAdd', { fg = c.git.add })
  hl('DiffChange', { fg = c.git.change })
  hl('DiffDelete', { fg = c.bg, bg = c.git.delete })
  hl('DiffText', { fg = c.cyan, reverse = true })
  hl('EndOfBuffer', { fg = c.bg })
  hl('TermCursor', { link = 'Cursor' })
  hl('TermCursorNC', { link = 'Cursor' })
  hl('ErrorMsg', { fg = c.diag.error })
  hl('WinSeparator', { fg = c.editor.separator, bg = c.bgdark }, { transparent = config.transparent })
  hl('Folded', { fg = c.comment, bg = c.editor.selection })
  hl('FoldColumn', { fg = c.fg, bg = c.bg })
  hl('SignColumn', { bg = c.bg }, { transparent = config.transparent })
  hl('IncSearch', { fg = c.green }, { transparent = config.transparent })
  hl('Substitute', { link = 'IncSearch' })
  hl('LineNrAbove', { link = 'LineNr' })
  hl('LineNrBelow', { link = 'LineNr' })
  hl('CursorLineFold', { link = 'FoldColumn' })
  hl('CursorLineSign', { link = 'SignColumn' })
  hl('MatchParen', { fg = c.diag.hint })
  hl('ModeMsg', { link = 'Normal' })
  hl('MsgArea', { link = 'Normal' })
  hl('MsgSeparator', { link = 'Normal' })
  hl('MoreMsg', { fg = c.cyan, bold = true })
  hl('NonText', { fg = c.comment })
  hl('Normal', { fg = c.fg, bg = c.bg }, { transparent = config.transparent })
  hl('NormalFloat', { fg = c.fg, bg = c.bgdark })
  hl('FloatBorder', { link = 'WinSeparator' })
  hl('FloatTitle', { link = 'Title' })
  hl('NormalNC', { link = 'Normal' })
  hl('Pmenu', { link = 'NormalFloat' })
  hl('PmenuSel', { bg = c.editor.selection })
  hl('PmenuKind', { link = 'Pmenu' })
  hl('PmenuKindSel', { link = 'PmenuSel' })
  hl('PmenuExtra', { link = 'Pmenu' })
  hl('PmenuExtraSel', { link = 'PmenuSel' })
  hl('PmenuSbar', { link = 'NormalFloat' })
  hl('PmenuThumb', { bg = c.pink })
  hl('Question', { fg = c.cyan, bold = true })
  hl('QuickFixLine', { bg = c.editor.selection })
  hl('Search', { link = 'Visual' })
  hl('SpecialKey', { fg = c.yellow, bold = true })
  hl('SpellBad', { fg = c.diag.error, sp = c.diag.error, underline = true })
  hl('SpellCap', { fg = c.diag.hint, sp = c.diag.hint, underline = true })
  hl('SpellLocal', { fg = c.diag.info, sp = c.diag.info, underline = true })
  hl('SpellRare', { fg = c.diag.warning, sp = c.diag.warning, underline = true })
  hl('StatusLine', { fg = c.fg, bg = c.bgdark })
  hl('StatusLineNC', { fg = c.bgdark, bg = c.bgdark })
  hl('TabLine', { bg = c.bgdark })
  hl('TabLineFill', { fg = c.fg, bg = c.bgdark })
  hl('TabLineSel', { fg = c.yellow, bg = c.bg })
  hl('Title', { fg = c.yellow, bold = true })
  hl('Visual', { bg = c.editor.selection })
  hl('VisualNOS', { link = 'Visual' })
  hl('WarningMsg', { fg = c.diag.warning })
  hl('Whitespace', { fg = c.comment })
  hl('WildMenu', { bg = c.editor.selection })
  hl('WinBar', { link = 'Pmenu' })
  hl('WinBarNC', { link = 'WinBar' })
end

return M
