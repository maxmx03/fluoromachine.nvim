local function illuminate(c)
  local hl = require('fluoromachine.utils').set_hl

  hl('illuminatedWord', { bg = c.editor.selection })
  hl('illuminatedCurWord', { link = 'illuminatedWord' })
  hl('IlluminatedWordText', { link = 'illuminatedWord' })
  hl('IlluminatedWordRead', { link = 'illuminatedWord' })
  hl('IlluminatedWordWrite', { link = 'illuminatedWord' })
end

return illuminate
