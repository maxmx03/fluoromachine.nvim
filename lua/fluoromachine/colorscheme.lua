local chromatic = require 'fluoromachine.chromatic'

local M = {}

M.highlights = {}
M.colors = {
  bg = '#200933',
  fg = '#ffffff',
  comment = '#4E83FD',
  alt_bg = '#190728',
  selection = '#463465',
  blue = '#61E2FF',
  purple = '#AF6DF9',
  pink = '#FC199A',
  green = '#2FFC1D',
  orange = '#FD8902',
  yellow = '#FFCC00',
  red = '#F44747',
  gray = '#73817D',
  info = '#6796E6',
  warn = '#CD9731',
  hint = '#61E2FF',
  error = '#F44747',
  add = '#3CCF4E',
  changed = '#FD8902',
  deleted = '#f44747',
  removed = '#F44747',
}
M.config = {
  transparent = false,
  brightness = 0.15,
  glow = false,
}

function M:new()
  local t = {}

  self.__index = self
  setmetatable(t, self)

  return t
end

function M:setup(t)
  local user_config = t or {}

  self:load()

  if not vim.tbl_isempty(user_config) then
    self:set_user_config(user_config.config)
    self:set_user_colors(user_config.colors)
  end

  if vim.tbl_isempty(self.highlights) then
    self:set_hl()
    self:set_user_hl(user_config.highlights)
  end

  self:apply_hl()
end

function M:load()
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  if vim.fn.exists 'syntax_on' then
    vim.cmd 'syntax reset'
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'fluoromachine'
end

function M:set_user_colors(new_colors)
  if new_colors then
    if type(new_colors) == 'function' then
      self.colors = vim.tbl_extend(
        'force',
        self.colors,
        new_colors(self.colors, chromatic.darken, chromatic.lighten, chromatic.blend)
      )
    elseif type(new_colors) == 'table' then
      self.colors = vim.tbl_extend('force', self.colors, new_colors)
    else
      vim.api.nvim_err_writeln 'Error: invalid colors'
    end
  end
end

function M:set_user_hl(user_hl)
  if user_hl then
    if type(user_hl) == 'function' then
      self.highlights = vim.tbl_extend(
        'force',
        self.highlights,
        user_hl(self.colors, chromatic.darken, chromatic.lighten, chromatic.blend)
      )
    elseif type(user_hl) == 'table' then
      self.highlights = vim.tbl_extend('force', self.highlights, user_hl)
    else
      vim.api.nvim_err_writeln 'Error: invalid highlights'
    end
  end
end

function M:set_user_config(user_config)
  if user_config then
    self.config = vim.tbl_extend('force', self.config, user_config)
  end
end

function M:is_transparent(color)
  if self.config.transparent then
    return 'NONE'
  end

  return color
end

function M:is_not_transparent(color)
  if not self.config.transparent then
    return 'NONE'
  end

  return color
end

function M:apply_hl()
  for group_name, group_config in pairs(self.highlights) do
    local val = {
      fg = 'NONE',
      bg = 'NONE',
    }

    val = vim.tbl_extend('force', val, group_config)

    vim.api.nvim_set_hl(0, group_name, val or {})
  end
end

