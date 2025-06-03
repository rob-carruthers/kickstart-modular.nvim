local function open_cheatsheet()
  local buf = vim.api.nvim_create_buf(false, true) -- scratch buffer
  local cheatsheet_path = vim.fn.expand '~/.config/nvim/CHEATSHEET.md'
  local lines = vim.fn.readfile(cheatsheet_path)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].filetype = 'markdown'

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Optional: disable line numbers, etc.
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false
  vim.wo[win].wrap = true
end

vim.keymap.set('n', '<leader>cs', open_cheatsheet, { desc = 'Open cheat sheet' })
