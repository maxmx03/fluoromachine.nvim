---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local c = opts.colors

  -- general
  hl('DashboardHeader', { fg = c.purple })
  hl('DashboardFooter', { fg = c.comment })

  -- Hyper
  hl('DashboardProjectTitle', { fg = c.purple })
  hl('DashboardProjectTitleIcon', { link = 'DashboardProjectTitle' })
  hl('DashboardProjectIcon', { link = 'Directory' })
  hl('DashboardMruTitle', { link = 'DashboardProjectTitle' })
  hl('DashboardMruIcon', { link = 'DashboardMruTitle' })
  hl('DashboardFiles', { fg = c.fg })
  hl('DashboardShotCutIcon', { fg = c.purple })

  -- Doom theme
  hl('DashboardDesc', { link = 'Directory' })
  hl('DashboardKey', { fg = c.purple })
  hl('DashboardIcon', { link = 'Directory' })
  hl('DashboardShotCut', { fg = c.fg })
end

return M
