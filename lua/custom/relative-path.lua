vim.keymap.set('n', '<leader>rp', function()
  local _, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()

  local matches = {}
  for s, quote, path, e in line:gmatch '()([\'"])(%./.-)%2()' do
    table.insert(matches, {
      start = tonumber(s),
      finish = tonumber(e) - 1,
      quote = quote,
      path = path,
    })
  end

  local match = nil
  for _, m in ipairs(matches) do
    if col + 1 >= m.start and col + 1 <= m.finish then
      match = m
      break
    end
  end

  if not match then
    print 'No relative quoted path under cursor.'
    return
  end

  local abs = vim.fn.fnamemodify(match.path, ':p')
  abs = abs:gsub('[/\\]$', '') -- remove trailing slash or backslash

  local prefix = ''
  if vim.bo.filetype == 'python' and abs:find '\\' then
    prefix = 'r'
  end

  local new_str = prefix .. match.quote .. abs .. match.quote
  local new_line = line:sub(1, match.start - 1) .. new_str .. line:sub(match.finish + 1)

  vim.api.nvim_set_current_line(new_line)
end, { desc = 'Replace relative path under cursor with absolute path' })
