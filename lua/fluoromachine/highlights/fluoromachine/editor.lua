local function editor(c, config)
  local hl = require('fluoromachine.utils').set_hl

  if config.transparent then
    hl('ColorColumn', { bg = c.bg }) -- used for columns
  else
    hl('ColorColumn', { bg = c.bgdark }) -- used for columns
  end

  hl('Conceal', { fg = c.pink }) -- placeholder characters
  hl('CurSearch', { fg = c.editor.selection, reverse = true }) -- highlight under cursor
  hl('Cursor', { fg = c.editor.cursor_fg, bg = c.editor.cursor_bg }) -- character under cursor
  hl('lCursor', { link = 'Cursor' }) -- character under the cursor
  hl('CursorIM', { link = 'Cursor' }) -- like cursor, but IME mode
  hl('CursorColumn', { link = 'ColorColumn' }) -- screen-column at the cursor
  hl('CursorLine', { bg = c.editor.currentline }) -- screen-line at the cursor
  hl('Directory', { fg = c.yellow }) -- directory names
  hl('DiffAdd', { fg = c.git.add }) -- Added line
  hl('DiffChange', { fg = c.git.change }) -- Changed line
  hl('DiffDelete', { fg = c.bg, bg = c.git.delete }) -- Deleted line
  hl('DiffText', { fg = c.cyan, reverse = true }) -- Changed Text
  hl('EndOfBuffer', { fg = c.bg }) -- Filler lines (~)
  hl('TermCursor', { link = 'Cursor' }) -- Cursor in a focused terminal
  hl('TermCursorNC', { link = 'Cursor' }) -- Cursor in an unfocused terminal
  hl('ErrorMsg', { fg = c.diagnostic.error }) -- Error messages on the command line
  hl(
    'WinSeparator',
    { fg = c.editor.separator, bg = c.bgdark },
    { transparent = config.transparent }
  ) -- Separators between window splits
  hl('Folded', { fg = c.comment, bg = c.editor.selection }) -- Line used for closed folds
  hl('FoldColumn', { fg = c.fg, bg = c.bg }) -- 'foldcolumn'
  hl('SignColumn', { bg = c.bg }, { transparent = config.transparent }) -- Column were signs are displayed
  hl('IncSearch', { fg = c.cyan }, { transparent = config.transparent }) -- 'incsearch' highlighting, also for the text replaced
  hl('Substitute', { link = 'IncSearch' }) -- :substitute replacement text highlight
  hl(
    'LineNr',
    { fg = c.comment, bg = c.bg },
    { transparent = config.transparent }
  ) -- Line number for ":number" and ":#" commands
  hl('LineNrAbove', { link = 'LineNr' }) -- Line number, above the cursor line
  hl('LineNrBelow', { link = 'LineNr' }) -- Line number, below the cursor
  hl(
    'CursorLineNr',
    { fg = c.pink, bg = c.bg },
    { transparent = config.transparent }
  ) -- Like LineNr when 'cursorline' is set
  hl('CursorLineFold', { link = 'FoldColumn' }) -- Like FoldColumn when 'cursorline' is set
  hl('CursorLineSign', { link = 'SignColumn' }) -- Like SignColumn when 'cursorline' is set
  hl('MatchParen', { fg = c.diagnostic.hint }) -- Character under the cursor or just before it
  hl('ModeMsg', { link = 'Normal' }) -- 'showmode' message (e.g., "-- INSERT --")
  hl('MsgArea', { link = 'Normal' }) -- 'Area for messages and cmdline'
  hl('MsgSeparator', { link = 'Normal' }) -- Separator for scrolled messages msgsep.
  hl('MoreMsg', { fg = c.cyan, bold = true }) -- more-prompt
  hl('NonText', { fg = c.comment }) -- '@' at the end of the window
  hl('Normal', { fg = c.fg, bg = c.bg }, { transparent = config.transparent }) -- Normal text
  hl('NormalFloat', { fg = c.fg, bg = c.bgdark }) -- Normal text in floating windows
  hl('FloatBorder', { link = 'WinSeparator' }) -- Border of floating windows.
  hl('FloatTitle', { link = 'Title' }) -- Title of float windows.
  hl('NormalNC', { link = 'Normal' }) -- Normal text in non-current windows.
  hl('Pmenu', { link = 'NormalFloat' }) -- Popup menu: Normal item
  hl('PmenuSel', { bg = c.editor.selection }) -- Popup menu: Selected item
  hl('PmenuKind', { link = 'Pmenu' }) -- Popup menu: Normal item kind
  hl('PmenuKindSel', { link = 'PmenuSel' }) -- Popup menu: Selected item kind
  hl('PmenuExtra', { link = 'Pmenu' }) -- Popup menu: Normal item extra text
  hl('PmenuExtraSel', { link = 'PmenuSel' }) -- Popup menu: Selected item extra text
  hl('PmenuSbar', { link = 'NormalFloat' }) -- Popup menu: Scrollbar
  hl('PmenuThumb', { bg = c.pink }) -- Popup menu: Thumb of the scrollbar
  hl('Question', { fg = c.cyan, bold = true }) -- hit-enter prompt and yes/no questions.
  hl('QuickFixLine', { bg = c.editor.selection }) -- Current quickfix item in the quickfix window
  hl('Search', { link = 'Visual' }) -- Last search pattern highlighting
  hl('SpecialKey', { fg = c.yellow, bold = true }) -- Unprintable characters: Text displayed differently from what it really is.
  hl(
    'SpellBad',
    { fg = c.diagnostic.error, sp = c.diagnostic.error, underline = true }
  ) -- Word that is not recognized by the spellchecker.
  hl(
    'SpellCap',
    { fg = c.diagnostic.hint, sp = c.diagnostic.hint, underline = true }
  ) -- Word that should start with a capital
  hl(
    'SpellLocal',
    { fg = c.diagnostic.info, sp = c.diagnostic.info, underline = true }
  ) -- Word that is recognized by the spellchecker as one that is used in another region
  hl(
    'SpellRare',
    { fg = c.diagnostic.warning, sp = c.diagnostic.warning, underline = true }
  ) -- Word that is recognized by the spellchecker as one that is hardly ever used.
  hl('StatusLine', { fg = c.fg, bg = c.bgdark }) -- Status line of current window.
  hl('StatusLineNC', { fg = c.bgdark, bg = c.bgdark }) -- Status lines of not-current windows.
  hl('TabLine', { bg = c.bgdark }) -- Tab pages line, not active tab page label.
  hl('TabLineFill', { fg = c.fg, bg = c.bgdark }) -- Tab pages line, where there are no labels.
  hl('TabLineSel', { fg = c.yellow, bg = c.base03 }) -- Tab pages line, active tab page label.
  hl('Title', { fg = c.yellow, bold = true }) -- Titles for output from ":set all", ":autocmd" etc.
  hl('Visual', { bg = c.editor.selection }) -- Visual mode selection.
  hl('VisualNOS', { link = 'Visual' }) -- Visual mode selection when vim is "Not Owning the Selection".
  hl('WarningMsg', { fg = c.diagnostic.warning }) -- Warning messages.
  hl('Whitespace', { bg = c.bg }) -- "nbsp", "space", "tab", "multispace", "lead" and "trail" in 'listchars'.
  hl('WildMenu', { bg = c.base02 }) -- Current match in 'wildmenu' completion.
  hl('WinBar', { link = 'Pmenu' }) -- Window bar of current window.
  hl('WinBarNC', { link = 'WinBar' }) -- Window bar of not-current windows.
end

return editor