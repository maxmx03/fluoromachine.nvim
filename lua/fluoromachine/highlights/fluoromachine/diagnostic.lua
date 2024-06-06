---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors
  local config = opts.config

  hl('DiagnosticError', { fg = c.diag.error }) -- Used as the base highlight group.(except Underline)
  hl('DiagnosticWarn', { fg = c.diag.warning }) --Used as the base highlight group.(except Underline)
  hl('DiagnosticInfo', { fg = c.diag.info }) -- Used as the base highlight group.(except Underline)
  hl('DiagnosticHint', { fg = c.diag.hint }) -- Used as the base highlight group.(except Underline)
  hl('DiagnosticOk', { fg = c.diag.ok }) -- Used as the base highlight group.(except Underline)
  hl('DiagnosticVirtualTextError', { fg = c.diag.error }, { glow = config.glow }) -- Used for "Error" diag virtual text.
  hl('DiagnosticVirtualTextWarn', { fg = c.diag.warning }, { glow = config.glow }) -- Used for "Warn" diag virtual text.
  hl('DiagnosticVirtualTextInfo', { fg = c.diag.info }, { glow = config.glow }) -- Used for "Info" diagnostic virtual text.
  hl('DiagnosticVirtualTextHint', { fg = c.diag.hint }, { glow = config.glow }) -- Used for "Hint" diagnostic virtual text.
  hl('DiagnosticVirtualTextOk', { fg = c.diag.ok }, { glow = config.glow }) -- Used for "Ok" diagnostic virtual text.
  hl('DiagnosticUnderlineError', { fg = c.diag.error, sp = c.diag.error }) --Used to underline "Error" diagnostics.
  hl('DiagnosticUnderlineWarn', { fg = c.diag.warning, sp = c.diag.warning }) -- Used to underline "Warn" diagnostics.
  hl('DiagnosticUnderlineInfo', { fg = c.diag.info, sp = c.diag.info }) -- Used to underline "Info" diagnostics.
  hl('DiagnosticUnderlineHint', { fg = c.diag.hint, sp = c.diag.hint }) -- Used to underline "Hint" diagnostics.
  hl('DiagnosticUnderlineOk', { fg = c.diag.ok, sp = c.diag.ok }) -- Used to underline "Ok" diagnostics.
  -- hl('DiagnosticFloatingError') -- Used to color "Error" diagnostic messages in diagnostics float.
  -- hl('DiagnosticFloatingWarn') -- Used to color "Warn" diagnostic messages in diagnostics float.
  -- hl('DiagnosticFloatingInfo') -- Used to color "Info" diagnostic messages in diagnostics float.
  -- hl('DiagnosticFloatingHint') -- Used to color "Hint" diagnostic messages in diagnostics float.
  -- hl('DiagnosticFloatingOk') -- Used to color "Ok" diagnostic messages in diagnostics float.
  -- hl('DiagnosticSignError') -- Used for "Error" signs in sign column.
  -- hl('DiagnosticSignWarn') -- Used for "Warn" signs in sign column.
  -- hl('DiagnosticSignInfo') -- Used for "Info" signs in sign column.
  -- hl('DiagnosticSignHint') -- Used for "Hint" signs in sign column.
  -- hl('DiagnosticSignOk') -- Used for "Ok" signs in sign column.
  -- hl('DiagnosticDeprecated') -- Used for deprecated or obsolete code.
  -- hl('DiagnosticUnnecessary') -- Used for unnecessary or unused code.
end

return M
