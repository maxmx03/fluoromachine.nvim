---@type fm.highlights
local M = {
  load = function(opts)
    local hl = opts.utils.set_hl
    local darken = opts.color.darken
    local c = opts.colors

    hl('LspReferenceText', { link = 'Visual' }) -- used for highlighting "text" references
    hl('LspReferenceRead', { link = 'Visual' }) -- used for highlighting "read" references
    hl('LspReferenceWrite', { link = 'Visual' }) -- used for highlighting "write" references

    hl('LspInlayHint', { fg = darken(c.yellow, 35) }) -- used for highlighting inlay hints

    -- if you want to me to enable the highlight groups bellow, please send a screenshot for me to see how
    -- they look like or how to config for me to test.

    -- hl('LspCodelens') -- Used to color the virtual text of the codelens.
    -- hl('LspCodeLensSeparator') -- Used to color the separator between two or more code lenses.
    -- hl('LspSignatureActiveParameter') -- Used to highlight the active parameter in the signature help. See
  end,
}

return M
