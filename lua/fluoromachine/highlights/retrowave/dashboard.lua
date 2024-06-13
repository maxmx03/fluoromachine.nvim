---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  -- general
  hl('DashboardHeader', { fg = c.red })
  hl('DashboardFooter', { fg = c.comment })

  -- Hyper
  hl('DashboardProjectTitle', { fg = c.red })
  hl('DashboardProjectTitleIcon', { link = 'DashboardProjectTitle' })
  hl('DashboardProjectIcon', { link = 'Directory' })
  hl('DashboardMruTitle', { link = 'DashboardProjectTitle' })
  hl('DashboardMruIcon', { link = 'DashboardMruTitle' })
  hl('DashboardFiles', { fg = c.fg })
  hl('DashboardShotCutIcon', { link = 'Operator' })

  -- Doom theme
  hl('DashboardDesc', { link = 'Directory' })
  hl('DashboardKey', { link = 'Operator' })
  hl('DashboardIcon', { link = 'Directory' })
  hl('DashboardShotCut', { fg = c.fg })
end

return M
