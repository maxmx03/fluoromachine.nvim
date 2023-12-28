---@class fm.config.colors.editor
---@field cursor_fg? string
---@field cursor_bg? string
---@field currentline? string
---@field selection? string

---@class fm.config.colors.diagnostic
---@field info? string
---@field hint? string
---@field warning? string
---@field error? string
---@field ok? string

---@class fm.config.colors.git
---@field add? string
---@field change? string
---@field delete? string

---@class fm.config.colors.lsp
---@field inlay_hint string

---@class fm.config.colors
---@field bg? string
---@field bgdark? string
---@field cyan? string
---@field green? string
---@field orange? string
---@field pink? string
---@field purple? string
---@field red? string
---@field yellow? string
---@field comment? string
---@field editor? fm.colors.editor
---@field diagnostic? fm.colors.diagnostic
---@field git? fm.colors.git
---@field lsp? fm.colors.lsp

---@class fm.config.plugins
---@field bufferline? boolean
---@field cmp? boolean
---@field diagnostic? boolean
---@field editor? true
---@field gitsign? boolean
---@field hop? boolean
---@field illuminate? boolean
---@field indentblankline? boolean
---@field lsp? boolean
---@field navic? boolean
---@field saga? boolean
---@field semantic? boolean
---@field syntax? true
---@field treesitter? boolean

---@class fm.config.styles
---@field comments? vim.api.keyset.highlight
---@field functions? vim.api.keyset.highlight
---@field variables? vim.api.keyset.highlight
---@field numbers? vim.api.keyset.highlight
---@field constants? vim.api.keyset.highlight
---@field parameters? vim.api.keyset.highlight
---@field keywords? vim.api.keyset.highlight
---@field types? vim.api.keyset.highlight

---@alias fm.config.theme 'fluoromachine' | 'retrowave' | 'delta'
---@class fm.config.default
---@field theme? fm.config.theme
---@field brightness? number
---@field glow? boolean
---@field styles? fm.config.styles
---@field colors? fm.config.colors | fun(colors: fm.colors, color: fm.color): fm.config.colors
---@field overrides? table | fun(colors: fm.colors, color: fm.color): table
---@field plugins? fm.config.plugins