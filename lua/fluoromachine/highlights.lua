local fluoromachine = require("fluoromachine.colorscheme")
local colortool = require("fluoromachine.colortool")

local colors = fluoromachine.colors
local darken = colortool.darken
local blend = colortool.blend

fluoromachine.highlights = {
	Comment = { fg = colors.comment, italic = true },
	ColorColumn = { bg = colors.bg },
	Conceal = { fg = colors.blue },
	Cursor = { fg = colors.bg, bg = colors.purple },
	CursorColumn = { bg = colors.bg },
	CursorLineNr = { bg = colors.selection, sp = colors.fg },
	CursorLine = { bg = colors.selection, sp = colors.fg },
	lCursor = { link = "Cursor" },
	-- CursorIM = { fg = colors.bg, bg = colors.fg },
	MatchWord = { bold = true },
	MatchParen = { fg = colors.red, bg = colors.fg, bold = true },
	MatchWordCur = { bold = true },
	MatchParenCur = { bold = true },
	Normal = { fg = colors.fg, bg = fluoromachine:is_transparent(colors.bg) },
	NormalNC = { link = "Normal" },
	NormalFloat = { fg = colors.fg, bg = colors.bg },
	Pmenu = { fg = colors.fg, bg = colors.bg, bold = true },
	PmenuSel = { fg = colors.fg, bg = colors.selection, bold = true },
	PmenuSbar = { fg = colors.bg_alt_invert, bg = colors.fg, reverse = true, bold = true },
	PmenuThumb = { fg = colors.primary, bg = colors.bg, reverse = true, bold = true },
	TabLine = { fg = colors.fg, bg = colors.bg, sp = colors.fg },
	TabLineSel = { fg = colors.fg, bg = colors.selection, sp = colors.fg, reverse = true },
	TabLineFill = { fg = colors.fg, bg = colors.bg, sp = colors.fg },
	FloatBorder = { fg = colors.fg, bg = colors.bg, sp = colors.fg },
	SignColumn = { fg = colors.fg },
	MsgArea = { fg = colors.fg, bg = fluoromachine:is_transparent(colors.bg) },
	ModeMsg = { fg = colors.blue },
	MsgSeparator = { fg = colors.fg, bg = colors.bg },
	MoreMsg = { fg = colors.blue },
	NonText = { fg = colors.fg },
	SpellBad = { sp = colors.error, undercurl = true },
	SpellCap = { sp = colors.purple, undercurl = true },
	SpellLocal = { sp = colors.warn, undercurl = true },
	SpellRare = { sp = colors.cyan, undercurl = true },
	WildMenu = { fg = colors.bg, bg = colors.bg, reverse = true, bold = true },
	Folded = { fg = colors.fg, bg = colors.bg, sp = colors.bg },
	FoldColumn = { fg = colors.fg, bg = colors.bg },
	LineNr = { fg = colors.comment, bg = colors.bg },
	Whitespace = { fg = colors.bg },
	VertSplit = { fg = colors.fg, bg = colors.bg },
	Visual = { fg = colors.comment, bg = colors.bg, reverse = true, bold = true },
	VisualNOS = { bg = colors.bg, reverse = true, bold = true },
	-- DiffAdd = { fg = colors.added, sp = colors.added, reverse = true },
	-- DiffChange = { fg = colors.changed, sp = colors.changed, reverse = true },
	-- DiffDelete = { fg = colors.deleted, reverse = true },
	-- DiffText = { fg = colors.blue, sp = colors.blue, reverse = true },
	-- DiffAdded = { fg = colors.added, reverse = true },
	-- DiffChanged = { fg = colors.changed, reverse = true },
	-- DiffRemoved = { fg = colors.removed, reverse = true },
	DiffFile = { fg = colors.comment },
	DiffIndexLine = { fg = colors.purple },
	QuickFixLine = { bg = colors.bg },
	-- TermCursor = { fg = colors.bg, bg = colors.fg },
	-- TermCursorNC = { fg = colors.bg, bg = colors.fg },
	Directory = { fg = colors.blue },
	SpecialKey = { fg = colors.red },
	Title = { fg = colors.orange, bold = true },
	Search = { fg = colors.yellow, reverse = true },
	IncSearch = { fg = colors.orange },
	Substitute = { fg = colors.orange, reverse = true },
	Question = { fg = colors.cyan, bold = true },
	EndOfBuffer = { fg = colors.bg },

	Constant = { fg = colors.purple, bg = blend(colors.purple, colors.bg, 0.15) },
	--       *Constant        any constant
	--        String          a string constant: "this is a string"
	--        Character       a character constant: 'c', '\n'
	--        Number          a number constant: 234, 0xff
	--        Boolean         a boolean constant: TRUE, false
	--        Float           a floating point constant: 2.3e10
	-- String = { fg = colors.cyan },
	-- Character = { fg = colors.cyan },
	-- Number = { fg = colors.cyan },
	-- Boolean = { fg = colors.cyan },
	-- Float = { fg = colors.cyan },
	Identifier = { fg = colors.pink, bg = blend(colors.pink, colors.bg, 0.15) },
	--       *Identifier      any variable name
	--        Function        function name (also: methods for classes)
	-- Variable = { fg = colors.blue },
	-- Function = { fg = colors.blue },

	Statement = { fg = colors.pink, bg = blend(colors.pink, colors.bg, 0.15) },
	--       *Statement       any statement
	--        Conditional     if, then, else, endif, switch, etc.
	--        Repeat          for, do, while, etc.
	--        Label           case, default, etc.
	--        Operator        "sizeof", "+", "*", etc.
	--        Keyword         any other keyword
	--        Exception       try, catch, throw
	-- Conditional = { fg = colors.green },
	-- Repeat = { fg = colors.green },
	-- Label = { fg = colors.green },
	-- Operator = { fg = colors.green },
	-- Keyword = { fg = colors.green },
	-- Exception = { fg = colors.green },

	PreProc = { fg = colors.purple, bg = blend(colors.purple, colors.bg, 0.15) },
	--       *PreProc         generic Preprocessor
	--        Include         preprocessor #include
	--        Define          preprocessor #define
	--        Macro           same as Define
	--        PreCondit       preprocessor #if, #else, #endif, etc.
	-- Include = { fg = colors.green },
	-- Define = { fg = colors.orange },
	-- Macro = { fg = colors.orange },
	-- PreCondit = { fg = colors.orange },

	Type = { fg = colors.pink, bg = blend(colors.pink, colors.bg, 0.15) },
	--       *Type            int, long, char, etc.
	--        StorageClass    static, register, volatile, etc.
	--        Structure       struct, union, enum, etc.
	--        Typedef         A typedef
	-- StorageClass = { fg = colors.yellow },
	-- Structure = { fg = colors.yellow },
	-- Typedef = { fg = colors.yellow },

	Special = { fg = colors.yellow, bg = blend(colors.yellow, colors.bg, 0.15) },
	--       *Special         any special symbol
	--        SpecialChar     special character in a constant
	--        Tag             you can use CTRL-] on this
	--        Delimiter       character that needs attention
	--        SpecialComment  special things inside a comment
	--        Debug           debugging statements
	-- SpecialChar = { fg = colors.red },
	-- Tag = { fg = colors.red },
	-- Delimiter = { fg = colors.red },
	-- SpecialComment = { fg = colors.red },
	-- Debug = { fg = colors.red },

	Underlined = { fg = colors.purple, underline = true },
	Bold = { bold = true },
	Italic = { italic = true },
	Ignore = { fg = colors.cyan, bg = colors.bg, bold = true },
	Todo = { fg = colors.red, bg = colors.bg, bold = true },
	Error = { fg = colors.error, bg = colors.bg, bold = true },
	ErrorMsg = { fg = colors.error, reverse = true },
	WarningMsg = { fg = colors.warn, bold = true },
}
