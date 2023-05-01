if vim.fn.has 'nvim-0.9.0' == 1 then
  vim.api.nvim_create_autocmd('LspTokenUpdate', {
    callback = function(args)
      local token = args.data.token

      if token.type ~= 'variable' or token.modifiers.readonly then
        return
      end

      local text = vim.api.nvim_buf_get_text(args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]

      if text ~= string.upper(text) then
        return
      end

      vim.lsp.semantic_tokens.highlight_token(token, args.buf, args.data.client_id, '@constant')
    end,
  })
end
