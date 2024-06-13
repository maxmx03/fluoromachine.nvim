---@type fm.highlights
local M = {}

M.load = function(opts)
  local hl = opts.utils.set_hl
  local config = opts.config
  local c = opts.colors

  hl('NvimTreeSymlink', { link = 'Underlined' })
  hl('NvimTreeSymlinkIcon', { link = 'Directory' })
  -- hl('NvimTreeSymlinkFolderName') --   (Directory)
  hl('NvimTreeFolderName', { fg = c.fg }) -- (Directory)
  hl('NvimTreeRootFolder', { link = 'Title' })
  hl('NvimTreeFolderIcon', { link = 'Directory' })
  -- hl('NvimTreeOpenedFolderIcon') -- (NvimTreeFolderIcon)
  -- hl('NvimTreeClosedFolderIcon') -- (NvimTreeFolderIcon)
  -- hl('NvimTreeFileIcon')
  hl('NvimTreeEmptyFolderName', { fg = c.fg }) -- (Directory)
  -- hl('NvimTreeOpenedFolderName') -- (Directory)
  hl('NvimTreeExecFile', { link = 'Function' })
  hl('NvimTreeOpenedFile', { fg = c.yellow, bold = true })
  hl('NvimTreeModifiedFile', { fg = c.git.change })
  hl('NvimTreeSpecialFile', { link = 'Special' })
  -- hl('NvimTreeImageFile')
  hl('NvimTreeIndentMarker', { fg = c.comment })
  -- hl('NvimTreeLspDiagnosticsError') -- (DiagnosticError)
  -- hl('NvimTreeLspDiagnosticsWarning') -- (DiagnosticWarn)
  hl('NvimTreeLspDiagnosticsInformation') -- (DiagnosticInfo)
  hl('NvimTreeLspDiagnosticsHint') -- (DiagnosticHint)
  hl('NvimTreeGitDirty', { fg = c.git.change })
  hl('NvimTreeGitStaged', { fg = c.git.add })
  hl('NvimTreeGitMerge', { fg = c.git.change })
  hl('NvimTreeGitRenamed', { fg = c.git.add })
  hl('NvimTreeGitNew', { fg = c.git.add })
  hl('NvimTreeGitDeleted', { fg = c.git.delete })
  -- hl('NvimTreeGitIgnored') -- (Comment)
  -- hl('NvimTreeWindowPicker')
  hl('NvimTreeNormal', { fg = c.fg, bg = c.bgdark }, { transparent = config.transparent })
  hl('NvimTreeNormalFloat', { link = 'NvimTreeNormal' })
  hl('NvimTreeEndOfBuffer', { fg = c.bgdark }) -- (NonText)
  -- hl('NvimTreeCursorLine') -- (CursorLine)
  -- hl('NvimTreeCursorLineNr') -- (CursorLineNr)
  -- hl('NvimTreeLineNr') -- (LineNr)
  hl('NvimTreeWinSeparator', { fg = c.bgdark, bg = c.bgdark }, { transparent = config.transparent }) -- (WinSeparator)
  -- hl('NvimTreeCursorColumn') -- (CursorColumn)
  --
  -- There are also links for file highlight with git properties, linked to their
  -- Git equivalent:
  --
  -- hl('NvimTreeFileDirty') -- (NvimTreeGitDirty)
  -- hl('NvimTreeFileStaged') -- (NvimTreeGitStaged)
  -- hl('NvimTreeFileMerge') -- (NvimTreeGitMerge)
  -- hl('NvimTreeFileRenamed') -- (NvimTreeGitRenamed)
  -- hl('NvimTreeFileNew') -- (NvimTreeGitNew)
  -- hl('NvimTreeFileDeleted') -- (NvimTreeGitDeleted)
  -- hl('NvimTreeFileIgnored') -- (NvimTreeGitIgnored)
  -- hl('NvimTreeLiveFilterPrefix')
  -- hl('NvimTreeLiveFilterValue')
  -- hl('NvimTreeBookmark')
end

return M
