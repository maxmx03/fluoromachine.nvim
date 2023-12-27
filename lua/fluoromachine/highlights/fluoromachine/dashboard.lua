local function dashboard(c)
  local utils = require('fluoromachine.utils')
  local hl = utils.set_hl

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
  hl('DashboardShotCutIcon', { fg = c.purple })

  -- Doom theme
  hl('DashboardDesc', { link = 'Directory' })
  hl('DashboardKey', { fg = c.purple })
  hl('DashboardIcon', { link = 'Directory' })
  hl('DashboardShotCut', { fg = c.fg })
end

return dashboard
