-- disclaimer - most of this was LLM-generated because Lua
function InsertQueryToDf(db_name, as_polars)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local row = cursor[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  local var_name = nil
  local start_line = nil
  local end_line = nil

  -- Step 1: Find the start of the triple-quoted assignment
  for i = row - 1, 0, -1 do
    local line = lines[i]
    local assign = line:match '^%s*([%w_]+)%s*=%s*[\'"][\'"][\'"]'
    if assign then
      var_name = assign
      start_line = i
      break
    end
  end

  if not var_name then
    print 'No triple-quoted assignment found above cursor'
    return
  end

  -- Step 2: Find the end of the triple-quoted string
  for i = start_line + 1, #lines do
    if lines[i]:find '"""' then
      end_line = i
      break
    end
  end

  if not end_line then
    print 'Unclosed triple-quoted string'
    return
  end

  -- Step 3: Extract all unique :param identifiers
  local param_set = {}
  for i = start_line + 1, end_line - 1 do
    for param in lines[i]:gmatch ':%s*([%w_]+)' do
      param_set[param] = true
    end
  end

  local params = {}
  for param, _ in pairs(param_set) do
    table.insert(params, string.format('%s=%s', param, param))
  end
  table.sort(params)

  -- Step 4: Construct the function call line
  local param_str = table.concat(params, ', ')
  local as_polars_param = ''
  if as_polars then
    as_polars_param = ', as_polars=True'
  end
  local new_line = string.format('df = query_to_df("%s", %s%s%s%s)', db_name, var_name, as_polars_param, (#params > 0 and ', ' or ''), param_str)

  -- Step 5: Insert below the closing triple-quote
  vim.api.nvim_buf_set_lines(0, end_line + 1, end_line + 1, false, { new_line })
end

vim.keymap.set('n', '<leader>bqna', function()
  InsertQueryToDf('n!', false)
end, { desc = "Build query_to_df call using surrounding query from 'n!', return Pandas" })

vim.keymap.set('n', '<leader>bqno', function()
  InsertQueryToDf('n!', true)
end, { desc = "Build query_to_df call using surrounding query from 'n!', return Polars" })

vim.keymap.set('n', '<leader>bqma', function()
  InsertQueryToDf('m!', false)
end, { desc = "Build query_to_df call using surrounding query from 'm!', return Pandas" })

vim.keymap.set('n', '<leader>bqmo', function()
  InsertQueryToDf('m!', true)
end, { desc = "Build query_to_df call using surrounding query from 'm!', return Polars" })
