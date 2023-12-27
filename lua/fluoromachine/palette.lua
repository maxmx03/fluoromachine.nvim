local M = {}

function M.get_colors()
  local config = require('fluoromachine.config').config
  local colors = {
    fluoromachine = {
      fg = '#8BA7A7',
      bg = '#262335',
      bgdark = '#241B2F',
      cyan = '#61E2FF',
      green = '#72F1B8',
      orange = '#FF8B39',
      pink = '#FC199A',
      purple = '#AF6DF9',
      red = '#FE4450',
      yellow = '#FFCC00',
      comment = '#495495',
      editor = {
        cursor_fg = '#282A36',
        cursor_bg = '#8BA7A7',
        currentline = '#463465',
        selection = '#463465',
        separator = '#495495',
      },
      diagnostic = {
        info = '#61E2FF',
        hint = '#61E2FF',
        warning = '#FF8B39',
        error = '#FE4450',
        ok = '#72F1B8',
      },
      git = {
        add = '#72F1B8',
        change = '#FF8B39',
        delete = '#FE4450',
      },
      lsp = {
        inlay_hint = '#8C57C7',
      },
      blankline = {
        deactivate = '#57367C',
        active = '#7E0C4D',
      },
    },
    retrowave = {
      fg = '#f8f8f8',
      bg = '#241B2F',
      bgdark = '#262335',
      cyan = '#61E2FF',
      green = '#72F1B8',
      orange = '#FF8b39',
      pink = '#FF7EDB',
      purple = '#AF6DF9',
      red = '#FE4450',
      yellow = '#FFCC00',
      comment = '#495495',
      editor = {
        cursor_fg = '#282a36',
        cursor_bg = '#F8F8F8',
        cursor_line_nr = '#F8F8F8',
        currentline = '#463465',
        selection = '#463465',
      },
      diagnostics = {
        info = '#61E2FF',
        hint = '#61E2FF',
        warning = '#FF8b39',
        error = '#FE4450',
        other = '#AF6DF9',
      },
      git = {
        add = '#72F1B8',
        change = '#FF8B39',
        delete = '#FE4450',
      },
      lsp = {
        inlay_hint = '#CC64AF',
      },
      blankline = {
        deactivate = '#57367C',
        active = '#39785C',
      },
    },
    delta = {
      fg = '#EFEFFD',
      bg = '#2B2233',
      bgdark = '#251d2b',
      cyan = '#98FFFB',
      green = '#C0FF98',
      orange = '#FFD298',
      pink = '#FF67D4',
      purple = '#D598FF',
      red = '#FF98B3',
      yellow = '#EDFF98',
      comment = '#925393',
      editor = {
        cursor_fg = '#282a36',
        cursor_bg = '#F8F8F8',
        cursor_line_nr = '#492949',
        currentline = '#492949',
        selection = '#492949',
      },
      diagnostics = {
        error = '#FF98B3',
        warning = '#ffd298',
        info = '#C0FF98',
        hint = '#C0FF98',
        other = '#D598FF',
      },
      git = {
        add = '#C0FF98',
        change = '#FFD298',
        delete = '#FF98B3',
      },
      lsp = {
        inlay_hint = '#99CC79',
      },
      blankline = {
        deactivate = '#492949',
        active = '#607F4C',
      },
    },
  }

  return colors[((config or {}).theme or 'fluoromachine')]
end

function M.extend_colors(colors)
  local default_colors = M.get_colors()
  return vim.tbl_deep_extend('force', default_colors, colors)
end

return M