function M:set_hl()
  local alpha = self.config.brightness
  local darken = chromatic.darken
  local blend = chromatic.blend

  self.colors.darker_purple = darken(self.colors.purple, 20)
  self.colors.darker_pink = darken(self.colors.pink, 20)

  self.highlights = {
    -- BASE
    Comment = { fg = self.colors.comment, italic = vim.g.fluoromachine_italic_comments and true },
    ColorColumn = { bg = self.colors.bg },
    Conceal = { fg = self.colors.blue },
    Cursor = { fg = self.colors.bg, bg = self.colors.purple },
    CursorColumn = { bg = self.colors.bg },
    CursorLineNr = { fg = self.colors.pink, sp = self.colors.fg },
    CursorLine = { bg = self.colors.selection, sp = self.colors.fg },
    lCursor = { link = 'Cursor' },
    -- CursorIM = { fg = self.colors.bg, bg = self.colors.fg },
    MatchWord = { bold = true },
    MatchParen = { fg = self.colors.pink, bold = true },
    MatchWordCur = { bold = true },
    MatchParenCur = { bold = true },
    Normal = { fg = self.colors.fg, bg = self:is_transparent(self.colors.bg) },
    NormalNC = { link = 'Normal' },
    NormalFloat = { fg = self.colors.fg, bg = self:is_transparent(self.colors.alt_bg) },
    Pmenu = { fg = self.colors.fg, bg = self:is_transparent(self.colors.alt_bg), bold = true },
    PmenuSel = { bg = self.colors.selection, bold = true },
    PmenuSbar = { bg = self.colors.bg, bold = true },
    PmenuThumb = { bg = self.colors.pink, bold = true },
    TabLine = { fg = self.colors.fg, bg = self.colors.bg, sp = self.colors.fg },
    TabLineSel = { fg = self.colors.fg, bg = self.colors.selection, sp = self.colors.fg, reverse = true },
    TabLineFill = { fg = self.colors.fg, bg = self.colors.bg, sp = self.colors.fg },
    StatusLine = { fg = self.colors.pink, bg = self.colors.selection },
    StatusLineNC = { fg = self.colors.purple, bg = self.colors.selection },
    FloatBorder = {
      fg = self.colors.pink,
      sp = self.colors.pink,
    },
    SignColumn = { fg = self.colors.red },
    MsgArea = { fg = self.colors.fg, bg = self:is_transparent(self.colors.bg) },
    ModeMsg = { fg = self.colors.blue },
    MsgSeparator = { fg = self.colors.fg, bg = self.colors.bg },
    MoreMsg = { fg = self.colors.blue },
    NonText = { fg = self.colors.purple },
    SpellBad = { sp = self.colors.error, undercurl = true },
    SpellCap = { sp = self.colors.purple, undercurl = true },
    SpellLocal = { sp = self.colors.warn, undercurl = true },
    SpellRare = { sp = self.colors.blue, undercurl = true },
    WildMenu = { fg = self.colors.bg, bg = self.colors.bg, reverse = true, bold = true },
    Folded = { fg = self.colors.fg, bg = self.colors.bg, sp = self.colors.bg },
    FoldColumn = { fg = self.colors.fg, bg = self.colors.bg },
    LineNr = { fg = self.colors.darker_purple, bg = self:is_transparent(self.colors.bg) },
    Whitespace = { fg = self.colors.bg },
    WinSeparator = { fg = self.colors.darker_purple },
    VertSplit = { link = 'WinSeparator' },
    Visual = { bg = self.colors.selection },
    VisualNOS = { bg = self.colors.bg, reverse = true, bold = true },
    DiffAdd = { fg = self.colors.add },
    DiffChange = { fg = self.colors.changed, sp = self.colors.changed },
    DiffDelete = { fg = self.colors.deleted, reverse = true },
    DiffText = { fg = self.colors.blue, sp = self.colors.blue },
    DiffAdded = { link = 'DiffAdd' },
    DiffChanged = { link = 'DiffChange' },
    DiffRemoved = { link = 'DiffDelete' },
    DiffFile = { fg = self.colors.comment },
    DiffIndexLine = { fg = self.colors.purple },
    QuickFixLine = { bg = self.colors.bg },
    TermCursor = { bg = self.colors.purple },
    TermCursorNC = { bg = self.colors.purple },
    Directory = { fg = self.colors.blue },
    SpecialKey = { fg = self.colors.red },
    Title = { fg = self.colors.yellow, bold = true },
    Search = { fg = self.colors.orange },
    IncSearch = { fg = self.colors.yellow },
    Substitute = { fg = self.colors.orange, reverse = true },
    Question = { fg = self.colors.blue, bold = true },
    EndOfBuffer = { fg = self.colors.bg },
    Constant = { fg = self.colors.purple },
    --       *Constant        any constant
    --        String          a string constant: "this is a string"
    --        Character       a character constant: 'c', '\n'
    --        Number          a number constant: 234, 0xff
    --        Boolean         a boolean constant: TRUE, false
    --        Float           a floating point constant: 2.3e10
    String = { fg = self.colors.purple },
    -- Character = { fg = self.colors.purple },
    -- Number = { fg = self.colors.purple },
    -- Boolean = { fg = self.colors.purple },
    -- Float = { fg = self.colors.purple },
    Identifier = { fg = self.colors.pink },
    --       *Identifier      any variable name
    -- Function        function name (also: methods for classes)
    -- Variable = { fg = self.colors.blue },
    Function = { fg = self.colors.yellow, italic = vim.g.fluoromachine_italic_functions or false },
    Statement = { fg = self.colors.pink },
    --       *Statement       any statement
    --        Conditional     if, then, else, endif, switch, etc.
    --        Repeat          for, do, while, etc.
    --        Label           case, default, etc.
    --        Operator        "sizeof", "+", "*", etc.
    --        Keyword         any other keyword
    --        Exception       try, catch, throw
    -- Conditional = { fg = self.colors.pink },
    -- Repeat = { fg = self.colors.pink },
    -- Label = { fg = self.colors.pink },
    -- Operator = { fg = self.colors.pink },
    Keyword = { fg = self.colors.pink, italic = vim.g.fluoromachine_italic_keywords or false },
    -- Exception = { fg = self.colors.pink },

    PreProc = { fg = self.colors.purple },
    --       *PreProc         generic Preprocessor
    --        Include         preprocessor #include
    --        Define          preprocessor #define
    --        Macro           same as Define
    --        PreCondit       preprocessor #if, #else, #endif, etc.
    Include = { fg = self.colors.pink },
    -- Define = { fg = self.colors.orange },
    -- Macro = { fg = self.colors.orange },
    -- PreCondit = { fg = self.colors.orange },

    Type = { fg = self.colors.pink },
    --       *Type            int, long, char, etc.
    --        StorageClass    static, register, volatile, etc.
    --        Structure       struct, union, enum, etc.
    --        Typedef         A typedef
    -- StorageClass = { fg = self.colors.yellow },
    -- Structure = { fg = self.colors.yellow },
    -- Typedef = { fg = self.colors.yellow },

    Special = { fg = self.colors.yellow },
    --       *Special         any special symbol
    --        SpecialChar     special character in a constant
    --        Tag             you can use CTRL-] on this
    --        Delimiter       character that needs attention
    --        SpecialComment  special things inside a comment
    --        Debug           debugging statements
    -- SpecialChar = { fg = self.colors.red },
    -- Tag = { fg = self.colors.red },
    -- Delimiter = { fg = self.colors.red },
    -- SpecialComment = { fg = self.colors.red },
    -- Debug = { fg = self.colors.red },

    Underlined = { fg = self.colors.purple, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = self.colors.blue, bg = self.colors.bg, bold = true },
    Todo = { link = 'Title' },
    Error = { fg = self.colors.error, bg = self.colors.bg, bold = true },
    ErrorMsg = { fg = self.colors.error },
    WarningMsg = { fg = self.colors.warn },
    -- Treesitter - Misc
    ['@error'] = { fg = self.colors.error },
    ['@operator'] = { fg = self.colors.pink },
    -- Treesitter - Punctuation
    ['@punctuation.delimiter'] = { fg = self.colors.pink },
    ['@punctuation.bracket'] = { fg = self.colors.purple },
    ['@punctuation.special'] = { fg = self.colors.pink },
    -- Treesitter - Literals
    ['@boolean'] = { link = '@constant' },
    ['@number'] = { link = '@constant' },
    ['@float'] = { link = '@constant' },
    -- Treesitter - Functions
    ['@function.call'] = { link = 'Function' },
    ['@function.builtin'] = { link = 'Function' },
    ['@method'] = { link = 'Function' },
    ['@method.call'] = { link = 'Function' },
    ['@constructor'] = { fg = self.colors.purple, bg = blend(self.colors.purple, self.colors.bg, 0.05) },
    ['@parameter'] = { fg = self.colors.blue, italic = true },
    -- Treesitter - Keywords
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.return'] = { link = 'Keyword' },
    ['@conditional'] = { link = 'Keyword' },
    ['@conditional.ternary'] = { link = 'Keyword' },
    ['@repeat'] = { link = 'Keyword' },
    ['@label'] = { fg = self.colors.pink },
    ['@include'] = { link = 'Include' },
    ['@exception'] = { link = 'Include' },
    -- Treesitter - Types
    ['@type'] = { fg = self.colors.purple },
    ['@type.qualifier'] = { fg = self.colors.pink },
    ['@type.builtin'] = { fg = self.colors.pink },
    ['@field'] = { fg = self.colors.pink },
    ['@property'] = { fg = self.colors.blue },
    -- Treesitter - Identifiers
    ['@variable'] = { fg = self.colors.blue, italic = vim.g.fluoromachine_italic_variables or false },
    ['@variable.builtin'] = { fg = self.colors.purple },
    ['@constant'] = { fg = self.colors.purple },
    ['@constant.builtin'] = { link = '@constant' },
    ['@constant.macro'] = { link = '@constant' },
    -- Treesitter - Tags
    ['@tag'] = { fg = self.colors.yellow },
    ['@tag.attribute'] = { fg = self.colors.pink },
    ['@tag.delimiter'] = { fg = self.colors.blue },
    -- DIAGNOSTIC
    DiagnosticError = { fg = self.colors.error },
    DiagnosticWarn = { fg = self.colors.warn },
    DiagnosticInfo = { fg = self.colors.info },
    DiagnosticHint = { fg = self.colors.hint },
    DiagnosticVirtualTextError = { fg = self.colors.error, bg = self.colors.error_bg },
    DiagnosticVirtualTextWarn = { fg = self.colors.warn, bg = self.colors.warn_bg },
    DiagnosticVirtualTextInfo = { fg = self.colors.info, bg = blend(self.colors.info, self.colors.bg, alpha) },
    DiagnosticVirtualTextHint = { fg = self.colors.hint, bg = blend(self.colors.hint, self.colors.bg, alpha) },
    DiagnosticUnderlineError = { undercurl = true, sp = self.colors.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = self.colors.warn },
    DiagnosticUnderlineInfo = { undercurl = true, sp = self.colors.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = self.colors.hint },
    -- Lspsaga
    TitleString = { link = 'Title' },
    TitleIcon = { fg = self.colors.yellow, bg = self.colors.yellow_bg },
    SagaNormal = { link = 'Normal' },
    SagaBorder = { link = 'FloatBorder' },
    SagaExpand = { fg = self.colors.red },
    SagaCollapse = { fg = self.colors.red },
    SagaBeacon = { bg = self.colors.pink },
    -- LSPSAGA - code action
    ActionPreviewNormal = { link = 'SagaNormal' },
    ActionPreviewBorder = { link = 'SagaBorder' },
    ActionPreviewTitle = { fg = self.colors.purple, bg = self.colors.bg_alt },
    CodeActionNormal = { link = 'SagaNormal' },
    CodeActionBorder = { link = 'SagaBorder' },
    CodeActionText = { link = 'String' },
    CodeActionNumber = { link = 'Number' },
    -- LSPSAGA - finder
    FinderSelection = { link = 'PmenuSel' },
    FinderFileName = { fg = self.colors.fg },
    FinderCount = { link = 'Label' },
    FinderIcon = { fg = self.colors.red, bg = self.colors.red_bg },
    FinderType = { fg = self.colors.purple },
    -- lSPSAGA - finder spinner
    FinderSpinnerTitle = { link = 'Title' },
    FinderSpinner = { fg = self.colors.green, bold = true },
    FinderPreviewSearch = { link = 'Search' },
    FinderVirtText = { fg = self.colors.red },
    FinderNormal = { link = 'SagaNormal' },
    FinderBorder = { link = 'SagaBorder' },
    FinderPreviewBorder = { link = 'SagaBorder' },
    -- LSPSAGA - definition
    DefinitionBorder = { link = 'SagaBorder' },
    DefinitionNormal = { link = 'SagaNormal' },
    DefinitionSearch = { link = 'Search' },
    -- LSPSAGA - hover
    HoverNormal = { link = 'SagaNormal' },
    HoverBorder = { link = 'SagaBorder' },
    -- LSPSAGA - rename
    RenameBorder = { link = 'SagaBorder' },
    RenameNormal = { fg = self.colors.orange, bg = self.colors.bg_alt },
    RenameMatch = { link = 'Search' },
    -- LSPSAGA - diagnostic
    DiagnosticBorder = { link = 'SagaBorder' },
    DiagnosticSource = { fg = 'gray' },
    DiagnosticNormal = { link = 'SagaNormal' },
    DiagnosticPos = { fg = self.colors.gray },
    DiagnosticWord = { fg = self.colors.fg },
    --  LSPSAGA - Call Hierachry
    CallHierarchyNormal = { link = 'SagaNormal' },
    CallHierarchyBorder = { link = 'SagaBorder' },
    CallHierarchyIcon = { fg = self.colors.purple },
    CallHierarchyTitle = { fg = self.colors.red },
    -- LSPSAGA - lightbulb
    LspSagaLightBulb = { link = 'DiagnosticSignHint' },
    -- LSPSAGA - shadow
    SagaShadow = { bg = self.colors.bg_alt },
    -- LSPSAGA- Outline
    OutlineIndent = { fg = self.colors.magenta },
    OutlinePreviewBorder = { link = 'SagaNormal' },
    OutlinePreviewNormal = { link = 'SagaBorder' },
    -- LSPSAGA - Float term
    TerminalBorder = { link = 'SagaBorder' },
    TerminalNormal = { link = 'SagaNormal' },
    -- CMP KIND
    CmpItemAbbrDeprecated = { fg = self.colors.gray, strikethrough = true },
    CmpItemAbbrMatch = { link = 'IncSearch' },
    CmpItemAbbrMatchFuzzy = { fg = self.colors.yellow, reverse = true },
    CmpItemKindFunction = { link = '@function' },
    CmpItemKindMethod = { link = '@method' },
    CmpItemKindConstructor = { link = '@constructor' },
    CmpItemKindClass = { link = '@type' },
    CmpItemKindEnum = { link = '@constant' },
    CmpItemKindEvent = { fg = self.colors.yellow },
    CmpItemKindInterface = { link = '@constructor' },
    CmpItemKindStruct = { link = '@type' },
    CmpItemKindVariable = { link = '@variable.builtin' },
    CmpItemKindField = { link = '@property' },
    CmpItemKindProperty = { link = '@property' },
    CmpItemKindEnumMember = { link = '@constant.builtin' },
    CmpItemKindConstant = { link = '@contant.builtin' },
    CmpItemKindKeyword = { link = '@keyword' },
    CmpItemKindModule = { link = '@function' },
    CmpItemKindValue = { fg = self.colors.fg },
    CmpItemKindUnit = { link = '@number' },
    CmpItemKindText = { link = '@string' },
    CmpItemKindSnippet = { fg = self.colors.fg },
    CmpItemKindFile = { fg = self.colors.fg },
    CmpItemKindFolder = { fg = self.colors.fg },
    CmpItemKindColor = { fg = self.colors.fg },
    CmpItemKindReference = { fg = self.colors.fg },
    CmpItemKindOperator = { link = '@operator' },
    CmpItemKindTypeParameter = { fg = self.colors.purple },
    CmpItemKindTabnine = { fg = self.colors.pink },
    CmpItemKindEmoji = { fg = self.colors.yellow },
    -- NVIM-TREE
    NvimTreeNormal = { fg = self.colors.fg, bg = self.colors.alt_bg },
    NvimTreeVertSplit = { fg = self.colors.bg },
    NvimTreeFolderIcon = { fg = self.colors.yellow, bg = blend(self.colors.yellow, self.colors.alt_bg, alpha) },
    NvimTreeFolderName = { fg = self.colors.fg },
    NvimTreeOpenedFolderName = { fg = self.colors.yellow, bg = blend(self.colors.yellow, self.colors.alt_bg, alpha) },
    NvimTreeRootFolder = { fg = self.colors.blue },
    NvimTreeLspDiagnosticsError = { fg = self.colors.error },
    NvimTreeLspDiagnosticsWarning = { fg = self.colors.warn },
    NvimTreeLspDiagnosticsInformation = { fg = self.colors.info },
    NvimTreeGitStaged = { fg = self.colors.added },
    NvimTreeGitNew = { fg = self.colors.added },
    NvimTreeGitDeleted = { fg = self.colors.deleted },
    -- NEO-TREE
    NeoTreeDirectoryName = { fg = self.colors.fg },
    NeoTreeDirectoryIcon = { fg = self.colors.yellow, bg = self.colors.yellow_bg },
    NeoTreeRootName = { fg = self.colors.yellow, bg = self.colors.yellow_bg },
    -- TELESCOPE
    TelescopeNormal = { bg = self:is_transparent(self.colors.alt_bg) },
    TelescopeBorder = { fg = self.colors.pink, bg = self.colors.pink_bg },
    TelescopePreviewTitle = { fg = self.colors.pink },
    TelescopeResultsTitle = { fg = self.colors.pink },
    TelescopePromptTitle = { fg = self.colors.pink },
    TelescopeSelection = { fg = self.colors.yellow },
    TelescopeMatching = { link = 'IncSearch' },
    -- DASHBOARD
    DashboardHeader = { fg = blend(self.colors.pink, self.colors.purple, 0.5) },
    DashboardCenter = { fg = self.colors.yellow },
    DashboardFooter = { fg = self.colors.purple },
    -- GIT
    SignAdd = { fg = self.colors.add },
    SignChange = { fg = self.colors.changed },
    SignDelete = { fg = self.colors.deleted },
    GitSignsAdd = { fg = self.colors.add },
    GitSignsChange = { fg = self.colors.changed },
    GitSignsDelete = { fg = self.colors.deleted },
    GitGutterAdd = { fg = self.colors.add },
    GitGutterChange = { fg = self.colors.changed },
    GitGutterDelete = { fg = self.colors.deleted },
    -- HOP
    HopPreview = { fg = self.colors.yellow, bg = self.colors.yellow_bg, bold = true },
    HopNextKey = { fg = self.colors.pink, bg = self.colors.pink_bg, bold = true },
    HopNextKey1 = { fg = self.colors.blue, bg = self.colors.blue_bg, bold = true },
    HopNextKey2 = { fg = darken(self.colors.blue, 15) },
    HopUnmatched = { fg = darken(self.colors.fg, 20) },
    -- TWILIGHT
    Twilight = { fg = self.colors.darker_purple, bg = self:is_transparent(self.colors.bg) },
    -- INDENT_BLANKLINE
    IndentBlanklineChar = {
      fg = self.colors.darker_purple,
      bg = blend(self.colors.darker_purple, self.colors.bg, 0.15),
    },
    IndentBlanklineContextChar = {
      fg = self.colors.darker_pink,
      bg = blend(self.colors.darker_pink, self.colors.bg, 0.15),
    },
    IndentBlanklineSpaceChar = { fg = self.colors.purple, bg = blend(self.colors.purple, self.colors.bg, 0.05) },
    IndentBlanklineContextSpaceChar = { fg = self.colors.pink, bg = blend(self.colors.pink, self.colors.bg, 0.05) },
    -- Whichkey
    WhichKey = { fg = self.colors.pink, bg = self.colors.pink_bg },
    WhichKeySeperator = { link = 'Comment' },
    WhichKeyGroup = { fg = self.colors.yellow },
    WhichKeyDesc = { fg = self.colors.purple },
    WhichKeyFloat = { link = '@float' },
    WhichKeyValue = { link = '@number' },
    WhichKeyBorder = { link = 'FloatBorder' },
    -- Navic
    NavicIconsFile = { fg = self.colors.yellow, bg = self.colors.yellow_bg },
    NavicIconsModule = { link = '@namespace' },
    NavicIconsNamespace = { link = '@namespace' },
    NavicIconsPackage = { fg = self.colors.yellow, bg = self.colors.yellow_bg },
    NavicIconsClass = { link = '@type' },
    NavicIconsMethod = { link = '@method' },
    NavicIconsProperty = { link = '@property' },
    NavicIconsField = { link = '@field' },
    NavicIconsConstructor = { link = '@constructor' },
    NavicIconsEnum = { link = '@keyword' },
    NavicIconsInterface = { link = '@type' },
    NavicIconsFunction = { link = '@function' },
    NavicIconsVariable = { link = '@variable' },
    NavicIconsConstant = { link = '@constant' },
    NavicIconsString = { link = '@string' },
    NavicIconsNumber = { link = '@number' },
    NavicIconsBoolean = { link = '@boolean' },
    NavicIconsArray = { link = 'punctuation.bracket' },
    NavicIconsObject = { link = '@property' },
    NavicIconsKey = { link = '@keyword' },
    NavicIconsKeyword = { link = 'Keyword' },
    NavicIconsNull = { link = '@constant' },
    NavicIconsEnumMember = { link = '@constant' },
    NavicIconsStruct = { link = '@keyword' },
    NavicIconsEvent = { link = 'Special' },
    NavicIconsOperator = { link = '@operator' },
    NavicIconsTypeParameter = { link = '@parameter' },
    NavicText = { link = '@text' },
    NavicSeparator = { fg = self.colors.purple, bg = self.colors.purple_bg },
  }

  if self.config.glow then
    self.colors.orange_bg = blend(self.colors.orange, self.colors.bg, alpha)
    self.colors.purple_bg = blend(self.colors.purple, self.colors.bg, alpha)
    self.colors.yellow_bg = blend(self.colors.orange, self.colors.bg, alpha)
    self.colors.pink_bg = blend(self.colors.pink, self.colors.bg, alpha)
    self.colors.blue_bg = blend(self.colors.blue, self.colors.bg, alpha)
    self.colors.red_bg = blend(self.colors.red, self.colors.bg, alpha)
    self.colors.changed_bg = blend(self.colors.changed, self.colors.bg, alpha)
    self.colors.add_bg = blend(self.colors.add, self.colors.bg, alpha)
    self.colors.error_bg = blend(self.colors.error, self.colors.bg, alpha)
    self.colors.removed_bg = blend(self.colors.removed, self.colors.bg, alpha)
    self.colors.warn_bg = blend(self.colors.warn, self.colors.bg, alpha)

    self.highlights.CursorLineNr = { fg = self.colors.pink, bg = self.colors.pink_bg, sp = self.colors.fg }
    self.highlights.MatchParen = { fg = self.colors.pink, bg = self.colors.pink_bg, bold = true }
    self.highlights.FloatBorder = {
      fg = self.colors.pink,
      bg = self:is_transparent(self.colors.pink_bg),
      sp = self.colors.pink,
    }
    self.highlights.DiffAdd = { fg = self.colors.add, bg = self.colors.add_bg }
    self.highlights.DiffChange = { fg = self.colors.changed, bg = self.colors.changed_bg, sp = self.colors.changed }
    self.highlights.DiffText = { fg = self.colors.blue, bg = self.colors.blue_bg, sp = self.colors.blue }
    self.highlights.DiffRemoved = { fg = self.colors.removed, bg = self.colors.removed_bg }
    self.highlights.DiffAdded = { link = 'DiffAdd' }
    self.highlights.DiffChanged = { link = 'DiffChange' }
    self.highlights.DiffRemoved = { link = 'DiffDelete' }
    self.highlights.Title = { fg = self.colors.yellow, bg = self.colors.yellow_bg, bold = true }
    self.highlights.IncSearch = { fg = self.colors.yellow, bg = self.colors.yellow_bg }
    self.highlights.Identifier = { fg = self.colors.pink, bg = self.colors.pink_bg }
    self.highlights.Function = {
      fg = self.colors.yellow,
      bg = self.colors.yellow_bg,
      italic = vim.g.fluoromachine_italic_functions or false,
    }
    self.highlights.Keyword = {
      fg = self.colors.pink,
      bg = self.colors.pink_bg,
      italic = vim.g.fluoromachine_italic_keywords or false,
    }
    self.highlights.PreProc = { fg = self.colors.purple, bg = self.colors.purple_bg }
    self.highlights.Type = { fg = self.colors.pink, bg = self.colors.pink_bg }
    self.highlights.Special = { fg = self.colors.yellow, bg = self.colors.yellow_bg }
    self.highlights.ErrorMsg = { fg = self.colors.error, bg = self.colors.error_bg }
    self.highlights.WarningMsg = { fg = self.colors.warn, bg = self.colors.warn_bg }
    self.highlights['@label'] = { fg = self.colors.pink, bg = self.colors.pink_bg }
    self.highlights['@tag'] = { fg = self.colors.yellow, bg = self.colors.yellow_bg }
    self.highlights['@tag.attribute'] = { fg = self.colors.pink, bg = self.colors.pink_bg }
    self.highlights['@tag.delimiter'] = { fg = self.colors.blue, bg = self.colors.blue_bg }
  end
end

return M:new()
