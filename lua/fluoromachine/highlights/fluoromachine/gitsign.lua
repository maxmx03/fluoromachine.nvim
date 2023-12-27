local function gitsign(c)
  local utils = require('fluoromachine.utils')
  local hl = utils.set_hl

  hl('GitSignsAdd', { fg = c.git.add })       -- Used for the text of 'add' signs
  hl('GitSignsChange', { fg = c.git.change }) -- Used for the text of 'change' signs
  hl('GitSignsDelete', { fg = c.git.delete }) -- Used for the text of 'delete' signs
end

return gitsign
